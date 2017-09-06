"
Actions are elements of behavior that are executed upon a keyboard shortcut or other event.

Instances of Action are stored and maintained by Presentations. The exact representation is determined by the renderer, but actions can define a keyboard shortcut that should trigger the action or a title, category and position to be able to use the action as a context menu item.
"
Class {
	#name : #GLMAction,
	#superclass : #GLMLoggedObject,
	#instVars : [
		'action',
		'title',
		'help',
		'keymap',
		'position',
		'category',
		'icon',
		'condition',
		'enabledCondition',
		'separatorAfter',
		'separatorBefore',
		'shouldShowTitle'
	],
	#category : #Glamour-Core,
	#timestamp : '<historical>'
}

{
	#category : #'public interface',
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMAction>>actOn: aPresentation  [
	 
	^ self action 
		glamourValueWithArgs: 
			(Array 
				with: aPresentation 
				withAll: aPresentation entity asGlamorousArray)
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMAction>>action  [
	"The code that should be executed when this action is triggered." 
	 
	^action
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMAction>>action: aBlock  [
	"The code that should be executed when this action is triggered. 
 
	The block can take optional arguments, the first will always be the 
	presentation on which this action was triggered." 
	 
	action := aBlock
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMAction>>category  [
	"The name of the category that should be used when this action is displayed in a context menu." 
	 
	^category
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMAction>>category: aString  [
	"The name of the category that should be used when this action is displayed in a context menu." 
	 
	category := aString
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMAction>>condition [
	^ condition ifNil: [ true ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMAction>>condition: anObject [
	condition := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMAction>>enabledCondition [
	^ enabledCondition ifNil: [ true ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMAction>>enabledCondition: anObject [
	enabledCondition := anObject
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMAction>>gtDisplayOn: stream [
	self hasTitle ifTrue: [
		stream nextPutAll: self title; space ].
	self hasShortcut ifTrue: [
		self keymap gtDisplayOn: stream.
		stream space ].
	self action gtDisplayOn: stream
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMAction>>hasIcon [
	 
	^self icon notNil
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMAction>>hasShortcut  [
	 
	^self keymap notNil
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMAction>>hasTitle  [
	 
	^self title notNil
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMAction>>help [
	^ help 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMAction>>help: aString  [
	help := aString
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMAction>>icon [
	^ icon
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMAction>>icon: anObject [
	icon := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMAction>>iconName: aSymbol [
	"Set the icon whose name is given by the aSymbol"
	self icon: (Smalltalk ui icons iconNamed: aSymbol)
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMAction>>isAvailableOn: aPresentation [
	^ self condition glamourValueWithArgs: 
			(Array 
				with: aPresentation 
				withAll: aPresentation entity asGlamorousArray)
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMAction>>isButton [
	^self hasIcon
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMAction>>isCategorized [
	 
	^self category notNil
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMAction>>isEnabledOn: aPresentation [
	^ self enabledCondition glamourValueWithArgs: 
			(Array 
				with: aPresentation 
				withAll: aPresentation entity asGlamorousArray)
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMAction>>isMenu [
	^self hasTitle and: [ self hasIcon not]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMAction>>keymap [

	^ keymap
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMAction>>keymap: aKeymap [

	keymap := aKeymap
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMAction>>position  [
	"The relative position within a context menu." 
	 
	^position
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMAction>>position: anInteger  [
	"The relative position within a context menu." 
	 
	position := anInteger
]

{
	#category : #rendering,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMAction>>renderGlamorouslyOn: aRenderer [
	^aRenderer renderAction: self
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMAction>>separatorAfter [
	
	^ separatorAfter ifNil: [ false ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMAction>>separatorAfter: aBoolean [
	
	separatorAfter := aBoolean
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMAction>>separatorBefore [
	
	^ separatorBefore ifNil: [ false ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMAction>>separatorBefore: aBoolean [
	
	separatorBefore := aBoolean
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMAction>>shortcut  [
	"Shortcut character that this action should be triggered with when the focus rests on the corresponding presentation. 
	Modifiers are platform specific an can not be defined." 
	 
	^ self keymap 
		ifNotNil: [ self keymap currentCharacter ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMAction>>shortcut: aCharacter  [
	"Shortcut character that this action should be triggered with when the focus rests on the corresponding presentation. 
	Modifiers are platform specific an can not be defined." 
	 
	aCharacter ifNil: [ 
		keymap := nil.
		^ self ].
	keymap := 
		(aCharacter isUppercase 
			ifTrue: [ aCharacter meta shift ]
			ifFalse: [ aCharacter meta ])
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMAction>>shortcutAsString  [
	"Answers a string explaining shortcut"
	self shortcut ifNil: [ ^ '' ].
	^ String streamContents: [ :stream |
		stream << Smalltalk os menuShortcutModifierString << '+'.
		self shortcut isUppercase 
			ifTrue: [ stream << 'shift+' ].
		stream << self shortcut asLowercase asString ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMAction>>shouldShowTitle [
	^ shouldShowTitle ifNil: [ shouldShowTitle := false ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMAction>>shouldShowTitle: anObject [
	shouldShowTitle := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMAction>>showTitle [
	shouldShowTitle := true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMAction>>title  [
	"Title that this action should use in a context menu." 
	 
	^title
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMAction>>title: anObject  [
	"Title that this action should use in a context menu." 
	 
	title := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMAction>>withSeparatorAfter [

	self separatorAfter: true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMAction>>withSeparatorBefore [

	self separatorBefore: true
]
