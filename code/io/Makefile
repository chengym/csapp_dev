TOP=../..
include $(TOP)/config
include $(TOP)/Make.rules

CFLAGS += -I../include

OBJS = cpfile cpstdin statcheck

all: $(OBJS)

%.o: %.c
	@echo CC $@
	@$(CC) -c -o $*.o $(CFLAGS) $<

clean:
	@echo "Cleaning all test service binaries ..."
	@rm -f $(OBJS) $(OBJ_FILE) .depend
