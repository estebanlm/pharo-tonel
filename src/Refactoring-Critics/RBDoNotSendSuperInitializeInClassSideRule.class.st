"
Don't send super initialize in class side because the class initialize methods of your superclass  may maintain state level shared state and it can be dangerous to automatically reinitialize it. 

For example, 

[[[  
ZnServer class>>initialize
	ManagedServers := IdentitySet new.
	AlwaysRestart := true.
	Smalltalk addToStartUpList: self.
	Smalltalk addToShutDownList: self
]]]
"
Class {
	#name : #RBDoNotSendSuperInitializeInClassSideRule,
	#superclass : #RBTransformationRule,
	#category : #Refactoring-Critics-TransformationRules,
	#timestamp : 'StephaneDucasse 11/29/2014 18:14'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBDoNotSendSuperInitializeInClassSideRule class>>uniqueIdentifierName [
	"This number should be unique and should change only when the rule completely change semantics"
	
	^'DoNotSendSuperInitializeInClassSideRule'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBDoNotSendSuperInitializeInClassSideRule>>group [
	^ 'Potential Bugs'
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBDoNotSendSuperInitializeInClassSideRule>>initialize [
	super initialize.
	self rewriteRule 
		replace: '``@.statBefore. super initialize. ``@.statAfter.' 
		with: '``@.statBefore. ``@.statAfter.' 
		when: [ :node | class isMeta and: [ node methodNode selector = #initialize ] ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBDoNotSendSuperInitializeInClassSideRule>>name [
	^ 'Class-side #initialize should not send "super initialize".'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBDoNotSendSuperInitializeInClassSideRule>>rationale [
	^ 'Don''t send super initialize in class side because some class initialize of class of the top of the hierarchy should not be reinitialized.'
]
