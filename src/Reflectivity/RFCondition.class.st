"
I can be used to reify the condition of a link.

I have myself a condition *and* I store the condtition of the link.

on #value, I evaluate my condition and after that the orginal link condition.

With this feature, we can thus reflectively controll links while not actually changing the condition of the link itself. 
"
Class {
	#name : #RFCondition,
	#superclass : #Object,
	#instVars : [
		'condition',
		'linkCondition'
	],
	#category : #Reflectivity-Links,
	#timestamp : 'MarcusDenker 5/3/2015 13:49'
}

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 07:16:26'
}
RFCondition class>>for: aCondition [
	^self new linkCondition: aCondition
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:26'
}
RFCondition>>condition: aBlockOrBoolean [
	condition := aBlockOrBoolean
]

{
	#category : #evaluating,
	#timestamp : ' 8/31/2017 07:16:26'
}
RFCondition>>cull: arguments [
	"in case of my wrapped link expects arguments"

	^ condition
		and: [ linkCondition perform: linkCondition valueSelector withArguments: {arguments} ]
]

{
	#category : #enable/disable,
	#timestamp : ' 8/31/2017 07:16:26'
}
RFCondition>>disable [
	condition := false.
]

{
	#category : #enable/disable,
	#timestamp : ' 8/31/2017 07:16:26'
}
RFCondition>>enable [
	condition := true
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:16:26'
}
RFCondition>>initialize [
	condition := true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:26'
}
RFCondition>>linkCondition: aBlockOrBoolean [
		linkCondition := aBlockOrBoolean
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:26'
}
RFCondition>>reifications [
	(condition isKindOf: Boolean) ifTrue: [ ^#() ].
	^condition argumentNames. 
]

{
	#category : #evaluating,
	#timestamp : ' 8/31/2017 07:16:26'
}
RFCondition>>value [
	^condition and: [ linkCondition value ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:26'
}
RFCondition>>valueSelector [
	linkCondition numArgs isZero
		ifTrue: [ ^ #value ]
		ifFalse: [ ^ #cull: ]
]
