Extension {
	#name : #Behavior
}

{
	#category : #'*Ring-Core-Kernel',
	#timestamp : ' 8/31/2017 07:17:01'
}
Behavior>>methodNamed: aSelector [

	^ self methodDict at: aSelector
]

{
	#category : #'*Ring-Core-Kernel',
	#timestamp : ' 8/31/2017 07:17:01'
}
Behavior>>methodsInProtocol: aString [

	^ (self organization listAtCategoryNamed: aString) 
			collect: [ :each | (self compiledMethodAt: each) ]
]

{
	#category : #'*Ring-Core-Kernel',
	#timestamp : ' 8/31/2017 07:17:01'
}
Behavior>>protocols [
	
	^ self organization categories copy
]
