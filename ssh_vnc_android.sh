#!/bin/sh
adb=/usr/bin/adb

id1=0123456789ABCDEF       
id2=G000K107616204ER       
id3=5RE0217B17000565


# id2=2db4a6b6

echo "known id:" $id1 $id2 $id3 " pick up one of them: (1(max),2,3(huawei))"
choice=""
read choice
case "$choice" in
    "1") id=$id1
	 ;;
    "2") id=$id2
	 ;;
    "3") id=$id3
	 ;;
esac

echo $id

sudo $adb start-server
$adb -s $id forward tcp:2222 tcp:22
echo "passward 1234"
ssh -R 5900:localhost:5900 chengzhengqian@localhost -p 2222
