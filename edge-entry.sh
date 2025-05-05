#!/bin/bash

# Use a default URL if none is provided
URL="${URL_TO_VISIT:-https://www.nationalgeographic.com}"

echo "Launching Microsoft Edge with URL: $URL"
microsoft-edge --no-sandbox --headless --disable-gpu --remote-debugging-port=9222 "$URL" &

sleep 300
