ROOT = ../../..
include $(ROOT)/build/config
include $(ROOT)/build/Make.rules

CSAPP_INC = ../include

CFLAGS += -I$(CSAPP_INC) -I.

PROGS =	\
	badcnt\
	hello \
	goodcnt\
	echoclient\
	echoserveri\
	echoservers\
	echoserverp\
	echoservert\
	echoservert_cnt\
	echoservert_pre\
	ctime_ts\
	race\
	norace\
	sharing\
	rand\
	rand_r\
	threadunsafe\
	hellobug\
	tfgets-main.o\
	select\
	psum\
	vsum\
	rw0.o\
	rw1.o\
	rw2.o\
	rw3.o

all: $(PROGS)

echoserveri: echoserveri.o echo.o
	@$(CC) $^ $(LDLIBS) -o $@

echoserverp: echoserverp.o echo.o
	@$(CC) $^ $(LDLIBS) -o $@

echoservert: echoservert.o echo.o
echoservert_cnt: echoservert_cnt.o echo_cnt.o
echoservert_pre: echoservert_pre.o echo_cnt.o sbuf.o
echoservers: echoservers.o echo.o
select: select.o echo.o

clean:
	rm -f $(PROGS) *.o *~
