#!/bin/bash
# https://medium.com/coinmonks/how-to-generate-a-bitcoin-address-step-by-step-9d7fcbf1ad0b
privkey=a966eb6058f8ec9f47074a2faadd3dab42e2c60ed05bc34d39d6c0e1d32b8bdf
openssl ec -inform DER -text -noout -in <(cat <(echo -n "302e0201010420") <(echo -n "$privkey") <(echo -n "a00706052b8104000a") | xxd -r -p) 
openssl ec -inform DER -text -noout -in <(cat <(echo -n "302e0201010420") <(echo -n "$privkey") <(echo -n "a00706052b8104000a") | xxd -r -p) 2>/dev/null | tail -6 | head -5 | sed 's/[ :]//g' | tr -d '\n' && echo

openssl ec -inform DER -text -conv_form compressed -in <(cat <(echo -n "302e0201010420") <(echo -n "$privkey") <(echo -n "a00706052b8104000a") | xxd -r -p) -outform PEM -pubout

openssl ec -inform DER -conv_form compressed -in <(cat <(echo -n "302e0201010420") <(echo -n "$privkey") <(echo -n "a00706052b8104000a") | xxd -r -p) -outform PEM -pubout -out pubkey.pem
openssl ec -inform DER -conv_form compressed -in <(cat <(echo -n "302e0201010420") <(echo -n "$privkey") <(echo -n "a00706052b8104000a") | xxd -r -p) -outform DER -pubout -out pubkey.raw
openssl pkey -pubin -inform der -text -in pubkey.raw 
