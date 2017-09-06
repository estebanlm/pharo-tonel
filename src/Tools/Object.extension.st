Extension {
	#name : #Object
}

{
	#category : #'*Tools-Debugger',
	#timestamp : ' 8/31/2017 05:26:26'
}
Object class>>canonicalArgumentName [

	| prefix |
	prefix := self name first isVowel
		ifTrue: [ 'an' ]
		ifFalse: [ 'a' ].
	^ prefix, self name.
]

{
	#category : #'*Tools-FileList',
	#timestamp : ' 8/31/2017 05:26:26'
}
Object class>>services [
	"Backstop"
	^#()
]
