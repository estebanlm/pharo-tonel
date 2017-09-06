"
I represent a field in a structure layout. I am used for computing which fields present in a structure are passed in registers, and which are not.
"
Class {
	#name : #FFIExternalStructureFlatLayoutField,
	#superclass : #Object,
	#instVars : [
		'registerClass',
		'offset',
		'size',
		'alignment'
	],
	#category : #UnifiedFFI,
	#timestamp : 'RonieSalgado 2/14/2017 01:54'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalStructureFlatLayoutField>>alignment [
	^ alignment
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalStructureFlatLayoutField>>alignment: anObject [
	alignment := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalStructureFlatLayoutField>>offset [
	^ offset
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalStructureFlatLayoutField>>offset: anObject [
	offset := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalStructureFlatLayoutField>>registerClass [
	^ registerClass
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalStructureFlatLayoutField>>registerClass: anObject [
	registerClass := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalStructureFlatLayoutField>>size [
	^ size
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalStructureFlatLayoutField>>size: anObject [
	size := anObject
]
