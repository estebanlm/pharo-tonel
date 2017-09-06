Extension {
	#name : #Duration
}

{
	#category : #'*Network-Mail',
	#timestamp : ' 8/31/2017 05:26:23'
}
Duration>>asEmailTimeOffsetString [
	"Format per RFC5322  e.g.  '-0500'"

	^ String streamContents: [ :str | 
			str
				nextPut: (self positive ifTrue: [ $+ ] ifFalse: [ $- ]);
				nextPutAll: self hours abs asTwoCharacterString;
				nextPutAll: self minutes asTwoCharacterString ].
]
