#!/bin/bash
xxd -r -p <pizza.inphex >pizza.inpraw
hexdump -C pizza.inpraw
cat pizza.sighex
echo
xxd -r -p <pizza.sighex >pizza.sigraw
cat pizza.keyhex
echo
xxd -r -p <pizza.keyhex | openssl pkey -pubin -inform der >pizza.keypem

# First and fundamentally, bitcoin uses an unconventional (arguably nonstandard) scheme where the data is 
# double-hashed before the nonceG,kinv(hash+nonceimage) calculation and corresponding verification. 
# dgst -sign/-verify only does the standard single hash, so you must either hash first and then use 
# dgst -sign/verify or hash twice and then use pkeyutl -sign/verify.

openssl sha256 <pizza.inpraw -binary >pizza.hash1; xxd pizza.hash1
openssl sha256 <pizza.hash1 -verify pizza.keypem -signature pizza.sigraw
openssl dgst -sha256 -verify pizza.keypem -signature pizza.sigraw pizza.hash1

openssl sha256 <pizza.hash1 -binary >pizza.hash2; xxd pizza.hash2
openssl pkeyutl <pizza.hash2 -verify -pubin -inkey pizza.keypem -sigfile pizza.sigraw
openssl pkeyutl -verify -pubin -inkey pizza.keypem -sigfile pizza.sigraw -in pizza.hash2