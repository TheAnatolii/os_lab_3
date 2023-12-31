#include <fcntl.h>
#include <semaphore.h>
#include <stdio.h>
#include <sys/mman.h>
#include <sys/wait.h>
#include <unistd.h>
#include <string>
#include <iostream>

int main(int argc, char *argv[])
{
    // считываем и открываем файл
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

    sem_t *sem = sem_open("mmap_sem", O_CREAT, 0777, 0); // открываем семафор

    if (sem == SEM_FAILED)
    {
        perror("Could not open semaphore");
        return -1;
    }

    // Forking the process
    int id = fork();
    if (id == -1) // fork error
    {
        return 2;
    }
    if (id == 0)
    { // child process

        execlp("./child", "./child", "mmap_sem", NULL);
        return 3;
    }
    else
    { // parent process
        sem_wait(sem);

        std::cout << buffer << std::endl;

        munmap(buffer, 0);
        sem_close(sem);
        sem_unlink("mmap_sem");
    }

    return 0;
}