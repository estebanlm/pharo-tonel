"
I am an entry in a Scope that gets associated with variable nodes of the same name. 
"
Class {
	#name : #OCAbstractVariable,
	#superclass : #Object,
	#instVars : [
		'scope',
		'usage'
	],
	#category : #OpalCompiler-Core-Semantics,
	#timestamp : '<historical>'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCAbstractVariable class>>semanticNodeClass [
	self subclassResponsibility 
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCAbstractVariable>>asString [

	^ self name
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCAbstractVariable>>definingScope [
	^ scope
]

{
	#category : #emitting,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCAbstractVariable>>emitStore: methodBuilder [

	self subclassResponsibility
]

{
	#category : #emitting,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCAbstractVariable>>emitValue: methodBuilder [

	self subclassResponsibility
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCAbstractVariable>>isArg [
	^false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCAbstractVariable>>isClassVariable [
	^ false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCAbstractVariable>>isGlobal [

	^ false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCAbstractVariable>>isGlobalVariable [
	^ false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCAbstractVariable>>isInstance [
	^false

]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCAbstractVariable>>isLiteralVariable [
	^false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCAbstractVariable>>isLocal [

	^false
]

{
	#category : #'read/write usage',
	#timestamp : ' 8/31/2017 07:16:23'
}
OCAbstractVariable>>isRead [
	^usage = #read

]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCAbstractVariable>>isRemote [
	^false
]

{
	#category : #'read/write usage',
	#timestamp : ' 8/31/2017 07:16:23'
}
OCAbstractVariable>>isRepeatedWrite [
	^usage = #repeatedWrite

]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCAbstractVariable>>isSelf [
	^false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCAbstractVariable>>isSpecialVariable [
	^false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCAbstractVariable>>isSuper [
	^false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCAbstractVariable>>isTemp [

	^ false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCAbstractVariable>>isUndeclared [

	^ false
]

{
	#category : #'read/write usage',
	#timestamp : ' 8/31/2017 07:16:23'
}
OCAbstractVariable>>isUninitialized [

	^ false
]

{
	#category : #'read/write usage',
	#timestamp : ' 8/31/2017 07:16:23'
}
OCAbstractVariable>>isUnused [
	"when the var is never read or written, it is not used.
	Note: we have a special #arg use which means arguments are never unused"
	^ usage isNil
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCAbstractVariable>>isWritable [
	^ true
]

{
	#category : #'read/write usage',
	#timestamp : ' 8/31/2017 07:16:23'
}
OCAbstractVariable>>isWrite [
	^ usage = #write or: [ self isRepeatedWrite ]
]

{
	#category : #'read/write usage',
	#timestamp : ' 8/31/2017 07:16:23'
}
OCAbstractVariable>>markRead [
	"reading does not change a #write, nor an #arg"
	usage ifNil: [usage := #read]
]

{
	#category : #'read/write usage',
	#timestamp : ' 8/31/2017 07:16:23'
}
OCAbstractVariable>>markRepeatedWrite [
	"blocks in a loop have to know if write usage happens outside (just #write) or
	in the loop -> #repeatedWrite"
	usage := #repeatedWrite.
]

{
	#category : #'read/write usage',
	#timestamp : ' 8/31/2017 07:16:23'
}
OCAbstractVariable>>markWrite [
	"write is the strongest use: a read is turned into a write"
	usage := #write.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCAbstractVariable>>name [

	^ self subclassResponsibility
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCAbstractVariable>>originalVar [
	^ self
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCAbstractVariable>>printOn: stream [

	stream nextPutAll: self name
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCAbstractVariable>>scope [

	^ scope
]

{
	#category : #initializing,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCAbstractVariable>>scope: aLexicalScope [

	scope := aLexicalScope
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCAbstractVariable>>semanticNodeClass [
	^self class semanticNodeClass
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCAbstractVariable>>usage [

	^ usage
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCAbstractVariable>>usage: anObject [

	usage := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCAbstractVariable>>variable [
	"I return the first class variable that I model in the case of globals and ivars"
	^self
]
