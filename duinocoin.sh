#!/bin/bash
# https://github.com/AzagraMac/DuinoCoinTelegramBot
# modified by JK Rolling

TOKEN="YOUR_TOKEN_BOT"
ID="YOUR_CHAT_ID"
WALLET="YOUR_USERNAME_WALLET"
URL="https://api.telegram.org/bot$TOKEN/sendMessage"
MSG="ᕲ DuinoCoin"
JSON=$(curl -s -X GET https://server.duinocoin.com/users/$WALLET -H "Accept: application/json" | jq .)
#EURO=$(curl -s -X GET http://www.floatrates.com/daily/usd.json -H "Accept: application/json" | jq .eur | jq '.rate')
BALANCE=$(echo $JSON | jq '.result.balance.balance')
WORKERS=$(echo $JSON | jq '.result.miners' | jq '.[].identifier')
WORKERS_STR=${WORKERS//$'\n'/,}
NUMBER_WORKERS=$(echo $JSON | jq -r '.result.miners' | jq -r '.[].identifier' | wc -l)
FORMAT1=$(echo "scale=2; $BALANCE/1" | bc -l)
#FORMAT2=$(echo "scale=2; $EURO/1" | bc -l)

if [ $? -ne 0 ]
then
        exit 0
else
        # user to update the path to 'duco_report.py'
        # cd /home/pi/duco_report && python3 ./duco_report.py $FORMAT1 $NUMBER_WORKERS "$WORKERS_STR"
        /usr/bin/curl -s -X POST $URL \
                -d chat_id=$ID \
                -d parse_mode=HTML \
                -d text="$(printf "$MSG\n\t\t- \U1FA99 Balance: <code>$FORMAT1 ᕲ</code>\n\t\t- \U26CF Nº Workers $NUMBER_WORKERS:\n<code>$WORKERS</code>")" \
                > /dev/null 2>&1
        exit 0
fi
