#include <fcntl.h>
#include <semaphore.h>
#include <stdio.h>
#include <sys/mman.h>
#include <unistd.h>
#include <string>
#include <iostream>

int main(int argc, char *argv[])
{
    FILE *file = fopen("output.txt", "r");
    int common_memory = open("com_mem.txt", O_RDWR | O_CREAT, 0666);

    if (common_memory == -1)
    {
        return -1;
    }
    // берём из файла первые 1024 байта
    ftruncate(common_memory, 1024);

    // создаём memory_map - общую память процессов
    char *buffer = (char *)mmap(NULL, 1024, PROT_READ | PROT_WRITE, MAP_SHARED, common_memory, 0);
    // NULL - выбранное ядро(не выбрано)
    // 1024 байта - размер
    // PROT_READ | PROT_WRITE - доступ к чтению и записи
    //  MAP_SHARED - используется всеми процессами
    // memory_map создался на основе file и начинает чтение с 0 байта (смещение = 0)
    close(common_memory);

    sem_t *sem = sem_open(argv[1], O_CREAT, 0777, 0); // открываем семафор

    if (sem == SEM_FAILED)
    {
        perror("Could not open semaphore");
        return -1;
    }

    int num = 0, sum = 0, i = 0;
    char symb;

    while ((symb = getc(file)) != '\n')
    {
        if (symb != ' ')
        {
            num *= 10;
            num += symb - '0';
        }
        else if (symb == ' ')
        {
            sum += num;
            num = 0;
        }
        ++i;
    }
    fclose(file);
    sum += num;
    num = 0;

    i = 0;
    std::string k = std::to_string(sum);
    for (char &elem : k)
    {
        buffer[i++] = elem;
    }

    buffer[i] = '\0';

    sem_post(sem);

    sem_close(sem);

    munmap(buffer, 0);

    return 0;
}