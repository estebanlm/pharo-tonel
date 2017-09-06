Extension {
	#name : #ByteArray
}

{
	#category : #'*Network-Kernel',
	#timestamp : ' 8/31/2017 07:16:32'
}
ByteArray>>asSocketAddress [
	^SocketAddress fromOldByteAddress: self
]
