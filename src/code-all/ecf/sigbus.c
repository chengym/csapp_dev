#include "csapp.h"

#define START 5
#define END   1<<30
#define INCR  128

char *strsignal(int sig);

int i;

void handler(int sig)
{
    printf("%d\n", i);
    if (sig == SIGBUS) {
        printf("caught %s\n", strsignal(sig));
        exit(0);
    }
    return;
}

int main()
{
    volatile int x;

    Signal(SIGSEGV, handler);
    Signal(SIGBUS, handler);

    for (i = START; i < END; i += INCR) {
        x = *(int *) i;
        *(int *) i = x;
        /*      printf("x=%d\n", x); */
    }
    exit(0);
}
