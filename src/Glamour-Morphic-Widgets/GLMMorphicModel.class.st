"

"
Class {
	#name : #GLMMorphicModel,
	#superclass : #Announcer,
	#traits : 'TViewModel',
	#classTraits : 'TViewModel classTrait',
	#instVars : [
		'glamourPresentation'
	],
	#category : #Glamour-Morphic-Widgets,
	#timestamp : ''
}

{
	#category : #callbacks,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMMorphicModel>>allKeystrokeActions [
	^ (self glamourPresentation allActions, self glamourPresentation allSelectionActions) select: [ :action | 
		action hasShortcut ]
]

{
	#category : #callbacks,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMMorphicModel>>allMenuActions [
	^ self glamourPresentation allSelectionActions select: [:action | action hasTitle ]
]

{
	#category : #callbacks,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMMorphicModel>>executeMenuAction: anAction [
	self announce: (GLMMenuItemSelected action: anAction)
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMMorphicModel>>glamourPresentation [
	^ glamourPresentation
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMMorphicModel>>glamourPresentation: anObject [
	glamourPresentation := anObject
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMMorphicModel>>initialize [
	super initialize.
]

{
	#category : #callbacks,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMMorphicModel>>keystroke: anEvent from: aMorph [
	| action |

	self deprecated: 'This method is needed only for the text rederer for PluggableTextMorph.'.
	action := self allKeystrokeActions detect: [:a | a shortcut = anEvent keyCharacter] ifNone: [nil].
	action ifNotNil: [ 
		self announce: (GLMKeyStroke action: action).
		^ true ].
	^ false
]

{
	#category : #callbacks,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMMorphicModel>>menu: aMenuMorph  [
	| subMenus targetMenuMorph subMenu allActions |
	subMenus := Dictionary new.
	allActions := self allMenuActions.
	allActions do: [ :action |
		targetMenuMorph := action category notNil 
			ifTrue: [ subMenus at: action category ifAbsentPut: [ 
					subMenu :=  MenuMorph new.
					aMenuMorph add: action category subMenu: subMenu.
					subMenu ] ]
			ifFalse: [ aMenuMorph ].
		(action separatorBefore and: [ allActions first ~= action ]) ifTrue: [ targetMenuMorph addLine ].
		(targetMenuMorph 
			add: action title
			target: self
			selector: #executeMenuAction:
			argument: action)
			enabled: (action isEnabledOn: self glamourPresentation);
			icon:  action icon;
			keyText: (action hasShortcut 
				ifTrue: [ action shortcutAsString ]
				ifFalse: [ nil ]).
		(action separatorAfter and: [ allActions last ~= action ]) ifTrue: [ targetMenuMorph addLine ] ].
	^ aMenuMorph
]
