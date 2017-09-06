"
A MCDefinition is the root of inheritance of entities representing code. 
"
Class {
	#name : #MCDefinition,
	#superclass : #Object,
	#classVars : [
		'Instances',
		'InstancesWriteLock'
	],
	#category : #Monticello-Base,
	#timestamp : '<historical>'
}

{
	#category : #cleanup,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCDefinition class>>cleanUp [
	"Flush caches"

	self clearInstances.
]

{
	#category : #cleanup,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCDefinition class>>clearInstances [
	WeakArray removeWeakDependent: Instances.
	Instances := nil
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:17:01'
}
MCDefinition class>>instanceLike: aDefinition [
	Instances ifNil: [ Instances := WeakSet new ].
	InstancesWriteLock ifNil: [ InstancesWriteLock := Semaphore forMutualExclusion ].
	^ (Instances like: aDefinition) 
		ifNil: [
			InstancesWriteLock critical: [ Instances add: aDefinition ]]
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCDefinition>><= other [
	^ self sortKey <= other sortKey
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCDefinition>>= aDefinition [
	^(aDefinition isKindOf: MCDefinition) and: [self isRevisionOf: aDefinition]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCDefinition>>actualClass [
	"Since the targetClass call on a patch operation will fail
	otherwise."
	
	^nil
]

{
	#category : #installing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCDefinition>>addMethodAdditionTo: aCollection [
	self load
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCDefinition>>className [
	"Answer the class name here or nil if not applicable."
	
	^nil
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCDefinition>>definition [

	^ self
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCDefinition>>description [
	self subclassResponsibility
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCDefinition>>diffSource [
	^ self source
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCDefinition>>fullClassName [
	"Answer the className by default."
	
	^self className
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCDefinition>>fullTimeStamp [
	^ DateAndTime current
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCDefinition>>hash [
	^ self description hash
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCDefinition>>isClassDefinition [
	^false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCDefinition>>isClassDefinitionExtension [
	"Answer true if this definition extends the regular class definition"
	^false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCDefinition>>isMethodDefinition [
	^false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCDefinition>>isOrganizationDefinition [
	^false
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCDefinition>>isRevisionOf: aDefinition [
	^ (aDefinition isKindOf: MCDefinition) and: [aDefinition description = self description]
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCDefinition>>isSameRevisionAs: aDefinition [
	^ self = aDefinition
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCDefinition>>isScriptDefinition [
	^false
]

{
	#category : #installing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCDefinition>>load [
	
]

{
	#category : #installing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCDefinition>>loadOver: aDefinition [
	self load
	
]

{
	#category : #installing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCDefinition>>postload [

]

{
	#category : #installing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCDefinition>>postloadOver: aDefinition [
	self postload
]

{
	#category : #annotations,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCDefinition>>printAnnotations: requests on: aStream [
	"Add a string for an annotation pane, trying to fulfill the browser annotationRequests."

	aStream nextPutAll: 'not yet implemented'
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCDefinition>>printOn: aStream [
	super printOn: aStream.
	aStream nextPutAll: '(', self summary, ')'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCDefinition>>provisions [
	^ #()
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCDefinition>>requirements [
	^ #()
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCDefinition>>sortKey [
	self subclassResponsibility 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCDefinition>>source [
	^ self subclassResponsibility.
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCDefinition>>summary [
	self subclassResponsibility 
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCDefinition>>summarySuffixOver: previousDefinition [
	^self source = previousDefinition source
		ifTrue: [ ' (source same but rev changed)' ]
		ifFalse: [ ' (changed)' ]
]

{
	#category : #installing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCDefinition>>unload [

]
