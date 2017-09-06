"
I'm represent an entry in the spaceTally.
"
Class {
	#name : #SpaceTallyItem,
	#superclass : #Object,
	#instVars : [
		'analyzedClassName',
		'codeSize',
		'instanceCount',
		'spaceForInstances'
	],
	#category : #Tool-Profilers,
	#timestamp : 'sd 6/20/2003 22:02'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:21'
}
SpaceTallyItem class>>analyzedClassName: aClassName [

	^ self new
		analyzedClassName: aClassName ; yourself
		
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:21'
}
SpaceTallyItem class>>analyzedClassName: aClassName codeSize: codeSize instanceCount: instanceCount spaceForInstances: spaceForInstances [

	^ self new
		analyzedClassName: aClassName ;
		codeSize: codeSize ;
		instanceCount: instanceCount ;
		spaceForInstances: spaceForInstances ; yourself
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
SpaceTallyItem>>analyzedClassName [

	^ analyzedClassName
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
SpaceTallyItem>>analyzedClassName: aClassName [

	analyzedClassName := aClassName
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
SpaceTallyItem>>codeSize [

	^ codeSize
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
SpaceTallyItem>>codeSize: aNumber [

	codeSize := aNumber
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
SpaceTallyItem>>instanceCount [

	^ instanceCount
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
SpaceTallyItem>>instanceCount: aNumber [

	instanceCount := aNumber
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:21'
}
SpaceTallyItem>>printOn: aStream [

	analyzedClassName isNil
		ifFalse: [aStream nextPutAll: analyzedClassName asString]. 
	aStream nextPutAll: ' ('.
	codeSize isNil
		ifFalse: [aStream nextPutAll: 'code size: ' ;  nextPutAll: codeSize asString]. 
	instanceCount isNil
		ifFalse: [aStream nextPutAll: ' instance count: ' ;  nextPutAll: instanceCount asString]. 
	spaceForInstances isNil
		ifFalse: [aStream nextPutAll: ' space for instances: ' ;  nextPutAll: spaceForInstances asString]. 
	aStream nextPut: $).
	
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
SpaceTallyItem>>spaceForInstances [

	^ spaceForInstances
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
SpaceTallyItem>>spaceForInstances: aNumber [

	spaceForInstances := aNumber
]
