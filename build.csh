{\rtf1\ansi\ansicpg1252\cocoartf2708
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fnil\fcharset0 Menlo-Regular;\f1\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;\red0\green0\blue0;}
{\*\expandedcolortbl;;\csgray\c0;}
\paperw11900\paperh16840\margl1440\margr1440\vieww11520\viewh8400\viewkind0
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural\partightenfactor0

\f0\fs22 \cf2 \CocoaLigature0 #! /bin/csh\
\

\f1\fs24 \cf0 \CocoaLigature1 #1. Get installer:\

\f0\fs22 \cf2 \CocoaLigature0 #
\f1\fs24 \cf0 \CocoaLigature1 	
\f0\fs22 \cf2 \CocoaLigature0 wget https://download.freebsd.org/releases/arm64/aarch64/ISO-IMAGES/13.1/FreeBSD-13.1-RELEASE-arm64-aarch64-mini-memstick.img\
	wget https://cdn.openbsd.org/pub/OpenBSD/7.2/arm64/miniroot72.img\
\

\f1\fs24 \cf0 \CocoaLigature1 #
\f0\fs22 \cf2 \CocoaLigature0 2. Copy to SD card:\
#	sudo umount /dev/disk2sx\
	dd if=./FreeBSD-13.1-RELEASE-arm64-aarch64-mini-memstick.img of=./OpenBSD-NanoPi-R2S.img bs=1M\
	dd if=./OpenBSD-miniroot72.img of=./OpenBSD-NanoPi-R2S.img bs=1M\
\
#3. Get boot loader:\
	wget http://uk.mirrors.fossho.st/armbian/apt/pool/main/l/linux-u-boot-nanopi-r2s-current/linux-u-boot-current-nanopi-r2s_22.11.4_arm64.deb\
	mkdir uboot\
	cd uboot\
	ar x ../linux-u-boot-current-nanopi-r2s_22.11.4_arm64.deb\
	tar Jxvf data.tar.xz\
	cd ..\
\
#4. Copy boot loader to SD card:\
	dd if=./uboot/usr/lib/linux-u-boot-current-nanopi-r2s_22.11.4_arm64/idbloader.bin of=./OpenBSD-NanoPi-R2S.img seek=64 conv=notrunc\
	dd if=./uboot/usr/lib/linux-u-boot-current-nanopi-r2s_22.11.4_arm64/uboot.img of=./OpenBSD-NanoPi-R2S.img seek=16384 conv=notrunc\
	dd if=./uboot/usr/lib/linux-u-boot-current-nanopi-r2s_22.11.4_arm64/trust.bin of=./OpenBSD-NanoPi-R2S.img seek=24576 conv=notrunc}