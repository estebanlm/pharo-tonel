"
I'm an InstructionClient that tries to guess the type of a given instance variable name of a class. 
"
Class {
	#name : #NECVarTypeGuesser,
	#superclass : #InstructionClient,
	#instVars : [
		'types',
		'receiverClass',
		'variableName',
		'found',
		'currentMethod',
		'hasSend',
		'contextCount'
	],
	#category : #NECompletion-Model,
	#timestamp : '<historical>'
}

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:21'
}
NECVarTypeGuesser class>>getClassFromTypeSuggestingName: aString  [
	| firstUppercaseLetter className aStream aClass |
	aStream := WriteStream on: String new.
	aStream nextPut: aString first asUppercase.
	aStream
		nextPutAll: (aString copyFrom: 2 to: aString size).
	className := aStream contents.
	aClass := Smalltalk
				at: className asSymbol
				ifAbsent: [].
	(aClass isKindOf: Class)
		ifTrue: [^ aClass].
	firstUppercaseLetter := aString indexOfFirstUppercaseCharacter.
	className := firstUppercaseLetter > 1
				ifTrue: [aString copyFrom: firstUppercaseLetter to: aString size]
				ifFalse: [^ nil].
	aClass := Smalltalk
				at: className asSymbol
				ifAbsent: [].
	(aClass isKindOf: Class)
		ifTrue: [^ aClass].
	^ nil
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:21'
}
NECVarTypeGuesser class>>variableName: aString class: aClass  [
	^self variableName: aString source: nil class: aClass 
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:21'
}
NECVarTypeGuesser class>>variableName: aString source: sourceString class: aClass  [
	| newInstance |
	newInstance := self basicNew initialize.
	newInstance 
		setVariableName: aString
		source: sourceString
		class: aClass.
	^ newInstance
]

{
	#category : #'bytecode decoding',
	#timestamp : ' 8/31/2017 05:26:21'
}
NECVarTypeGuesser>>blockReturnTop [
	contextCount := contextCount - 1
]

{
	#category : #'bytecode decoding',
	#timestamp : ' 8/31/2017 05:26:21'
}
NECVarTypeGuesser>>computeVarType [
	| info tempNames name |
	types ifEmpty: [ ^ nil ].
	info := types first.
	(hasSend and: [ info isDefinedByMessageSend not ])
		ifTrue: [ 
			info type: nil.
			^ info ].
	info isDefinedByTemporary
		ifFalse: [ ^ info ].
	tempNames := (receiverClass compiler parse: currentMethod sourceCode) tempNames.
	name := tempNames at: info temporaryOffset + 1.
	info type: (self class getClassFromTypeSuggestingName: name).
	^ info
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:21'
}
NECVarTypeGuesser>>initialize [
	super initialize.
	types := OrderedCollection new.
	hasSend := false.
	contextCount := 0
]

{
	#category : #'bytecode decoding',
	#timestamp : ' 8/31/2017 05:26:21'
}
NECVarTypeGuesser>>interpretNextInstructionUsing: aScanner  [
	found := false.
	aScanner interpretNextInstructionFor: self.
	^found

]

{
	#category : #public,
	#timestamp : ' 8/31/2017 05:26:21'
}
NECVarTypeGuesser>>methodRefs [
	^ #()
]

{
	#category : #public,
	#timestamp : ' 8/31/2017 05:26:21'
}
NECVarTypeGuesser>>perform [
	| infos infosOfMethod methodRefs |
	variableName isEmpty
		ifTrue: [^ nil].
	methodRefs := self methodRefs.
	methodRefs
		ifNil: [^ nil]. 
	methodRefs isBehavior
		ifTrue: [^ methodRefs].
	contextCount := 0.
	infos := SortedCollection
				sortBlock: [:a :b | a priority <= b priority].
	methodRefs
		do: [:each | 
			self prepare: each.
			infosOfMethod := self typeOfVarIn: each compiledMethod.
			infos addAll: infosOfMethod].
	infos notEmpty
		ifTrue: [^ infos first type].
	^ nil
]

