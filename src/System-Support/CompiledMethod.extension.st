Extension {
	#name : #CompiledMethod
}

{
	#category : #'*System-Support',
	#timestamp : ' 8/31/2017 07:16:13'
}
CompiledMethod>>referencedClasses [
	"Return classes that are directly referenced by this method"

	^ self literals allButLast
		select: [ :l | l value isClass ] 
		thenCollect: [:v | v value ].
]
