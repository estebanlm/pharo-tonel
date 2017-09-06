"

"
Class {
	#name : #ZdcByteArrayManagerTests,
	#superclass : #TestCase,
	#category : #Zodiac-Tests,
	#timestamp : ''
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:32'
}
ZdcByteArrayManagerTests>>testClearing [
	| byteArrayManager one two |
	byteArrayManager := ZdcByteArrayManager new.
	byteArrayManager limit: 1.
	self assert: byteArrayManager totalSize equals: 0.
	one := (1 to: 10) asByteArray.
	byteArrayManager recycle: one.
	two := byteArrayManager byteArrayOfSize: 10 zero: true.
	self assert: one == two.
	self assert: two equals: (ByteArray new: 10)
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:32'
}
ZdcByteArrayManagerTests>>testSimple [
	| byteArrayManager byteArray |
	byteArrayManager := ZdcByteArrayManager new.
	byteArrayManager limit: 1.
	self assert: byteArrayManager totalSize equals: 0.
	byteArray := byteArrayManager byteArrayOfSize: 4096 zero: false.
	byteArrayManager recycle: byteArray.
	self assert: byteArrayManager totalSize equals: 4096.
	self assert: (byteArrayManager byteArrayOfSize: 4096 zero: false) == byteArray
]
