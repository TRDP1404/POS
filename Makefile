GPPPARAMS = -m32 -fno-use-cxa-atexit -nostdlib -fno_builtin -fno-rtti -fno-exceptions -fno-leading-underscore
ASPARAMS = --32
LDPARAMS = -melf_i386

objs = loader.o kernel.o

%.o: %.cpp
	g++ $(GPPPARAMS) -o $@ -c $<

%.o: %.s
	as $(ASPARAMS) -o $@ $<

kernel.bin: linker.ld $(objs)
	ld $(LDPARAMS) -T $< -o $@ $(objs)

install: kernel.bin
	sudo cp $< /boot/kernel.bin