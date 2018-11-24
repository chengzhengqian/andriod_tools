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

#general tools to control android device to switch between varies activity
cmd=""
while [  "$cmd"  !=  "q"  ]
do
    echo "s (setting) f (fullscreen) k (kingroot) v (vnc) g (gnuroot) l (linux deploy) i (input) p(ower button) sp(search package) ki(vy) m(menu button)"
    read cmd
    case "$cmd" in
        "s") $adb -s $id shell am start -a android.settings.SETTINGS
            ;;
        "f") $adb -s $id shell monkey -p de.tsorn.FullScreen -c android.intent.category.LAUNCHER 1
            ;;
        "k") $adb -s $id shell monkey -p com.kingroot.kinguser -c android.intent.category.LAUNCHER 1
            ;;
        "ki") $adb -s $id shell monkey -p org.kivy.pygame -c android.intent.category.LAUNCHER 1
            ;;
        "v") $adb -s $id shell monkey -p com.iiordanov.freebVNC  -c android.intent.category.LAUNCHER 1
            ;;
        "g") $adb -s $id shell monkey -p com.gnuroot.debian -c android.intent.category.LAUNCHER 1
            ;;
        "l") $adb -s $id shell monkey -p  ru.meefik.linuxdeploy -c android.intent.category.LAUNCHER 1
            ;;
        "i") echo "input text:"
            read text
            $adb -s $id shell input text $text
            ;;
	"p") $adb -s $id shell input keyevent 26
	     ;;
	"m") $adb -s $id shell input keyevent 82
	     ;;
	"sp") echo "keywords:"
	      read keywords
	      # echo $keywords
	      $adb -s $id shell pm list packages | grep $keywords
	      
    esac
done

