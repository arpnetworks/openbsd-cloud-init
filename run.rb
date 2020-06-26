require './cloud-init'

cdrom = CdRom.new("/dev/cd1")
cdrom.mount!


# Disable root password
Kernel.system("chpass -a 'root:*:0:0:daemon:0:0:Charlie &:/root:/bin/ksh'")

cdrom.umount!
