"
I represent an executable check applied on an environment (groups of classes, methods... )
"
Class {
	#name : #RBLintRule,
	#superclass : #Object,
	#category : #Refactoring-Critics,
	#timestamp : '<historical>'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:27'
}
RBLintRule class>>asRBRule [

	^ self new
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBLintRule class>>checksClass [

	^ false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBLintRule class>>checksMethod [

	^ false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBLintRule class>>checksPackage [

	^ false
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBLintRule class>>identifierMinorVersionNumber [
	"This number identifies the version of the rule definition. Each time the rule is updated and its changes invalidates previous false positives identification (and as such should be reassessed by developers) the number should be increased."
	^ 1
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBLintRule class>>isUsed [
	"all my sublasses are used"
	^self name = 'RBLintRule'
		ifTrue: [ super isUsed ]
		ifFalse: [ true ]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBLintRule class>>isVisible [
	"Answer true if the class should be visible in the GUI."

	^ false
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBLintRule class>>uniqueIdentifierNumber [
	"This number should be unique and should change only when the rule completely change semantics"
	^ 0
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:27'
}
RBLintRule>>asRBRule [

	^ self
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBLintRule>>basicCheck: anEntity [

	^ self subclassResponsibility 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBLintRule>>changes [
	^ #()
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBLintRule>>checkClass: aClass [
	"Is a hook to specify a check that is performed at the class level"
	

]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBLintRule>>checkMethod: aMethod [
	"Is a hook to specify a check that is performed at the method level"
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBLintRule>>checkPackage: aPackage [
	"Is a hook to specify a check that is performed at the pacakge level"
	

]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBLintRule>>genericPatternForSelector: aSymbol [
	^ String streamContents: [ :stream |
		aSymbol keywords keysAndValuesDo: [ :index :value |
			stream space; nextPutAll: value.
			aSymbol last = $:
				ifTrue: [ stream space; nextPutAll: '`@object'; print: index ] ] ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBLintRule>>group [
	^ 'Unclassified rules'
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBLintRule>>hasConflicts [
	^ false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBLintRule>>isArchitecturalRule [
	^ false 
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBLintRule>>isComposite [
	^ false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBLintRule>>isEmpty [
	self subclassResponsibility
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBLintRule>>isTransformationRule [

	^ false 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBLintRule>>leaves  [
	^ {self}
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBLintRule>>longDescription [
	"A long version of the rationale, just delegate to the class comment. Therefore just enhance class comments!"
	^ self class comment 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBLintRule>>name [
	"Answer a human readable name of the rule."

	self subclassResponsibility
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBLintRule>>printOn: aStream  [
	super printOn: aStream.
	self name isNil 
		ifFalse: [ aStream nextPutAll: ' name: '; print: self name ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBLintRule>>problemCount [
	self subclassResponsibility
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBLintRule>>rationale [
	"Answer an explanation of the rule, usually in one line. Long description can be obtained using longDescription."

	^ self class comment
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBLintRule>>resetResult [

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBLintRule>>result [
	^ self subclassResponsibility
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBLintRule>>run [
	^ RBSmalllintChecker runRule: self
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBLintRule>>runOnEnvironment: anEnvironment  [
	^ RBSmalllintChecker runRule: self onEnvironment: anEnvironment
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBLintRule>>severity [
	"Answer the severity of issues reported by this rule. This method should return one of #error, #warning, or #information."

	^ #warning
]
