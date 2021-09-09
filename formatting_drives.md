# Formatting Drives

## Creating New Partitions

Verify current partitions
`fdisk -l`




## USB Drives

Locate Drive

`df`

Look for similar to:

` /dev/sdb1`


Unmount Disk

`sudo umount /dev/sdb1 `

To format as FAT32

`sudo mkfs.vfat /dev/sdb1`

Verify Completion

`sudo fsck /dev/sdb1`

A USB drive with no files indicates successful formatting
