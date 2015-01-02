
설치 환경
  - Ubuntu 10.04, 64bit

파일 위치
  - /root/kv/...
  - /usr/src/db-4.8.30.tar.gz

---------------------------------------------------------------------------------------

1. 컴파일 및 실험 환경 설정

	// BDB 컴파일 및 설치
	# cd /usr/src
	# tar xvfz db-5.1.29.tar.gz
	# cd db-5.1.29/build_unix
	# ../dist/configure --prefix=/usr
	# make
	# make install
	
	// POS_btree 및 main 함수 컴파일
	# cd /root/kv
	# make

	// 램디스크 설정
	# vi /etc/default/grub
	  //GRUB_CMDLINE_LINUX_DEFAULT= "~~ vmalloc=3G ramdisk_size=3145728" // no consistency
	  GRUB_CMDLINE_LINUX_DEFAULT= "~~ vmalloc=10G ramdisk_size=10485760"
	# update-grub
	
---------------------------------------------------------------------------------------

2. KV 실험 진행

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
