Extension {
	#name : #ClassDescription
}

{
	#category : #'*OpalCompiler-Core',
	#timestamp : ' 8/31/2017 07:16:23'
}
ClassDescription>>findGlobalVariable: lookupBlock ifNone: notFoundBlock  [
	| var |
	var := OCLiteralVariable new.
	var scope: self.
			
	self classPool associationsDo: [ :assoc |
		var assoc: assoc.
		(lookupBlock value: var) ifTrue: [ ^ var ]].
	
	self sharedPools do: [ :pool |
		pool classPool associationsDo: [ :assoc | 
			var assoc: assoc.
			(lookupBlock value: var) ifTrue: [ ^ var ]]].

	self environment associationsDo: [ :assoc |
		var assoc: assoc.
		(lookupBlock value: var) ifTrue: [ ^ var ] ].
	
	^ notFoundBlock value
]
