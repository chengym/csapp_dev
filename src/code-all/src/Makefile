TOP = ../../../build
include $(TOP)/config
include $(TOP)/Make.rules

INC = ../include
CFLAGS += -I$(INC) -fPIC -shared

OBJS := clock.o fcyc.o csapp.o lsquare.o cpe.o
SHARED_CSAPP = libcsapp.so
all: $(SHARED_CSAPP) 

$(SHARED_CSAPP):$(OBJS)
	@$(CC) $(CFLAGS) -o $@ $^
	@sudo $(CP) $@ $(HOST_LIB)
	@echo "Finish build $@"

clean:
	@$(RM) $(OBJS) $(SHARED_CSAPP) $(SHARED_CSAPP)
	@echo "Finish clean..."
