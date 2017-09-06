"
Called in the debugger to generate methods when you click on the create button
"
Class {
	#name : #DynamicMessageImplementor,
	#superclass : #Object,
	#instVars : [
		'message',
		'class',
		'argumentNames',
		'stream'
	],
	#category : #DebuggerModel,
	#timestamp : '<historical>'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:17'
}
DynamicMessageImplementor class>>for: aMessage in: aClass [

	^ self new initializeFor: aMessage in: aClass
]

{
	#category : #evaluating-private,
	#timestamp : ' 8/31/2017 05:26:17'
}
DynamicMessageImplementor>>argumentNameAt: anIndex [

	| argumentName argument |
	
	argument := message arguments at: anIndex.
	argumentName := argument class canonicalArgumentName.
	
	[ argumentNames includes: argumentName ] whileTrue: [ argumentName := argumentName , anIndex asString ].
	argumentNames add: argumentName.

	^ argumentName
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:17'
}
DynamicMessageImplementor>>hasParameter: aKeyword [

	^ aKeyword last = $: or: [ message selector isInfix ]
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:17'
}
DynamicMessageImplementor>>initializeFor: aMessage in: aClass [

	message := aMessage.
	class := aClass
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:17'
}
DynamicMessageImplementor>>isMessageAGetter [
	
	^ message numArgs = 0 and: [ class instVarNames includes: message selector ]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:17'
}
DynamicMessageImplementor>>isMessageASetter [
	
	^ message numArgs = 1 and: [ class instVarNames includes: message selector allButLast ]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:17'
}
DynamicMessageImplementor>>messageShouldBeImplemented [
	
	^ (self isMessageAGetter | self isMessageASetter) not
]

{
	#category : #evaluating,
	#timestamp : ' 8/31/2017 05:26:17'
}
DynamicMessageImplementor>>value [

	argumentNames := Set new.
	stream := WriteStream on: String new.
	self writeSourceCode.
	
	^ stream contents
]

{
	#category : #evaluating-private,
	#timestamp : ' 8/31/2017 05:26:17'
}
DynamicMessageImplementor>>write: aKeyword of: anIndex [

	stream nextPutAll: aKeyword.
	self writeArgumentNameIfNecessaryOf: aKeyword at: anIndex
]

{
	#category : #evaluating-private,
	#timestamp : ' 8/31/2017 05:26:17'
}
DynamicMessageImplementor>>writeArgumentNameAt: anIndex [

	| argumentName |
	
	argumentName := self argumentNameAt: anIndex.
	stream
		nextPutAll: ' ';
		nextPutAll: argumentName;
		space
]

{
	#category : #evaluating-private,
	#timestamp : ' 8/31/2017 05:26:17'
}
DynamicMessageImplementor>>writeArgumentNameIfNecessaryOf: aKeyword at: anIndex [

	(self hasParameter: aKeyword) ifTrue: [ self writeArgumentNameAt: anIndex ]
]

{
	#category : #evaluating-private,
	#timestamp : ' 8/31/2017 05:26:17'
}
DynamicMessageImplementor>>writeGetterSourceCode [

	stream 
		cr;
		tab;
		nextPutAll: '^ ';
		nextPutAll: message selector 
]

{
	#category : #evaluating-private,
	#timestamp : ' 8/31/2017 05:26:17'
}
DynamicMessageImplementor>>writeGetterSourceCodeIfNecessary [

	self isMessageAGetter ifTrue: [ self writeGetterSourceCode ]
]

{
	#category : #evaluating-private,
	#timestamp : ' 8/31/2017 05:26:17'
}
DynamicMessageImplementor>>writeMethodName [

	message selector keywords doWithIndex: [ :aKeyword :anIndex | self write: aKeyword of: anIndex ]
]

{
	#category : #evaluating-private,
	#timestamp : ' 8/31/2017 05:26:17'
}
DynamicMessageImplementor>>writeSetterSourceCode [

	stream 
		cr;
		tab;
		nextPutAll: message selector allButLast;
		nextPutAll: ' := ';
		nextPutAll: argumentNames anyOne 
]

{
	#category : #evaluating-private,
	#timestamp : ' 8/31/2017 05:26:17'
}
DynamicMessageImplementor>>writeSetterSourceCodeIfNecessary [

	self isMessageASetter ifTrue: [ self writeSetterSourceCode ]
]

{
	#category : #evaluating-private,
	#timestamp : ' 8/31/2017 05:26:17'
}
DynamicMessageImplementor>>writeShouldBeImplemented [

	stream
		cr;
		tab;
		nextPutAll: 'self ';
		nextPutAll: #shouldBeImplemented;
		nextPut: $.
]

{
	#category : #evaluating-private,
	#timestamp : ' 8/31/2017 05:26:17'
}
DynamicMessageImplementor>>writeShouldBeImplementedIfNecessary [

	self messageShouldBeImplemented ifTrue: [ self writeShouldBeImplemented ]
]

{
	#category : #evaluating-private,
	#timestamp : ' 8/31/2017 05:26:17'
}
DynamicMessageImplementor>>writeSourceCode [

	self writeMethodName.
	self writeShouldBeImplementedIfNecessary.
	self writeGetterSourceCodeIfNecessary.
	self writeSetterSourceCodeIfNecessary
]
