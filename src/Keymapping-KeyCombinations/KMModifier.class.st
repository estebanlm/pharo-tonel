"
I'm an abstract class representing a key modifier. A modifier is a key that is pressed to modify the value of a following key. For example, valid modifiers are Alt, Ctrl, Cmd (only for macosx), Shift. Additionally, I could be a composed modifier, combining several of the named above. For example, I could have a value of Alt + Ctrl.
"
Class {
	#name : #KMModifier,
	#superclass : #KMKeyCombination,
	#instVars : [
		'identifier',
		'name'
	],
	#category : #Keymapping-KeyCombinations,
	#timestamp : '<historical>'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:19'
}
KMModifier class>>alt [
	^ KMAltModifier new
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:19'
}
KMModifier class>>command [
	^ KMCommandModifier new
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:19'
}
KMModifier class>>control [
	^ KMCtrlModifier new
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:19'
}
KMModifier class>>ctrl [
	^ KMCtrlModifier new
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:19'
}
KMModifier class>>meta [
	^ KMMetaModifier new
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:19'
}
KMModifier class>>shift [
	^ KMShiftModifier new
]

{
	#category : #combining,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMModifier>>+ modifier [
	^ modifier asKeyCombination modifiedBy: self
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMModifier>>= aShortcut [
	super = aShortcut
		ifFalse: [ ^ false ].
	^ aShortcut eventCode = self eventCode
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMModifier>>eventCode [
	"No modifiers"
	
	^ 0.
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMModifier>>hash [
	^ self eventCode hash
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMModifier>>identifier [
	^ identifier
]

{
	#category : #matching,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMModifier>>matches: aKeyboardEvent [
	self shouldNotImplement
]

{
	#category : #matching,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMModifier>>matchesEvent: aKeyboardEvent [
	self subclassResponsibility
]

{
	#category : #combining,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMModifier>>modifiedBy: modifier [
	^ KMComposedModifier new
		modifiedBy: modifier;
		modifiedBy: self;
		yourself
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMModifier>>name [
	^ name
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMModifier>>printOn: aStream [
	aStream << name
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMModifier>>species [

	^ KMModifier
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMModifier>>symbol [
	^ '⌘'
]
