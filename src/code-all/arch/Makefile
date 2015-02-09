CC = gcc
CFLAGS = -O -m32

pushpoptest: pushpoptest.c pp.s
	$(CC) $(CFLAGS) -o pushpoptest pushpoptest.c pp.s

clean:
	rm -fr pushpoptest
