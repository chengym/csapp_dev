TOP=../..
include $(TOP)/config
include $(TOP)/Make.rules

CFLAGS += -I../include

OBJS = badcnt ctime_ts norace tfgets-main select race echoservers sharing \
	   echoservert_pre rand_r echoserverp echoservert hello hellobug psum rand  

all: $(OBJS)

echoservert_pre: echoservert_pre.o sbuf.o
	@$(CC) $^ $(LDLIBS) -o $@

%.o: %.c
	@echo CC $@
	@$(CC) -c -o $*.o $(CFLAGS) $<

clean:
	@echo "Cleaning all test service binaries ..."
	@rm -f $(OBJS) $(OBJ_FILE) .depend
