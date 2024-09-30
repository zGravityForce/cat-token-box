#!/bin/bash
while true; do
    fee=$(curl -sb GET https://explorer.unisat.io/fractal-mainnet/api/bitcoin-info/fee | jq -r '.data' | jq -r '.fastestFee')
    addition_fee=0
    exe_fee=`expr $fee + $addition_fee`
    echo $exe_fee
    command="yarn cli mint -i 59d566844f434e419bf5b21b5c601745fcaaa24482b8d68f32b2582c61a95af2_0 10  --fee-rate $exe_fee"
    $command
    if [ $? -ne 0 ]; then
        echo "命令执行失败，退出循环"
        exit 1
    fi
    sleep 1
done