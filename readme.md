Bitcoin TX: How to verify signature with OpenSSL?
-------------------------------------------------

https://blockchain.info/tx/cca7507897abc89628f450e8b1e0c6fca4ec3f7b34cccf55f3f531c659ff4d79

Raw TX:

	01000000018dd4f5fbd5e980fc02f35c6ce145935b11e284605bf599a13c6d415db55d07a1000000008b4830450221009908144ca6539e09512b9295c8a27050d478fbb96f8addbc3d075544dc41328702201aa528be2b907d316d2da068dd9eb1e23243d97e444d59290d2fddf25269ee0e0141042e930f39ba62c6534ee98ed20ca98959d34aa9e057cda01cfd422c6bab3667b76426529382c23f42b9b08d7832d4fee1d6b437a8526e59667ce9c4e9dcebcabbffffffff0200719a81860000001976a914df1bd49a6c9e34dfa8631f2c54cf39986027501b88ac009f0a5362000000434104cd5e9726e6afeae357b1806be25a4c3d3811775835d235417ea746b7db9eeab33cf01674b944c64561ce3388fa1abd0fa88b06c44ce81e2234aa70fe578d455dac00000000

Parts:

	01000000018dd4f5fbd5e980fc02f35c6ce145935b11e284605bf599a13c6d415db55d07a100000000 

Input script: 

	8b4830450221009908144ca6539e09512b9295c8a27050d478fbb96f8addbc3d075544dc41328702201aa528be2b907d316d2da068dd9eb1e23243d97e444d59290d2fddf25269ee0e0141042e930f39ba62c6534ee98ed20ca98959d34aa9e057cda01cfd422c6bab3667b76426529382c23f42b9b08d7832d4fee1d6b437a8526e59667ce9c4e9dcebcabb
			
Last part: 

	ffffffff0200719a81860000001976a914df1bd49a6c9e34dfa8631f2c54cf39986027501b88ac009f0a5362000000434104cd5e9726e6afeae357b1806be25a4c3d3811775835d235417ea746b7db9eeab33cf01674b944c64561ce3388fa1abd0fa88b06c44ce81e2234aa70fe578d455dac00000000

Instruction:
			
1) Remove input script from transaction. We should remove bytes (do not forget about script len)

8b4830450221009908144ca6539e09512b9295c8a27050d478fbb96f8addbc3d
075544dc41328702201aa528be2b907d316d2da068dd9eb1e23243d97e444d59
290d2fddf25269ee0e0141042e930f39ba62c6534ee98ed20ca98959d34aa9e0
57cda01cfd422c6bab3667b76426529382c23f42b9b08d7832d4fee1d6b437a8
526e59667ce9c4e9dcebcabb

2) Replace it with the funding script to 17SkEw2md5avVNyYgj6RiXuQKNwkXaxFyQ

OP_DUP OP_HASH160 46af3fb481837fadbb421727f9959c2d32a36829 OP_EQUALVERIFY OP_CHECKSIG
19 76 a9 14 46af3fb481837fadbb421727f9959c2d32a36829 88 ac

(Do not forget about script length again!)

3) Append SIGHASH_ALL as 32-bit low-endian value. The result will be

01000000018dd4f5fbd5e980fc02f35c6ce145935b11e284605bf599a13c6d41
5db55d07a100000000 1976a91446af3fb481837fadbb421727f9959c2d32a368
2988ac ffffffff0200719a81860000001976a914df1bd49a6c9e34dfa8631f2c
54cf39986027501b88ac009f0a5362000000434104cd5e9726e6afeae357b180
6be25a4c3d3811775835d235417ea746b7db9eeab33cf01674b944c64561ce33
88fa1abd0fa88b06c44ce81e2234aa70fe578d455dac0000000001000000

This is **pizza.inphex**.

