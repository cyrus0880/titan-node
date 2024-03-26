#!/bin/bash
/app/titan-edge daemon start --init --url https://test-locator.titannet.io:5000/rpc/v0 &
sleep 10
/app/titan-edge bind --hash=$TOKEN https://api-test1.container1.titannet.io/api/v2/device/binding &

exec "$@" 