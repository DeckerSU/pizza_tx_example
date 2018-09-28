#!/bin/bash
xxd -r -p <komodo.inphex >komodo.inpraw
hexdump -C komodo.inpraw
cat komodo.sighex
echo
xxd -r -p <komodo.sighex >komodo.sigraw
xxd -r -p <komodo.keyhex >komodo.keyraw
cat komodo.keyhex
echo
xxd -r -p <komodo.keyhex | openssl pkey -pubin -inform der >komodo.keypem
openssl pkey -pubin -inform der -text -noout -in komodo.keyraw 

# First and fundamentally, bitcoin uses an unconventional (arguably nonstandard) scheme where the data is 
# double-hashed before the nonceG,kinv(hash+nonceimage) calculation and corresponding verification. 
# dgst -sign/-verify only does the standard single hash, so you must either hash first and then use 
# dgst -sign/verify or hash twice and then use pkeyutl -sign/verify.

openssl sha256 <komodo.inpraw -binary >komodo.hash1; xxd komodo.hash1
openssl sha256 <komodo.hash1 -verify komodo.keypem -signature komodo.sigraw
openssl dgst -sha256 -verify komodo.keypem -signature komodo.sigraw komodo.hash1

openssl sha256 <komodo.hash1 -binary >komodo.hash2; xxd komodo.hash2
openssl pkeyutl <komodo.hash2 -verify -pubin -inkey komodo.keypem -sigfile komodo.sigraw
openssl pkeyutl -verify -pubin -inkey komodo.keypem -sigfile komodo.sigraw -in komodo.hash2