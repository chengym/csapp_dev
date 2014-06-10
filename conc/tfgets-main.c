/* $begin tfgetsmain */
#include "csapp.h"

static char *tfgets(char *s, int size, FILE * stream)
{
    return NULL;
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
