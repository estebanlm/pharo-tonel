Extension {
	#name : #RBMethodNode
}

{
	#category : #'*qualityAssistantRecording',
	#timestamp : ' 8/31/2017 05:26:37'
}
RBMethodNode>>dataForQAR [
		
	| data |
	
	data := super dataForQAR
		at: #class put: self class name;
		at: #name put: self selector obfuscatedIfNecessary;
		yourself.
		
	self methodForQAR ifNotNil: [ :method |
		data at: #method put: method dataForQAR ].
	
	Privacy sendSourceCode ifTrue: [ 
		data at: #sourceCode put: self sourceCode ].

	^ data
]

{
	#category : #'*qualityAssistantRecording',
	#timestamp : ' 8/31/2017 05:26:37'
}
RBMethodNode>>methodForQAR [

	self compilationContext ifNotNil: [ :contx |
		contx getClass ifNotNil: [ :class |
			class
				compiledMethodAt: self selector
				ifPresent: [ :meth | ^ meth ]
				ifAbsent: [ ] ] ].
	
	^ self compiledMethod
]
