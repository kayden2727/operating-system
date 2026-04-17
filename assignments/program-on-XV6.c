#include "kernel/types.h"
#include "kernel/stat.h"
#include "user/user.h"

int main() {
    int p2c[2];
    int c2p[2];
    int pid;
    // char's in C are one byte
    char buffer = 'K';

    if (pipe(p2c) < 0) {
        printf("pipe failed\n");
        exit(1);
    }

    if (pipe(c2p) < 0) {
        printf("pipe failed\n");
        exit(1);
    }

    // Fork the child processes
    pid = fork();

    // Safety check 
    if (pid < 0) {
        printf("fork failed\n");
        exit(1);
    } else if (pid == 0) {
        close(p2c[1]);
        close(c2p[0]);

        char buf;
        for (int i = 0; i < 10000; i++) {
            read(p2c[0], &buf, 1);
            write (c2p[1], &buf, 1);
        }
        
        printf("%d received ping: ", getpid());

        close(p2c[0]);
        close(c2p[1]);
        exit(0);
    } else {
        close(p2c[0]);
        close(c2p[1]);

        char byte = 'X';
        char buf;
        int exchanges = 10000;

        int start_time = uptime();

        for (int i = 0; i < exchanges; i++) {
            write(p2c[1], &byte, 1);
            read(c2p[0], &buf, 1);
        }

        int end_time = uptime();

        int total_time = end_time - start_time;

        int exchanges_second = (exchanges * 10) / total_time;
        printf("Exchanges per second: %d\n", exchanges_second);

        printf("%d received pong: ", getpid());

        close(p2c[1]);
        close(c2p[0]);
        wait(0);
        exit(0);
    }


}

