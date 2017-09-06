"
Examples for RF
"
Class {
	#name : #ReflectivityExamples,
	#superclass : #Object,
	#instVars : [
		'ivar',
		'tag'
	],
	#classVars : [
		'ClassVar',
		'singleton'
	],
	#category : #Reflectivity-Tests,
	#timestamp : 'MarcusDenker 3/8/2015 09:28'
}

{
	#category : #options,
	#timestamp : ' 8/31/2017 05:26:31'
}
ReflectivityExamples class>>exampleMethodWithMetaLinkOptionsViaClass [
	^ 2 + 3
]

{
	#category : #options,
	#timestamp : ' 8/31/2017 05:26:31'
}
ReflectivityExamples class>>metaLinkOptions [
	^{
	#exampleMethodWithMetaLinkOptionsViaClass -> #( + optionCompileOnLinkInstallation)
	}
]

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:31'
}
ReflectivityExamples>>exampleArray [
	^ {3}
]

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:31'
}
ReflectivityExamples>>exampleAssignment [
	| temp |
	temp := (1 + 2).
	^temp
]

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:31'
}
ReflectivityExamples>>exampleBlock [
	^ [2 + 3] value
]

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:31'
}
ReflectivityExamples>>exampleBlockNoValue [
	^ [2 + 3]
]

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:31'
}
ReflectivityExamples>>exampleClassVarRead [
	^ClassVar
]

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:31'
}
ReflectivityExamples>>exampleGlobalRead [
	^GlobalForTesting
]

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:31'
}
ReflectivityExamples>>exampleIfTrueIfFalse [
	| t |
	t := false.
	t ifTrue: [ self bar ] ifFalse: [ 'hello' ].
	^ 5 
]

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:31'
}
ReflectivityExamples>>exampleIvarRead [
	^ivar 
]

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:31'
}
ReflectivityExamples>>exampleLazyInit [
	^ singleton ifNil: [singleton := self new initialize]
]

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:31'
}
ReflectivityExamples>>exampleLiteral [
	^ 2
]

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:31'
}
ReflectivityExamples>>exampleLiteralArray [
	^ #(1)
]

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:31'
}
ReflectivityExamples>>exampleMethod [
	^ 2 + 3
]

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:31'
}
ReflectivityExamples>>exampleMethodMultipleSites [
	Transcript show: Object new.
	^ 2 + 3
]

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:31'
}
ReflectivityExamples>>exampleMethodWithMetaLinkOptions [
	<metaLinkOptions: #( +optionCompileOnLinkInstallation)>
	^ 2 + 3
]

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:31'
}
ReflectivityExamples>>examplePrimitiveMethod [
	"returns image path"
	<primitive: 121>
	^ 2 + 3
]

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:31'
}
ReflectivityExamples>>exampleSendNoReturn [
	"just an example method that calls a mutation outside of a assignment or return node.
(needed for before link test with receiver reification"

	| collection |
	collection := OrderedCollection newFrom: {3 . 4}.
	collection removeAt:1.
]

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:31'
}
ReflectivityExamples>>exampleSendTwoArgs [
	^ Array with: 1 with: 2.
]

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:31'
}
ReflectivityExamples>>exampleTwoSends [
	3 + 4.
	^ 2 + 3
]

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:31'
}
ReflectivityExamples>>exampleWithArg: anArg [
	^ 2 + anArg
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:31'
}
ReflectivityExamples>>initialize [
	ivar := 33.
	ClassVar := #AClassVar.
]

{
	#category : #tagging,
	#timestamp : ' 8/31/2017 05:26:31'
}
ReflectivityExamples>>tag [
	^tag
]

{
	#category : #tagging,
	#timestamp : ' 8/31/2017 05:26:31'
}
ReflectivityExamples>>tagExec: anObject [
	tag := anObject
]
