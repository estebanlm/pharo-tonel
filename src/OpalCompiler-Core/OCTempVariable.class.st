"
I model temp variables. With Closures, there are two kinds: Copying and those that are stores in a so called temp vector, a heap allocated array that itself is stored in an un-named copying temp variable.
"
Class {
	#name : #OCTempVariable,
	#superclass : #OCAbstractLocalVariable,
	#instVars : [
		'escaping'
	],
	#category : #OpalCompiler-Core-Semantics,
	#timestamp : 'MarcusDenker 8/11/2014 10:19'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCTempVariable class>>semanticNodeClass [

	^RBTemporaryNode 
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCTempVariable>>= aTempVar [

	^aTempVar class = self class 
		and: [aTempVar scope = self scope 
		and: [aTempVar name = self name
		and: [aTempVar usage = self usage]]].

	
]

{
	#category : #emitting,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCTempVariable>>emitStore: methodBuilder [

	methodBuilder storeTemp: name. 
]

{
	#category : #emitting,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCTempVariable>>emitValue: methodBuilder [

	methodBuilder pushTemp: name.
]

{
	#category : #escaping,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCTempVariable>>escaping [
	^escaping
]

{
	#category : #escaping,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCTempVariable>>escaping: anObject [
	escaping := anObject
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCTempVariable>>hash [

	^ name hash bitXor: (usage hash bitXor: scope hash).
]

{
	#category : #debugging,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCTempVariable>>indexFromIR [

	^scope outerNotOptimizedScope node irInstruction indexForVarNamed: name
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCTempVariable>>initialize [
	super initialize.
	escaping := false.
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCTempVariable>>isCopying [
	^false
]

{
	#category : #escaping,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCTempVariable>>isEscaping [
	^escaping = #escapingRead or: [escaping = #escapingWrite]
]

{
	#category : #escaping,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCTempVariable>>isEscapingRead [
	^escaping = #escapingRead

]

{
	#category : #escaping,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCTempVariable>>isEscapingWrite [
	^escaping = #escapingWrite

]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCTempVariable>>isStoringTempVector [
	"I am a temp that stores a temp vector. Those generated temps have a invalid name starting with 0"
	^name first = $0.
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCTempVariable>>isTemp [

	^ true
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCTempVariable>>isTempVectorTemp [
	^false
]

{
	#category : #escaping,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCTempVariable>>markEscapingRead [
	escaping = #escapingWrite ifFalse: [escaping := #escapingRead]
]

{
	#category : #escaping,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCTempVariable>>markEscapingWrite [
	escaping := #escapingWrite.
	self isRepeatedWrite ifFalse:[usage := #write]
]

{
	#category : #escaping,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCTempVariable>>markRepeatedWrite [
	"same as write"
	self markWrite.
	super markRepeatedWrite.
]

{
	#category : #escaping,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCTempVariable>>markWrite [

	"if an escaping var is wrote to later, it needs to be remote"
	self isEscaping 
		ifTrue: [self markEscapingWrite].
	super markWrite.
]

{
	#category : #debugging,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCTempVariable>>readFromContext: aContext scope: contextScope [
	"Usually the loop is useless, the first case with i = offset returns the correct result. 
	However, the loop is required for specific case as Debugger restart feature."

	^ aContext tempAt: (contextScope outerNotOptimizedScope node irInstruction indexForVarNamed: name)
]

{
	#category : #debugging,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCTempVariable>>searchFromContext: aContext scope: contextScope [
	"Usually the loop is useless, the first case with i = offset returns the correct result. 
	However, the loop is required for specific case as Debugger restart feature."

	^ contextScope lookupVar: name inContext: aContext
]

{
	#category : #debugging,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCTempVariable>>writeFromContext: aContext scope: contextScope value: aValue [
	
	"offset := contextScope outerOffsetTo: scope.
	contextForRead := aContext.
	offset timesRepeat: [contextForRead := contextForRead outerContext].
	"^aContext tempAt: self indexFromIR put: aValue
]
