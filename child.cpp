#include <fcntl.h>
#include <semaphore.h>
#include <stdio.h>
#include <sys/mman.h>
#include <unistd.h>
#include <string>
#include <iostream>

int main(int argc, char *argv[])
{
    int file = open("output.txt", O_RDWR, 0666);

    if (file == -1)
    {
        return -1;
    }
    // берём из файла первые 1024 байта
    ftruncate(file, 1024);

    // создаём memory_map - общую память процессов
    char *buffer = (char *)mmap(NULL, 1024, PROT_READ | PROT_WRITE, MAP_SHARED, file, 0);
    // NULL - выбранное ядро(не выбрано)
    // 1024 байта - размер
    // PROT_READ | PROT_WRITE - доступ к чтению и записи
    //  MAP_SHARED - используется всеми процессами
    // memory_map создался на основе file и начинает чтение с 0 байта (смещение = 0)

    close(file);

    sem_t *sem = sem_open(argv[1], O_CREAT, 0777, 0); // открываем семафор

    if (sem == SEM_FAILED)
    {
        perror("Could not open semaphore");
        return -1;
    }

    int num = 0, sum = 0, i = 0;

    while (buffer[i] != '\n')
    {
        if (buffer[i] != ' ')
        {
            num *= 10;
            num += buffer[i] - '0';
        }
        else if (buffer[i] == ' ')
        {
            sum += num;
            num = 0;
        }
        ++i;
    }
    sum += num;
    num = 0;

    i = 0;
    std::string k = std::to_string(sum);
    for (char elem : k)
    {
        buffer[i++] = elem;
    }

    buffer[i + 1] = '\0';

    sem_post(sem);

    sem_close(sem);

    munmap(buffer, 1024);

    return 0;
}