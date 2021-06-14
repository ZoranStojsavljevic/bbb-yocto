obj-m += cp15_SMC.o
cp15_SMC-objs += cp15_smc.o omap_smc.o

all:
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) modules

clean:
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) clean
