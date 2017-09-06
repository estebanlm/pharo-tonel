"
Common superclass for hash functions
"
Class {
	#name : #HashFunction,
	#superclass : #Object,
	#category : #System-Hashing-Core,
	#timestamp : 'TorstenBergmann 1/31/2014 10:15'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:11'
}
HashFunction class>>blockSize [
	^ self subclassResponsibility
]

{
	#category : #hashing,
	#timestamp : ' 8/31/2017 07:16:11'
}
HashFunction class>>hashMessage: aStringOrByteArray [
	^ self new hashMessage: aStringOrByteArray
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:11'
}
HashFunction class>>hashSize [
	^ self subclassResponsibility
]

{
	#category : #hashing,
	#timestamp : ' 8/31/2017 07:16:11'
}
HashFunction class>>hashStream: aPositionableStream [
	^ self new hashStream: aPositionableStream
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:11'
}
HashFunction>>blockSize [
	^ self class blockSize
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:11'
}
HashFunction>>doubleHashMessage: aStringOrByteArray [
	"SHA1 new doubleHashMessage: 'foo'"
	^ self doubleHashStream: aStringOrByteArray asByteArray readStream
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:11'
}
HashFunction>>doubleHashStream: aStream [
	^ self hashStream: ((self hashStream: aStream) asByteArray readStream)
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:11'
}
HashFunction>>hashMessage: aStringOrByteArray [
	"MD5 new hashMessage: 'foo'"
	^ self hashStream: aStringOrByteArray asByteArray readStream
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:11'
}
HashFunction>>hashSize [
	^ self class hashSize
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:11'
}
HashFunction>>hashStream: aStream [
	^ self subclassResponsibility
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 07:16:11'
}
HashFunction>>hmac [
	^ HMAC on: self
]
