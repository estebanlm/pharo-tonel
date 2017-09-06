Extension {
	#name : #RBAddMethodChange
}

{
	#category : #'*NautilusRefactoring',
	#timestamp : ' 8/31/2017 05:26:27'
}
RBAddMethodChange>>accept: aText notifying: aController [
	"Just to make sure that it compiles, try with the standard compiler."
	
	| compiler |
	compiler := self changeClass
		ifNil: [ Object compiler ]
		ifNotNil: [:changeClass | changeClass compiler ].
		
	compiler
		source: aText asString;
		class:  self changeClass;
		requestor: aController;
		failBlock: [ ^ false ];
		translate.
	
		
	self 
		class: self changeClass
		protocol: self protocol
		source: aText asString.
		
	^ true
]

{
	#category : #'*NautilusRefactoring',
	#timestamp : ' 8/31/2017 05:26:27'
}
RBAddMethodChange>>oldVersionTextToDisplay [
	| class |
	
	class := Smalltalk 
				at: className asSymbol
				ifAbsent: [ ^ super oldVersionTextToDisplay ].
				
	isMeta ifTrue: [ class := class theMetaClass ].
				
	^ class methodDict 
			at: self selector
			ifPresent: [:method | method sourceCode ]
			ifAbsent: [ super oldVersionTextToDisplay ]
]

{
	#category : #'*NautilusRefactoring',
	#timestamp : ' 8/31/2017 05:26:27'
}
RBAddMethodChange>>textToDisplay [

	^ self source
]
