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
	#category : #Metacello-Core-Validation
}

{ #category : #'instance creation' }
MetacelloValidationIssue class >> configurationClass: aClass reasonCode: aSymbol callSite: aCallSite explanation: aString [

	^(self new)
		configurationClass: aClass;
		reasonCode: aSymbol;
		callSite: aCallSite;
		explanation: aString;
		yourself
]

{ #category : #accessing }
MetacelloValidationIssue >> callSite [
	^ callSite
]

{ #category : #accessing }
MetacelloValidationIssue >> callSite: anObject [
	callSite := anObject
]

{ #category : #accessing }
MetacelloValidationIssue >> configurationClass [
	^ configurationClass
]

{ #category : #accessing }
MetacelloValidationIssue >> configurationClass: aClass [
	configurationClass := aClass
]

{ #category : #accessing }
MetacelloValidationIssue >> explanation [
	^ explanation
]

{ #category : #accessing }
MetacelloValidationIssue >> explanation: aString [
	explanation := aString
]

{ #category : #testing }
MetacelloValidationIssue >> isCritical [

	^self isError or: [ self isCriticalWarning ]
]

{ #category : #testing }
MetacelloValidationIssue >> isCriticalWarning [

	^false
]

{ #category : #testing }
MetacelloValidationIssue >> isError [

	^false
]

{ #category : #testing }
MetacelloValidationIssue >> isWarning [

	^false
]

{ #category : #accessing }
MetacelloValidationIssue >> label [

	^ self subclassResponsibility 
]

{ #category : #printing }
MetacelloValidationIssue >> printOn: aStream [

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

{ #category : #accessing }
MetacelloValidationIssue >> reasonCode [

	reasonCode == nil ifTrue: [ reasonCode := #none ].
	^ reasonCode
]

{ #category : #accessing }
MetacelloValidationIssue >> reasonCode: anObject [
	reasonCode := anObject
]
