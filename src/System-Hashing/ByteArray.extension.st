Extension {
	#name : #ByteArray
}

{
	#category : #'*System-Hashing-Core',
	#timestamp : ' 8/31/2017 07:16:11'
}
ByteArray>>asByteArrayOfSize: size [
	"
		'34523' asByteArray asByteArrayOfSize: 100.

	(((
		| repeats bytes | 
		repeats := 1000000.
		bytes := '123456789123456789123456789123456789123456789123456789' asByteArray.
		 [repeats timesRepeat: (bytes asByteArrayOfSize: 1024) ] timeToRun.
	)))"

	| bytes |
	size < self size
		ifTrue: [^ self error: 'bytearray bigger than ', size asString].
	bytes := self asByteArray.
	^ (ByteArray new: (size - bytes size)), bytes

]

{
	#category : #'*System-Hashing-Core',
	#timestamp : ' 8/31/2017 07:16:11'
}
ByteArray>>asInteger [
	"Convert me to an Integer, network byte order, most significant byte first, big endian"
	
	| integer |
	integer := 0.
	self withIndexDo: [ :each :index | 
		integer := integer + (each bitShift: (self size - index) * 8) ].
	^ integer
]

{
	#category : #'*System-Hashing-Core',
	#timestamp : ' 8/31/2017 07:16:11'
}
ByteArray>>bitXor: aByteArray  [
	| answer |
	answer := self copy.
	1 
		to: (self size min: aByteArray size)
		do: 
			[ :each | 
			answer 
				at: each
				put: ((self at: each) bitXor: (aByteArray at: each)) ].
	^ answer
]

{
	#category : #'*System-Hashing-Core',
	#timestamp : ' 8/31/2017 07:16:11'
}
ByteArray>>destroy [
	1 to: self size do: 
		[ : x |
		self at: x put: 0 ]
]
