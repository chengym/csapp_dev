TOP=../..
include $(TOP)/config
include $(TOP)/Make.rules

CFLAGS += -I../include

OBJS = \
	waitprob3 \
	shellex \
	forkprob1 \
	forkprob7 \
	forkprob3 \
	signal2 \
	forkprob2 \
	signalprob0 \
	forkprob4 \
	forkprob0 \
	signal3 \
	restart \
	alarm \
	kill \
	waitpid2 \
	signal4 \
	forkprob8 \
	sigint1 \
	procmask1 \
	signal1 \
	waitprob0 \
	forkprob5 \
	counterprob \
	setjmp \
	waitpid1 \
	procmask2 \
	fork \
	waitprob1 \
	forkprob6

all: $(OBJS)

%.o: %.c
	echo CC $@
	$(CC) -c -o $*.o $(CFLAGS) $<

clean:
	echo "Cleaning all test service binaries ..."
	rm -f $(OBJS) *.o .depend
