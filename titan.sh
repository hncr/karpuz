echo 0000:01:00.0 > /sys/bus/pci/drivers/radeon/unbind
echo 0000:01:00.1 > /sys/bus/pci/drivers/snd_hda_intel/unbind
#echo 0000:00:12.0 > /sys/bus/pci/drivers/ohci-pci/unbind
#echo 0000:00:12.2 > /sys/bus/pci/drivers/ehci-pci/unbind
modprobe vfio-pci
echo 1002 6811 > /sys/bus/pci/drivers/vfio-pci/new_id
echo 1002 aab0 > /sys/bus/pci/drivers/vfio-pci/new_id
#echo 1002 4397 > /sys/bus/pci/drivers/vfio-pci/new_id
#echo 1002 4396 > /sys/bus/pci/drivers/vfio-pci/new_id

sh titan-qemu.sh
echo $(date +%H:%M) >> titan.log
echo $? >> titan.log
echo 1 > /sys/bus/pci/devices/0000\:01\:00.0/remove
echo 1 > /sys/bus/pci/devices/0000\:01\:00.1/remove
#echo 1 > /sys/bus/pci/devices/0000\:00\:12.0/remove
#echo 1 > /sys/bus/pci/devices/0000\:00\:16.2/remove
echo 1 > /sys/bus/pci/rescan

