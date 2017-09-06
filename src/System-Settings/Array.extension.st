Extension {
	#name : #Array
}

{
	#category : #'*System-Settings-Browser',
	#timestamp : ' 8/31/2017 05:26:16'
}
Array>>settingStoreOn: aStream  [
	"Use the literal form if possible."

	self isLiteral
		ifTrue: 
			[aStream nextPut: $#; nextPut: $(.
			self do: 
				[:element | 
				element settingStoreOn: aStream.
				aStream space].
			aStream nextPut: $)]
		ifFalse: [super settingStoreOn: aStream]
]
