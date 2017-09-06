"
I am a dynamic eye element, if you are too lazy to create your own subclass of AbstractEyeElement, use it...
"
Class {
	#name : #DynamicEyeElement,
	#superclass : #AbstractEyeElement,
	#instVars : [
		'descriptionBlock',
		'saveBlock',
		'labelBlock',
		'valueBlock'
	],
	#category : #Spec-Inspector-Element,
	#timestamp : '<historical>'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:18'
}
DynamicEyeElement class>>host: anObject label: aLabel description: aBlock value: aValue  [
	^ (self host: anObject label: aLabel value: aValue)
		description: aBlock;
		yourself
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:18'
}
DynamicEyeElement class>>host: anObject label: aLabel value: aValue [
	^ (self host: anObject)
		label: aLabel;
		value: aValue;
		yourself
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:18'
}
DynamicEyeElement class>>host: anObject value: aValue [
	^ (self host: anObject)
		value: aValue;
		yourself
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
DynamicEyeElement>>accessorCode [
	^ self description
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
DynamicEyeElement>>description [
	"For big value to print, overwrite description block"
	descriptionBlock ifNil: [ ^ self value asString ].
	^ descriptionBlock cull: self value
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
DynamicEyeElement>>description: aBlock [
	descriptionBlock := aBlock
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
DynamicEyeElement>>label [
	^ labelBlock value
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
DynamicEyeElement>>label: anObject [
	labelBlock := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
DynamicEyeElement>>save: aValue [
	saveBlock value: aValue
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
DynamicEyeElement>>saveBlock: anObject [
	saveBlock := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
DynamicEyeElement>>value [
	^ valueBlock value
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
DynamicEyeElement>>value: anObject [
	valueBlock := anObject
]
