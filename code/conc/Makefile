TOP=../..
include $(TOP)/config
include $(TOP)/Make.rules

CFLAGS += -I../include -Wall

SRCS := $(wildcard *.c)
OBJS := $(patsubst %.c,%.o,$(SRCS))
BIN  := $(patsubst %.c,%.bin,$(SRCS))

LDLIBS=-L../../lib -lcsapp $(EXTRALIBS)
all: $(BIN) $(OBJS)

%.bin:%.o
	@echo LINK $@
	@$(CC) $^ $(LDLIBS) -o $@
	@$(OBJCOPY) -O binary -R .note -R .comment -S $@
	@$(CP) $@ ../../bin

%.o: %.c
	@echo CC $@
	@$(CC) -c -o $*.o $(CFLAGS) $<

clean:
	@echo "Cleaning all test service binaries ..."
	@rm -f $(OBJS) $(BIN) .depend
	@rm -f $(addprefix ../../bin/, $(BIN))

