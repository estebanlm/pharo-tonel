"
A MCModification represents the operation to modify an entity to a snapshot. 
"
Class {
	#name : #MCModification,
	#superclass : #MCPatchOperation,
	#instVars : [
		'obsoletion',
		'modification'
	],
	#category : #Monticello-Patching,
	#timestamp : '<historical>'
}

{
	#category : #instance-creation,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCModification class>>of: base to: target [
	^ self new initializeWithBase: base target: target
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCModification>>baseDefinition [
	^ obsoletion
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCModification>>basicApplyTo: anObject [
	anObject modifyDefinition: obsoletion to: modification
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCModification>>definition [
	^ modification
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCModification>>fromSource [
	^ obsoletion source
]

{
	#category : #initializing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCModification>>initializeWithBase: base target: target [
	obsoletion := base.
	modification := target.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCModification>>inverse [
	^ MCModification of: modification to: obsoletion
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCModification>>isClassPatch [
	^obsoletion isClassDefinition
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCModification>>isModification [
	^ true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCModification>>modification [
	^ modification
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCModification>>obsoletion [
	^ obsoletion
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCModification>>printAnnotations: request on: aStream [
	aStream nextPutAll: 'old: '.
	obsoletion printAnnotations: request on: aStream.
	aStream cr.
	aStream nextPutAll: 'new: '.
	modification printAnnotations: request on: aStream.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCModification>>summarySuffix [
	^ modification summarySuffixOver: obsoletion

]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCModification>>summarySuffixOver: previousDefinition [
	| sourceChanged categoryChanged timeStampChanged |
	sourceChanged := self source ~= previousDefinition source.
	timeStampChanged := self timeStamp ~= previousDefinition timeStamp.
	categoryChanged := self category ~= previousDefinition category.
	sourceChanged | timeStampChanged | categoryChanged
		ifFalse: [ ^super summarySuffixOver: previousDefinition ].
	sourceChanged ifTrue: [
		^categoryChanged
			ifTrue: [ ' (changed and recategorized)' ]
			ifFalse: [ ' (changed)' ] ].
	timeStampChanged & categoryChanged
		ifTrue: [^ ' (recategorized and different time stamp)' ].
	^categoryChanged
		ifTrue: [ ' (only recategorized)' ]
		ifFalse: [ ' (only different time stamp)' ]

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCModification>>targetClass [
	^ obsoletion actualClass
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCModification>>targetDefinition [
	^ modification
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCModification>>toSource [
	^ modification diffSource
]
