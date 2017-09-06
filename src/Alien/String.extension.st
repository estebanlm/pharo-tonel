Extension {
	#name : #String
}

{
	#category : #'*Alien-Core',
	#timestamp : ' 8/31/2017 05:26:09'
}
String>>asAlien [
	| bs |
	^(Alien newC: (bs := self byteSize) + 1)
		replaceFrom: 1 to: bs with: self startingAt: 1
]
