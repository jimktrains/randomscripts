#mounts an encrypted loopback
#Should be run as root (sudo)
fstype=ext4
size=10000
file=$1
mapper=`basename $file`
dir=$2
losetup /dev/loop0 $file
sudo cryptsetup --verbose --verify-passphrase luksFormat /dev/loop0
sudo cryptsetup luksOpen /dev/loop0 $mapper
sudo mkfs.ext4 /dev/mapper/$mapper
mount /dev/mapper/special $dir