{
	#category : #'bytecode decoding',
	#timestamp : ' 8/31/2017 05:26:21'
}
NECVarTypeGuesser>>popIntoLiteralVariable: anAssociation  [
	"Remove Top Of Stack And Store Into Literal Variable bytecode."
	self reset
]

{
	#category : #'bytecode decoding',
	#timestamp : ' 8/31/2017 05:26:21'
}
NECVarTypeGuesser>>popIntoTemporaryVariable: offset  [
	"Remove Top Of Stack And Store Into Temporary Variable bytecode."
	self reset

]

{
	#category : #'bytecode decoding',
	#timestamp : ' 8/31/2017 05:26:21'
}
NECVarTypeGuesser>>prepare: aCompiledMethod  [

]

{
	#category : #'bytecode decoding',
	#timestamp : ' 8/31/2017 05:26:21'
}
NECVarTypeGuesser>>pushActiveContext [
	"Push Active Context On Top Of Its Own Stack bytecode."
	contextCount := contextCount + 1
]

{
	#category : #'bytecode decoding',
	#timestamp : ' 8/31/2017 05:26:21'
}
NECVarTypeGuesser>>pushConstant: value  [
	"Push Constant, value, on Top Of Stack bytecode."
	| info |
	contextCount > 0 ifTrue: [ ^ self ].
	value ifNotNil: 
		[ info := NECTypeInfo definedByLiteral: value class.
		types add: info ]
]

{
	#category : #'bytecode decoding',
	#timestamp : ' 8/31/2017 05:26:21'
}
NECVarTypeGuesser>>pushLiteralVariable: anAssociation  [
	"Push Contents Of anAssociation On Top Of Stack bytecode."
	| info |
	contextCount > 0 ifTrue:[^self].

	info := NECTypeInfo definedByMessageSend: (anAssociation value isBehavior
		ifTrue: [ anAssociation value ]
		ifFalse: [ anAssociation value class ]).
	types add: info
]

{
	#category : #'bytecode decoding',
	#timestamp : ' 8/31/2017 05:26:21'
}
NECVarTypeGuesser>>pushTemporaryVariable: offset  [
	"Push Contents Of Temporary Variable Whose Index Is the  
	argument, offset, On Top Of Stack bytecode."
	| info |
		contextCount > 0 ifTrue:[^self].

	info := NECTypeInfo definedByTemporaryVar: offset.
	types add: info
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:21'
}
NECVarTypeGuesser>>reset [
	contextCount > 0 ifTrue:[^self].
	types reset.
	hasSend := false.
]

{
	#category : #'bytecode decoding',
	#timestamp : ' 8/31/2017 05:26:21'
}
NECVarTypeGuesser>>send: selector super: supered numArgs: numberArguments  [
	"Send Message With Selector, selector, bytecode. The argument,  
	supered, indicates whether the receiver of the message is specified with 
	'super' in the source method. The arguments of the message are found  
	in  
	the top numArguments locations on the stack and the receiver just  
	below them."
	contextCount > 0 ifTrue:[^self].

	hasSend := true
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:21'
}
NECVarTypeGuesser>>setVariableName: aString source: aSourceString class: aClass  [
	variableName := aString.
	receiverClass := aClass
]

{
	#category : #'bytecode decoding',
	#timestamp : ' 8/31/2017 05:26:21'
}
NECVarTypeGuesser>>typeOfVarIn: aMethod  [
	"Answer whether the receiver references an instance variable."
	| scanner end type infos |
	scanner := InstructionStream on: aMethod.
	end := scanner method endPC.
	currentMethod := aMethod.
	infos := OrderedCollection new.
	[ scanner pc <= end ] whileTrue: 
		[ (self interpretNextInstructionUsing: scanner) ifTrue: 
			[ type := self computeVarType.
			type ifNotNil: [ infos add: type ] ] ].
	^ infos
]
