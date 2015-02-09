/* $begin tfgetsmain */
#include "csapp.h"

#include <stdio.h>
#include <setjmp.h>

#include <unistd.h>
#include <signal.h>

static sigjmp_buf env;

static void signal_handler(int signo)
{
    const int TIME_OUT = 1;

    if (signo == SIGALRM)
        siglongjmp(env, TIME_OUT);
}

static char *tfgets(char *s, int size, FILE * stream)
{
    /* The following code was token from common/csapp.c, Signal() implemation */
    struct sigaction action, old_action;
    action.sa_handler = signal_handler;
    sigemptyset(&action.sa_mask);       /* block sigs of type being handled */
    action.sa_flags = SA_RESTART;       /* restart syscalls if possible */
    if (sigaction(SIGALRM, &action, &old_action) < 0) {
        perror("sigaction");
        return NULL;
    }

    unsigned int max_waiting = 5;       /* seconds */
    alarm(max_waiting);

    int rc;
    rc = sigsetjmp(env, 1);     /* saving signal mask in env */
    if (rc == 0) {
        return fgets(s, size, stream);
    } else {                    /* time out */
        return NULL;
    }
}
int main()
{
    char buf[MAXLINE];

    if (tfgets(buf, MAXLINE, stdin) == NULL)
        printf("BOOM!\n");
    else
        printf("%s", buf);

    exit(0);
}

/* $end tfgetsmain */
