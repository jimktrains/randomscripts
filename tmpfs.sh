#Creates a loopback on a tmp file and mounts it
#Should be run as root (sudo)
fstype=ext4
size=10000
file=`mktemp `
dir=`mktemp -d`
dd if=/dev/zero of=$file bs=1k count=$size
losetup /dev/loop0 $file
mke2fs -c /dev/loop0 $size
mount -t ext2 /dev/loop0 $dir

