"

"
Class {
	#name : #FLExtensionWrapper,
	#superclass : #Object,
	#instVars : [
		'targetClass',
		'method',
		'selector',
		'isSource'
	],
	#category : #FuelPlatform-Core,
	#timestamp : ''
}

{
	#category : #instance-creation,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLExtensionWrapper class>>fromPragma: aPragma [
	^ self new
		initializeWithPragma: aPragma;
		yourself
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLExtensionWrapper>>compileInTarget [
	| methodSelector source |
	source := self method methodClass theNonMetaClass
		perform: self method selector
		withArguments: (1 to: self method selector numArgs) asArray.
	"actual selector may be different from the one used to store the source"
	methodSelector := self targetClass compile: source.
	self targetClass organization
		classify: self selector
		under: self extensionProtocolName
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLExtensionWrapper>>copySelector: aSelector ofMethod: aCompiledMethod toClass: aClass [
	aClass
		addAndClassifySelector: aSelector
		withMethod: aCompiledMethod copy
		inProtocol: self extensionProtocolName
		notifying: nil
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLExtensionWrapper>>copyToTarget [
	self targetClass
		addAndClassifySelector: self selector
		withMethod: self method copy
		inProtocol: self extensionProtocolName
		notifying: nil
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLExtensionWrapper>>extensionProtocolName [
	^ FLPlatform extensionProtocolName
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLExtensionWrapper>>initializeWithPragma: aPragma [
	| argumentNamesAndValues |
	argumentNamesAndValues := self readArgumentsFrom: aPragma.
	self
		method: aPragma method copy;
		selector: (self
			readSelectorFrom: aPragma
			argumentNames: argumentNamesAndValues first
			argumentValues: argumentNamesAndValues second);
		isSource: (self
			readIsSourceFrom: aPragma
			argumentNames: argumentNamesAndValues first
			argumentValues: argumentNamesAndValues second);
		targetClass: (self
			readTargetClassFrom: aPragma
			argumentNames: argumentNamesAndValues first
			argumentValues: argumentNamesAndValues second)
]

{
	#category : #operations,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLExtensionWrapper>>install [
	self targetClass ifNil: [ ^ self ].
	
	self isSource ifTrue: [ ^ self compileInTarget ].
	self selector = self method selector ifFalse: [ ^ self renameAndCompileInTarget ].
	
	self copyToTarget
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLExtensionWrapper>>isSource [
	^ isSource
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLExtensionWrapper>>isSource: aBoolean [
	isSource := aBoolean
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLExtensionWrapper>>method [
	^ method
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLExtensionWrapper>>method: aCompiledMethod [
	method := aCompiledMethod
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLExtensionWrapper>>readArgumentsFrom: aPragma [
	^ {
		aPragma key keywords.
		aPragma arguments }
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLExtensionWrapper>>readIsSourceFrom: aPragma argumentNames: argumentNames argumentValues: argumentValues [
	| index |
	index := argumentNames
		indexOf: 'isSource:'
		ifAbsent: [ ^ false ].
	
	^ argumentValues at: index
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLExtensionWrapper>>readSelectorFrom: aPragma argumentNames: argumentNames argumentValues: argumentValues [
	| index |
	index := argumentNames
		indexOf: 'selector:'
		ifAbsent: [ ^ aPragma selector ].
	
	^ argumentValues at: index
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLExtensionWrapper>>readTargetClassFrom: aPragma argumentNames: argumentNames argumentValues: argumentValues [
	| class |
	class := Smalltalk
		at: (argumentValues at: (argumentNames indexOf: 'flExtensionOf:'))
		ifAbsent: [ ^ nil ].
		
	^ (aPragma method pragmas anySatisfy: [ :pragma |
		pragma key = #flExtensionClassSide ])
			ifTrue: [ class class ]
			ifFalse: [ class ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLExtensionWrapper>>renameAndCompileInTarget [
	| newMethod |
	newMethod := FLPlatform current
		renamedMethodCopyOf: self method
		selector: self selector.
	self targetClass
		addSelector: self selector
		withMethod: newMethod
		notifying: nil.
	self targetClass organization
		classify: self selector
		under: self extensionProtocolName
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLExtensionWrapper>>selector [
	^ selector
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLExtensionWrapper>>selector: aSymbol [
	selector := aSymbol
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLExtensionWrapper>>targetClass [
	^ targetClass
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLExtensionWrapper>>targetClass: aClass [
	targetClass := aClass
]
