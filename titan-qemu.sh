PARAMS="$PARAMS -name titan "
PARAMS="$PARAMS -pidfile /tmp/titan.pid" 
PARAMS="$PARAMS -cpu host -enable-kvm" 
PARAMS="$PARAMS -smp 4,sockets=1,cores=4,threads=1" 
PARAMS="$PARAMS -m 6G" 
PARAMS="$PARAMS -drive format=raw,file=/mnt/titan.img,if=ide,media=disk" 
PARAMS="$PARAMS -machine type=pc,accel=kvm" 

#GPU Passtrough
PARAMS="$PARAMS -device vfio-pci,host=01:00.0,multifunction=on,romfile=174798.rom"
PARAMS="$PARAMS -device vfio-pci,host=01:00.1" 

#USB Pci-controller pass trough
#PARAMS="$PARAMS -device vfio-pci,host=00:12.0"
#PARAMS="$PARAMS -device vfio-pci,host=00:12.2"

#Spice and display for debug
PARAMS="$PARAMS -vga qxl -spice port=3001,disable-ticketing -soundhw hda" 
PARAMS="$PARAMS -device virtio-serial -chardev spicevmc,id=vdagent,debug=0,name=vdagent" 
PARAMS="$PARAMS -device virtserialport,chardev=vdagent,name=com.redhat.spice.0" 

#Spice mouse problem 
PARAMS="$PARAMS -usbdevice tablet" 

#USB device assign 
PARAMS="$PARAMS -usb -usbdevice host:17ef:6045 -usbdevice host:046d:c31c"

/usr/libexec/qemu-kvm $PARAMS


