#!/bin/sh

source $HOME/.variables.sh

URL="https://api.telegram.org/bot$TOKEN/sendMessage"
TIMEOUT="10"
IN="$*"

DEV_OUT=""
while true
do
	if [ ! $DEV_OUT ]; then
		read -p "Device output? " DEV_OUT
		DEV_OUT=`find /media -maxdepth 1 -type d -iname '*'$DEV_OUT'*'`
		if [ ! $DEV_OUT ]; then
			echo "I didn't found this device."
			continue
		fi
		read -p "I found $DEV_OUT, you want use it? [Yn]: " -r -n 1
		REPLY=${REPLY:-Y}

		case "$REPLY" in
			y|Y ) break;;
			* ) DEV_OUT="" && echo && continue;;
		esac
	fi
done

TEXT="Copia completata"

for RES in $IN; do
	if [ ${RES:0:1} == "/" ]; then 
		ERROR="$(cp "$RES" $DEV_OUT 2>&1 > /dev/null)"
	else
		ERROR="$(cp $PWD/"$RES" $DEV_OUT 2>&1 > /dev/null)"
	fi

	if [ $ERROR ]; then
		#TEXT+="%0A\`'$RES'\`"
	#else
		TEXT="Copia non riuscita %0A\`$ERROR\`%0A"
		break
	fi
done

wget -q -T $TIMEOUT -O /dev/null \
	--post-data="chat_id=$CHAT_ID&disable_web_page_preview=1&text=$TEXT&parse_mode=Markdown" \
	$URL > /dev/null 2>&1
