"
MetacelloValidationIssue is an abstract class that has information related to a warning or error from a validating  Metacello configuration. 
Subclasses must implement #label and define if the spesific validation is a warning, criticalWarning, or an error.
"
Class {
	#name : #MetacelloValidationIssue,
	#superclass : #Object,
	#instVars : [
		'configurationClass',
		'explanation',
		'reasonCode',
		'callSite'
	],
	#category : #Metacello-Core-Validation,
	#timestamp : 'HenrikNergaard 3/3/2017 12:30'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloValidationIssue class>>configurationClass: aClass reasonCode: aSymbol callSite: aCallSite explanation: aString [

	^(self new)
		configurationClass: aClass;
		reasonCode: aSymbol;
		callSite: aCallSite;
		explanation: aString;
		yourself
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloValidationIssue>>callSite [
	^ callSite
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloValidationIssue>>callSite: anObject [
	callSite := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloValidationIssue>>configurationClass [
	^ configurationClass
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloValidationIssue>>configurationClass: aClass [
	configurationClass := aClass
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloValidationIssue>>explanation [
	^ explanation
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloValidationIssue>>explanation: aString [
	explanation := aString
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloValidationIssue>>isCritical [

	^self isError or: [ self isCriticalWarning ]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloValidationIssue>>isCriticalWarning [

	^false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloValidationIssue>>isError [

	^false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloValidationIssue>>isWarning [

	^false
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloValidationIssue>>label [

	^ self subclassResponsibility 
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloValidationIssue>>printOn: aStream [

	aStream
		nextPutAll: self label;
		nextPut: $:;
		space;
		nextPutAll: self explanation.
		
	self reasonCode ~~ #none ifTrue: [ 
		aStream space;
			nextPut: ${;
			space;
			<< self reasonCode;
			space;
			nextPut: $} 
	].

	(self configurationClass isNil and: [ self callSite isNil ]) ifTrue: [ ^ self ].
	
	aStream space; nextPut: $[; space.
		
	self configurationClass ifNotNil: [ 
		aStream nextPutAll: (self configurationClass name ifNil: ['']); space 
	].

	self callSite ifNotNil: [ 
		aStream nextPutAll: self callSite; space 
	].

	aStream nextPut: $]  
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloValidationIssue>>reasonCode [

	reasonCode == nil ifTrue: [ reasonCode := #none ].
	^ reasonCode
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloValidationIssue>>reasonCode: anObject [
	reasonCode := anObject
]
