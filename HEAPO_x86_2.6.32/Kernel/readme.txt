
설치 환경(Install Environment)
  - Ubuntu 10.04, 64bit

파일 위치
  - /usr/src/pos.c
  - /usr/src/pos.h
  - /usr/src/move.sh
  - /usr/src/POS.patch
  - /root/library-pos.tar.bz2

---------------------------------------------------------------------------------------

1. 커널 컴파일 등을 위한 페키지 다운로드 (Package download for kernel compile)

  # su root
  # cd /usr/src
  # apt-get install build-essential bin86 kernel-package libncurses5-dev

---------------------------------------------------------------------------------------

2. 커널 다운로드 및 압축해제 (Kernel source download)

  # wget -P /usr/src http://www.kernel.org/pub/linux/kernel/v2.6/linux-2.6.32.tar.bz2
  # tar xvfj linux-2.6.32.tar.bz2

---------------------------------------------------------------------------------------

3. 패치 적용 (Kernel Patch)

  # cp /home/qwerty/HEAPO/HEAPO_x86_2.6.32/Kernel/*.* /usr/src
  # chmod 777 move.sh
  # ./move.sh
  # patch -p0 < POS.patch

---------------------------------------------------------------------------------------
  
4. 커널 컴파일 및 부팅 커널 변경 (Kernel compile and change boot kernel)

  # cd linux-2.6.32
  # cp /boot/config-2.6.32-33-generic .config
  # make menuconfig
  메뉴컨피그 창이 뜨면 Load 를 선택하고, .config 를 불러온다.  
  (When popup menuconfig windows, select Load and load with .config)
  그리고 Save 하고 Exit.
  (And Exit after Save)
  
  # make-kpkg clean
  # make-kpkg --initrd --revision=pos1 kernel_image kernel_headers modules_image
  # cd /usr/src
  # dpkg -i linux*pos1*.deb
  # cd /boot
  # mkinitramfs -o initrd.img-2.6.32 2.6.32
  
  # vi /etc/default/grub
    GRUB_DEFAULT=2 // Linux 2.6.32로 지정
  # update-grub
  # reboot


update-grub 명령을 실행 시(When update-grub command implement)

sh: getcwd() failed: No such file or directory
sh: getcwd() failed: No such file or directory
/usr/sbin/grub-probe: error: out of memory.

위와 같은 메세지가 뜰 경우 아래의 명령어를 실행 뒤 update-grub 명령을 실행하면 됨.
If this message appear, you implement update-grub command after following command implement.

# cd /home/
# mkdir bugreprod
# cd bugreprod
# apt-get update

---------------------------------------------------------------------------------------

5. 공유 라이브러리 컴파일 (Shared library compile)

  # su root
  # cd /home/qwerty/HEAPO/HEAPO_x86_2.6.32/Library
  # chmod 777 install.sh
  # ./install.sh
  # vi /etc/ld.so.conf
 추가(append) usr/local/lib/
  # /sbin/ldconfig

라이브러리를 포함 시키기위해 컴파일 시
-L /usr/local/lib -lpos 또는 /usr/local/lib/libpos.so.0.0.0를
컴파일 옵션으로 포함시켜야함.
(When you compile it, including "-L /usr/local/lib -lpos" or "/usr/local/lib/libpos.so.0.0.0" compile option for include library.)

---------------------------------------------------------------------------------------

6. 테스트 코드 실행 (Test code implement)

  # su root
  # cd /home/qwerty/HEAPO/HEAPO_x86_2.6.32/Library
  # make
  # ./malloc-free create
  # ./malloc-free persistency

---------------------------------------------------------------------------------------




