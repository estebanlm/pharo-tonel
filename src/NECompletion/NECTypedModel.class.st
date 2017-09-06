"
I'm the model for a typed completion, that means when a receiver class is known. I only have selectors. I have an expand toggle: When false I filter out Object and ProtoObject selectors. The default value is true.
"
Class {
	#name : #NECTypedModel,
	#superclass : #NECModel,
	#instVars : [
		'expanded'
	],
	#category : #NECompletion-Model,
	#timestamp : '<historical>'
}

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:21'
}
NECTypedModel>>initialize [
	super initialize.
	expanded := true
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:21'
}
NECTypedModel>>initializeSelectors [
	self initializeSelectorsFor: clazz
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:21'
}
NECTypedModel>>initializeSelectorsFor: aClass  [
	|excludedClasses|
	selectors reset.
	excludedClasses := (expanded ifTrue: [#()] ifFalse: [Object withAllSuperclasses]).
	selectors addAll: ((aClass allSelectorsWithout: excludedClasses)
						collect: [:each | NECSelectorEntry contents: each type: #selector])
]

{
	#category : #action,
	#timestamp : ' 8/31/2017 05:26:21'
}
NECTypedModel>>narrowWith: aString  [
	self
		narrowString: aString ;
		initializeSelectors.
	entries reset.
	self addToEntries: selectors
]

{
	#category : #action,
	#timestamp : ' 8/31/2017 05:26:21'
}
NECTypedModel>>theClass [
	^clazz
]

{
	#category : #action,
	#timestamp : ' 8/31/2017 05:26:21'
}
NECTypedModel>>title [
	^clazz name
]

{
	#category : #action,
	#timestamp : ' 8/31/2017 05:26:21'
}
NECTypedModel>>toggleExpand [
	expanded := expanded not.
	self initializeSelectors.
	self narrowWith: narrowString
]
