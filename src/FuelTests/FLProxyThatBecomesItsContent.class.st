"
Used at #testObjectByProxyThatBecomesItsContent
"
Class {
	#name : #FLProxyThatBecomesItsContent,
	#superclass : #Object,
	#instVars : [
		'contents'
	],
	#category : #FuelTests-Mocks,
	#timestamp : 'MartinDias 11/17/2011 03:18'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:30'
}
FLProxyThatBecomesItsContent class>>newWith: aByteSymbol  [
	
	^self basicNew
		initializeWith: aByteSymbol;
		yourself
]

{
	#category : #serialization,
	#timestamp : ' 8/31/2017 05:26:30'
}
FLProxyThatBecomesItsContent>>fuelAfterMaterialization  [

	self become: contents
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:30'
}
FLProxyThatBecomesItsContent>>initializeWith: anObject [
	
	super initialize.
	contents := anObject
]
