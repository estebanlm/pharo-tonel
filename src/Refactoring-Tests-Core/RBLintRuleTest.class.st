"

"
Class {
	#name : #RBLintRuleTest,
	#superclass : #Object,
	#instVars : [
		'name',
		'foo1'
	],
	#classVars : [
		'Foo1'
	],
	#pools : [
		'TextConstants'
	],
	#category : #Refactoring-Tests-Core-Data,
	#timestamp : ''
}

{
	#category : #foo,
	#timestamp : ' 8/31/2017 05:26:31'
}
RBLintRuleTest class>>someFooMethod [
	^ 'does nothing here:)'
]

{
	#category : #foo,
	#timestamp : ' 8/31/2017 05:26:31'
}
RBLintRuleTest class>>someOtherFooMethod [
	^ 'does nothing here even better:)'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:31'
}
RBLintRuleTest>>checkClass: aSmalllintContext [

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:31'
}
RBLintRuleTest>>checkMethod: aSmalllintContext [

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:31'
}
RBLintRuleTest>>displayName [
	| nameStream |
	nameStream := WriteStream on: (String new: 64).
	nameStream nextPutAll: self name;
		nextPutAll: ' ('.
	self problemCount printOn: nameStream.
	nameStream nextPut: $).
	^nameStream contents
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:31'
}
RBLintRuleTest>>failedRules [
	^self isEmpty
		ifTrue: [#()]
		ifFalse: [Array with: self]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:31'
}
RBLintRuleTest>>hasConflicts [
	^false
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:31'
}
RBLintRuleTest>>initialize [
	name := ''
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:31'
}
RBLintRuleTest>>isComposite [
	^false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:31'
}
RBLintRuleTest>>isEmpty [
	self subclassResponsibility
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:31'
}
RBLintRuleTest>>junk [
	^ RBRefactoryTestDataApp printString 
		copyFrom: 1
		to: CR
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:31'
}
RBLintRuleTest>>name [
	^name
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:31'
}
RBLintRuleTest>>name: aString  [
	name := aString
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:31'
}
RBLintRuleTest>>openEditor [
	| rules |
	rules := self failedRules.
	rules isEmpty ifTrue: [^self].
	rules size == 1 ifTrue: [^rules first viewResults]
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:31'
}
RBLintRuleTest>>printOn: aStream  [
	name isNil
		ifTrue: [super printOn: aStream]
		ifFalse: [aStream nextPutAll: name]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:31'
}
RBLintRuleTest>>problemCount [
	^self subclassResponsibility
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:31'
}
RBLintRuleTest>>resetResult [

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:31'
}
RBLintRuleTest>>run [
	^Object printOn: self
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:31'
}
RBLintRuleTest>>runOnEnvironment: anEnvironment  [
	^Object printOn: self onEnvironment: anEnvironment
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:31'
}
RBLintRuleTest>>someOtherDemoMethod [
	| temp |
	temp := self new.
	^ temp junk
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:31'
}
RBLintRuleTest>>viewResults [
	self subclassResponsibility
]
