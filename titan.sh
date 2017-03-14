echo 0000:01:00.0 > /sys/bus/pci/drivers/radeon/unbind
echo 0000:01:00.1 > /sys/bus/pci/drivers/snd_hda_intel/unbind
modprobe vfio-pci
echo 1002 6811 > /sys/bus/pci/drivers/vfio-pci/new_id
echo 1002 aab0 > /sys/bus/pci/drivers/vfio-pci/new_id
titan-qemu.sh
echo 1 > /sys/bus/pci/devices/0000\:01\:00.0/remove
echo 1 > /sys/bus/pci/devices/0000\:01\:00.1/remove
echo 1 > /sys/bus/pci/rescan