Decode raw tx:

	{
	  "txid": "cca7507897abc89628f450e8b1e0c6fca4ec3f7b34cccf55f3f531c659ff4d79",
	  "hash": "cca7507897abc89628f450e8b1e0c6fca4ec3f7b34cccf55f3f531c659ff4d79",
	  "version": 1,
	  "size": 300,
	  "vsize": 300,
	  "locktime": 0,
	  "vin": [
	    {
	      "txid": "a1075db55d416d3ca199f55b6084e2115b9345e16c5cf302fc80e9d5fbf5d48d",
	      "vout": 0,
	      "scriptSig": {
	        "asm": "30450221009908144ca6539e09512b9295c8a27050d478fbb96f8addbc3d075544dc41328702201aa528be2b907d316d2da068dd9eb1e23243d97e444d59290d2fddf25269ee0e[ALL] 042e930f39ba62c6534ee98ed20ca98959d34aa9e057cda01cfd422c6bab3667b76426529382c23f42b9b08d7832d4fee1d6b437a8526e59667ce9c4e9dcebcabb",
	        "hex": "4830450221009908144ca6539e09512b9295c8a27050d478fbb96f8addbc3d075544dc41328702201aa528be2b907d316d2da068dd9eb1e23243d97e444d59290d2fddf25269ee0e0141042e930f39ba62c6534ee98ed20ca98959d34aa9e057cda01cfd422c6bab3667b76426529382c23f42b9b08d7832d4fee1d6b437a8526e59667ce9c4e9dcebcabb"
	      },
	      "sequence": 4294967295
	    }
	  ],
	  "vout": [
	    {
	      "value": 5777.00000000,
	      "n": 0,
	      "scriptPubKey": {
	        "asm": "OP_DUP OP_HASH160 df1bd49a6c9e34dfa8631f2c54cf39986027501b OP_EQUALVERIFY OP_CHECKSIG",
	        "hex": "76a914df1bd49a6c9e34dfa8631f2c54cf39986027501b88ac",
	        "reqSigs": 1,
	        "type": "pubkeyhash",
	        "addresses": [
	          "1MLh2UVHgonJY4ZtsakoXtkcXDJ2EPU6RY"
	        ]
	      }
	    }, 
	    {
	      "value": 4223.00000000,
	      "n": 1,
	      "scriptPubKey": {
	        "asm": "04cd5e9726e6afeae357b1806be25a4c3d3811775835d235417ea746b7db9eeab33cf01674b944c64561ce3388fa1abd0fa88b06c44ce81e2234aa70fe578d455d OP_CHECKSIG",
	        "hex": "4104cd5e9726e6afeae357b1806be25a4c3d3811775835d235417ea746b7db9eeab33cf01674b944c64561ce3388fa1abd0fa88b06c44ce81e2234aa70fe578d455dac",
	        "reqSigs": 1,
	        "type": "pubkey",
	        "addresses": [
	          "13TETb2WMr58mexBaNq1jmXV1J7Abk2tE2"
	        ]
	      }
	    }
	  ],
	  "hex": "01000000018dd4f5fbd5e980fc02f35c6ce145935b11e284605bf599a13c6d415db55d07a1000000008b4830450221009908144ca6539e09512b9295c8a27050d478fbb96f8addbc3d075544dc41328702201aa528be2b907d316d2da068dd9eb1e23243d97e444d59290d2fddf25269ee0e0141042e930f39ba62c6534ee98ed20ca98959d34aa9e057cda01cfd422c6bab3667b76426529382c23f42b9b08d7832d4fee1d6b437a8526e59667ce9c4e9dcebcabbffffffff0200719a81860000001976a914df1bd49a6c9e34dfa8631f2c54cf39986027501b88ac009f0a5362000000434104cd5e9726e6afeae357b1806be25a4c3d3811775835d235417ea746b7db9eeab33cf01674b944c64561ce3388fa1abd0fa88b06c44ce81e2234aa70fe578d455dac00000000",
	  "blockhash": "0000000013ab9f8ed78b254a429d3d5ad52905362e01bf6c682940337721eb51",
	  "confirmations": 486299,
	  "time": 1274552768,
	  "blocktime": 1274552768
	}


### Links

- https://bitcoin.stackexchange.com/questions/32305/how-does-the-ecdsa-verification-algorithm-work-during-transaction/32308#32308
- https://bitcoin.stackexchange.com/questions/46455/verifying-a-bitcoin-trx-on-the-unix-cmd-line-with-openssl
- https://bitcoin.stackexchange.com/questions/41666/pem-format-for-ecdsa

Additional string for pubkey in this example:

3056301006072a8648ce3d020106052b8104000a034200 is a PEM_prestring 

	 der_string = "\x30{totallen}\x02\x01\x01\x04\x20{privkey}\xa0\x07\x06\x05\x2b\x81\x04\x00\x0a\xa1\x44\x03\x42\x00\x04{x}{y}" is for privkeys, 
	and der_string = "\x30{totallen}\x30\x10\x06\x07\x2a\x86\x48\xce\x3d\x02\x01\x06\x05\x2b\x81\x04\x00\x0a\x03\x42\x00 \x04{pubkey}" for pubkeys
	
cat pizza.keyraw | openssl pkey -pubin -inform der -text

