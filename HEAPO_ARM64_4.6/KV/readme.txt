
��ġ ȯ��
  - Ubuntu 10.04, 64bit

���� ��ġ
  - /root/kv/...
  - /usr/src/db-4.8.30.tar.gz

---------------------------------------------------------------------------------------

1. ������ �� ���� ȯ�� ����

	// BDB ������ �� ��ġ
	# cd /usr/src
	# tar xvfz db-5.1.29.tar.gz
	# cd db-5.1.29/build_unix
	# ../dist/configure --prefix=/usr
	# make
	# make install
	
	// POS_btree �� main �Լ� ������
	# cd /root/kv
	# make

	// ����ũ ����
	# vi /etc/default/grub
	  //GRUB_CMDLINE_LINUX_DEFAULT= "~~ vmalloc=3G ramdisk_size=3145728" // no consistency
	  GRUB_CMDLINE_LINUX_DEFAULT= "~~ vmalloc=10G ramdisk_size=10485760"
	# update-grub
	
---------------------------------------------------------------------------------------

2. KV ���� ����

	// POS_btree
	# cd /root/kv
	# ./main (separate/update) (100/200/300/400/500) (8/32/128/512) (btree/hash/list)
	
	// BDB_btree in ramdisk
	# mkfs.ext4 /dev/ram1
	# mount -t ext4 /dev/ram1 /mnt
	# cd /root/kv
	# ./main_bdb (insert/lookup/delete/update) (100/200/300/400/500) (8/32/128/512) (btree/hash)
	# umount /mnt
	# mount -t ext4 /dev/ram1 /mnt
	# ./main_bdb (insert/lookup/delete/update) (100/200/300/400/500) (8/32/128/512) (btree/hash)
	# rm /mnt/*

---------------------------------------------------------------------------------------
