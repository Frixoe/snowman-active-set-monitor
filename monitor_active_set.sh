#!/bin/bash

VALIDATOR_NODE_ID="NodeID-MWNqxgXd8itY143jaNyq8aMYTeV1RXJgS"
API_KEY="TELEGRAM_BOT_API_KEY"
CHANNEL_ID="CHAT_ID"
MESSAGE='Flare Validator not in Active Set!'
URL="https://api.telegram.org/bot$API_KEY/sendMessage"

curl -s -X POST $URL -d chat_id=$CHANNEL_ID -d text="Starting active set monitoring!"

while true; do
        echo -e "\nChecking active set..."

        found=$(curl -s -X POST -H "Content-Type: application/json" --data '{ "jsonrpc":"2.0", "id" :1, "method" :"platform.getCurrentValidators", "params" :{} }' http://localhost:9650/ext/P | jq . | grep $VALIDATOR_NODE_ID)

        if [ -z "$found" ]; then
                curl -s -X POST $URL -d chat_id=$CHANNEL_ID -d text="$MESSAGE"
        fi

        sleep 60
done
