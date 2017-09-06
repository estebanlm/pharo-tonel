"
I describe the behavior of my sole instance, nil. nil represents a prior value for variables that have not been initialized, or for results which are meaningless.
"
Class {
	#name : #UndefinedObject,
	#superclass : #Object,
	#category : #Kernel-Objects,
	#timestamp : '<historical>'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
UndefinedObject class>>allInstances [
	"It is well known there is a single instance"
	
	^Array with: nil
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
UndefinedObject class>>allInstancesDo: aBlock [
	"It is well known there is a single instance"
	
	aBlock value: nil
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:33'
}
UndefinedObject class>>new [
	self error: 'You may not create any more undefined objects--use nil'
]

{
	#category : #'dependents access',
	#timestamp : ' 8/31/2017 07:16:33'
}
UndefinedObject>>addDependent: ignored  [
	"Refer to the comment in Object|dependents."

	self error: 'Nil should not have dependents'
]

{
	#category : #'class hierarchy',
	#timestamp : ' 8/31/2017 07:16:33'
}
UndefinedObject>>addSubclass: aClass [
	"Ignored -- necessary to support disjoint class hierarchies"
]

{
	#category : #'class hierarchy',
	#timestamp : ' 8/31/2017 07:16:33'
}
UndefinedObject>>allSuperclassesDo: aBlockContext  [
	"Ignored -- necessary to support disjoint class hierarchies"
]

{
	#category : #'sets support',
	#timestamp : ' 8/31/2017 07:16:33'
}
UndefinedObject>>asSetElement [
	"Since nil is a singleton, we need only a single wrapper instance to represent it in set,
	created in advance"
	^ SetElement withNil
]

{
	#category : #'bottom context',
	#timestamp : ' 8/31/2017 07:16:33'
}
UndefinedObject>>canHandleSignal: exception [
	"When no more handler (on:do:) context left in sender chain this gets called"

	^ false
]

{
	#category : #'class hierarchy',
	#timestamp : ' 8/31/2017 07:16:33'
}
UndefinedObject>>classBuilder [
	"Answer the object responsible of creating subclasses of myself in the system."
	
		^ self classInstaller new builder
]

{
	#category : #'class hierarchy',
	#timestamp : ' 8/31/2017 07:16:33'
}
UndefinedObject>>classInstaller [
	"Answer the class responsible of creating classes in the system."
	
	^ Smalltalk classInstaller 
]

{
	#category : #copying,
	#timestamp : ' 8/31/2017 07:16:33'
}
UndefinedObject>>deepCopy [
	"Only one instance of UndefinedObject should ever be made, so answer 
	with self."
]

{
	#category : #'class hierarchy',
	#timestamp : ' 8/31/2017 07:16:33'
}
UndefinedObject>>environment [
	"Necessary to support disjoint class hierarchies."

	^self class environment
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:33'
}
UndefinedObject>>haltIfNil [
	<debuggerCompleteToSender>
	Halt now
]

{
	#category : #'bottom context',
	#timestamp : ' 8/31/2017 07:16:33'
}
UndefinedObject>>handleSignal: exception [
	"When no more handler (on:do:) context left in sender chain this gets called.  Return from signal with default action."

	^ exception resumeUnchecked: exception defaultAction
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:33'
}
UndefinedObject>>ifNil: aBlock [
	"A convenient test, in conjunction with Object ifNil:"

	^ aBlock value
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:33'
}
UndefinedObject>>ifNil: nilBlock ifNotNil: ifNotNilBlock [
	"Evaluate the block for nil because I'm == nil"

	^ nilBlock value
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:33'
}
UndefinedObject>>ifNotNil: aBlock [
	"A convenient test, in conjunction with Object ifNotNil:"

	^ self
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:33'
}
UndefinedObject>>ifNotNil: ifNotNilBlock ifNil: nilBlock  [
	"If I got here, I am nil, so evaluate the block nilBlock"

	^ nilBlock value
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:33'
}
UndefinedObject>>isEmptyOrNil [
	"Answer whether the receiver contains any elements, or is nil.  Useful in numerous situations where one wishes the same reaction to an empty collection or to nil"
	^ true
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:33'
}
UndefinedObject>>isLiteral [
	^ true
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:33'
}
UndefinedObject>>isNil  [
	"Refer to the comment in Object|isNil."

	^true
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:33'
}
UndefinedObject>>isNotNil  [
	"Refer to the comment in Object|isNotNil."

	^false
]

{
	#category : #'class hierarchy',
	#timestamp : ' 8/31/2017 07:16:33'
}
UndefinedObject>>literalScannedAs: scannedLiteral notifying: requestor  [
	^ scannedLiteral
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:33'
}
UndefinedObject>>notNil  [
	"Refer to the comment in Object|notNil."

	^false
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:33'
}
UndefinedObject>>printOn: aStream  [
	"Refer to the comment in Object|printOn:." 

	aStream nextPutAll: 'nil'
]

{
	#category : #'class hierarchy',
	#timestamp : ' 8/31/2017 07:16:33'
}
UndefinedObject>>removeSubclass: aClass [
	"Ignored -- necessary to support disjoint class hierarchies"
]

{
	#category : #copying,
	#timestamp : ' 8/31/2017 07:16:33'
}
UndefinedObject>>shallowCopy [
	"Only one instance of UndefinedObject should ever be made, so answer 
	with self."
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:33'
}
UndefinedObject>>storeOn: aStream  [
	"Refer to the comment in Object|storeOn:." 

	aStream nextPutAll: 'nil'
]

{
	#category : #'class hierarchy',
	#timestamp : ' 8/31/2017 07:16:33'
}
UndefinedObject>>subclass: nameOfClass  
	instanceVariableNames: instVarNames
	classVariableNames: classVarNames
	poolDictionaries: poolDictnames
	category: category [
	"Calling this method is now considered an accident.  If you really want to create a class with a nil superclass, then create the class and then set the superclass using #superclass:"
	self traceCr: ('Attempt to create ', nameOfClass, ' as a subclass of nil.  Possibly a class is being loaded before its superclass.').
	^ Object
		subclass: nameOfClass
		instanceVariableNames: instVarNames
		classVariableNames: classVarNames
		poolDictionaries: poolDictnames
		category: category

]

{
	#category : #'class hierarchy',
	#timestamp : ' 8/31/2017 07:16:33'
}
UndefinedObject>>subclassDefinerClass [
	"For disjunct class hierarchies -- how should subclasses of nil be evaluated"
	^self class subclassDefinerClass
]

{
	#category : #'class hierarchy',
	#timestamp : ' 8/31/2017 07:16:33'
}
UndefinedObject>>subclasses [
	"Return all the subclasses of nil"
	| classList |
	classList := Array new writeStream.
	self subclassesDo:[:class| classList nextPut: class].
	^classList contents
]

{
	#category : #'class hierarchy',
	#timestamp : ' 8/31/2017 07:16:33'
}
UndefinedObject>>subclassesDo: aBlock [
	"Evaluate aBlock with all subclasses of nil.  Others are not direct subclasses of Class."

	^ Class subclassesDo: [:cl | 
			cl isMeta ifTrue: [aBlock value: cl soleInstance]].
]

{
	#category : #'dependents access',
	#timestamp : ' 8/31/2017 07:16:33'
}
UndefinedObject>>suspend [
	"Kills off processes that didn't terminate properly"
	"Display reverse; reverse."  "<-- So we can catch the suspend bug"
	Processor terminateActive
]

{
	#category : #'class hierarchy',
	#timestamp : ' 8/31/2017 07:16:33'
}
UndefinedObject>>typeOfClass [
	"Necessary to support disjoint class hierarchies."
	^#normal
]

{
	#category : #copying,
	#timestamp : ' 8/31/2017 07:16:33'
}
UndefinedObject>>veryDeepCopyWith: deepCopier [
	"Return self.  I can't be copied.  Do not record me."
]
