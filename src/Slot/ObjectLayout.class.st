"
I am the superclass of standard layouts for Objects.
"
Class {
	#name : #ObjectLayout,
	#superclass : #AbstractLayout,
	#instVars : [
		'compactClassIndex'
	],
	#category : #Slot-Layout,
	#timestamp : '<historical>'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:35'
}
ObjectLayout class>>extending: superLayout scope: aScope host: aClass [
	self subclassResponsibility
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:35'
}
ObjectLayout class>>layoutForType: typeSymbol [
	typeSymbol = #compiledMethod 
		ifTrue: [ ^ CompiledMethodLayout ].
	typeSymbol = #bytes 
		ifTrue: [ ^ ByteLayout ].
	typeSymbol = #words 
		ifTrue: [ ^ WordLayout ].
	typeSymbol = #weak 
		ifTrue: [ ^ WeakLayout ].
	typeSymbol = #variable 
		ifTrue: [ ^ VariableLayout ].
	typeSymbol = #normal 
		ifTrue: [ ^ FixedLayout ].
	typeSymbol = #immediate 
		ifTrue: [ ^ ImmediateLayout ].
	typeSymbol = #ephemeron
		ifTrue: [ ^ EphemeronLayout ].
	"hack to support user defined layouts"
	(Smalltalk hasClassNamed: typeSymbol) ifTrue: [ ^Smalltalk globals at: typeSymbol ].
	Error signal: 'Invalid layout type: ', typeSymbol asString.
]

{
	#category : #diff,
	#timestamp : ' 8/31/2017 07:16:35'
}
ObjectLayout>>computeChangesFrom: other in: modification [
	other hasSlots ifTrue: [
		modification removals: other allSlots asArray ]
]

{
	#category : #extending,
	#timestamp : ' 8/31/2017 07:16:35'
}
ObjectLayout>>extend [
	"Answer a default extension of me."

	^ self subclassResponsibility
]

{
	#category : #extending,
	#timestamp : ' 8/31/2017 07:16:35'
}
ObjectLayout>>extend: aScope [
	IncompatibleLayoutConflict new
		layout: self;
		subType: #slot;
		signal
]

{
	#category : #extending,
	#timestamp : ' 8/31/2017 07:16:35'
}
ObjectLayout>>extendByte [
	self hasFields ifTrue: [
		IncompatibleLayoutConflict new
			layout: self;
			subType: #byte;
			signal ].
	^ ByteLayout new
]

{
	#category : #extending,
	#timestamp : ' 8/31/2017 07:16:35'
}
ObjectLayout>>extendCompiledMethod [
	self hasFields ifTrue: [
		IncompatibleLayoutConflict new
			layout: self;
			subType: #compiledMethod;
			signal ].
	^ CompiledMethodLayout new
]

{
	#category : #extending,
	#timestamp : ' 8/31/2017 07:16:35'
}
ObjectLayout>>extendSmallInteger [
	self hasFields ifTrue: [
		IncompatibleLayoutConflict new
			layout: self;
			subType: #compiledMethod;
			signal ].
	^ ImmediateLayout new
]

{
	#category : #extending,
	#timestamp : ' 8/31/2017 07:16:35'
}
ObjectLayout>>extendVariable: aScope [
	IncompatibleLayoutConflict new
		layout: self;
		subType: #variable;
		signal
]

{
	#category : #extending,
	#timestamp : ' 8/31/2017 07:16:35'
}
ObjectLayout>>extendWord [
	self hasFields ifTrue: [
		IncompatibleLayoutConflict new
			layout: self;
			subType: #word;
			signal ].
	^ WordLayout new
]

{
	#category : #format,
	#timestamp : ' 8/31/2017 07:16:35'
}
ObjectLayout>>format [
	"Answer an Integer that encodes this layout in the way that VM expects it."
	
	| fieldSize  format |
	fieldSize := self fieldSize.
	format := self instanceSpecification.
	format := (format bitShift: 16) + fieldSize.
	^ format
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:16:35'
}
ObjectLayout>>initialize [
	compactClassIndex := 0
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 07:16:35'
}
ObjectLayout>>initializeInstance: anInstance [
	self subclassResponsibility
]

{
	#category : #format,
	#timestamp : ' 8/31/2017 07:16:35'
}
ObjectLayout>>instanceSpecification [
	self subclassResponsibility
]

{
	#category : #reshaping,
	#timestamp : ' 8/31/2017 07:16:35'
}
ObjectLayout>>reshapeFrom: oldScope to: newParentLayout [
	"Answer the reshaped version of me for a new parent layout."

	| newScope |
	newScope := self slotScope 
		rebase: oldScope 
		to: newParentLayout slotScope.
	^ newParentLayout extendAgain: self with: newScope.
]

{
	#category : #reshaping,
	#timestamp : ' 8/31/2017 07:16:35'
}
ObjectLayout>>reshapeTo: aModification [
	^ self class 
		extending: aModification classLayout
		scope: LayoutEmptyScope instance
		host: self host
]
