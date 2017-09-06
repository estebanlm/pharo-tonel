"
I am the bridge between a MenuItemModel and a ToggleMenuItemMorph
"
Class {
	#name : #MorphicMenuItemAdapter,
	#superclass : #AbstractMorphicAdapter,
	#category : #Spec-MorphicAdapters,
	#timestamp : '<historical>'
}

{
	#category : #'widget API',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicMenuItemAdapter>>action [

	^ self model action
]

{
	#category : #'widget API',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicMenuItemAdapter>>actionArguments [

	^ [ Array with: self ]
]

{
	#category : #'widget API',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicMenuItemAdapter>>autoRefresh [
	| autoRefresh | 
	
	autoRefresh := self model autoRefresh.
	
	^ (autoRefresh isBlock or: [ autoRefresh isMessageSend ])
		ifTrue: [ autoRefresh cull: self model ]
		ifFalse: [ autoRefresh ]
]

{
	#category : #'widget API',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicMenuItemAdapter>>balloonText [
	| balloonText | 
	
	balloonText := self model description.
	balloonText ifNil: [ ^ nil ].
	
	^ (balloonText isBlock or: [ balloonText isMessageSend ])
		ifTrue: [ balloonText cull: self model ]
		ifFalse: [ balloonText ]
]

{
	#category : #factory,
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicMenuItemAdapter>>buildWidget [
	^ self autoRefresh
		ifTrue: [ self buildWidgetAutoRefresh ]
		ifFalse: [ self buildWidgetNoRefersh ]
]

{
	#category : #factory,
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicMenuItemAdapter>>buildWidgetAutoRefresh [
	^ UpdatingMenuItemMorph new
		target: self;
		balloonTextSelector: #balloonText;
		subMenuSelector: #subMenu;
		nameSelector: #name;
		selector: #performMenuActionWith:;
		argumentsBlock: self actionArguments;
		getStateSelector: #state;
		iconSelector: #icon;
		enablementSelector: #enabled;
		keyText: self shortcutText;
		yourself
]

{
	#category : #factory,
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicMenuItemAdapter>>buildWidgetNoRefersh [
	^ ToggleMenuItemMorph new
		contents: self name;
		target: self;
		selector: #performMenuActionWith:;
		subMenu: self subMenu;
		argumentsBlock: self actionArguments;
		getStateSelector: self stateSelector;
		icon: self icon;
		enablementSelector: #enabled;
		balloonText: self balloonText;
		keyText: self shortcutText;
		yourself
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicMenuItemAdapter>>defaultModifierShortcut [
	
	^ self shortcut first isUppercase
		ifTrue: [ OSPlatform current defaultModifier + KMModifier shift + self shortcut first ]
		ifFalse: [ OSPlatform current defaultModifier + self shortcut first ]
]

{
	#category : #'widget API',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicMenuItemAdapter>>enabled [
	| enabled | 
	
	enabled := self model enabled.
	
	^ (enabled isBlock or: [ enabled isMessageSend ])
		ifTrue: [ enabled cull: self model ]
		ifFalse: [ enabled ]
]

{
	#category : #'widget API',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicMenuItemAdapter>>icon [
	| icon | 
	
	icon := self model icon.
	
	^ (icon isBlock or: [ icon isMessageSend ])
		ifTrue: [ icon cull: self model ]
		ifFalse: [ icon ]
]

{
	#category : #'widget API',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicMenuItemAdapter>>name [
	| name | 
	
	name := self model name.
	
	^ (name isBlock or: [ name isMessageSend ])
		ifTrue: [ name cull: self model ]
		ifFalse: [ name ]
]

{
	#category : #'widget API',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicMenuItemAdapter>>performMenuActionWith: arguments [

	^ self model performMenuActionWith: arguments
]

{
	#category : #'widget API',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicMenuItemAdapter>>shortcut [
	| shortcut | 
	
	shortcut := self model shortcut.
	
	^ (shortcut isBlock or: [ shortcut isMessageSend ])
		ifTrue: [ shortcut cull: self model ]
		ifFalse: [ shortcut ]
]

{
	#category : #'widget API',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicMenuItemAdapter>>shortcutText [
	| shortcut platform string |
	
	shortcut := self shortcut.
	shortcut isString ifTrue: [ shortcut := self defaultModifierShortcut ].
	shortcut ifNil: [ ^ nil ].
	platform := Smalltalk os platformFamily.
	shortcut combinationsDo: [ :each | (each platform = Smalltalk os platformFamily) ifTrue: [ shortcut := each ] ].
	
	string := '⌘⇧'.
	
	^ (platform =  #MacOSX and: [ 
		(StandardFonts menuFont hasGlyphsForAll: string) and: [
		string allSatisfy: [ :c | (StandardFonts menuFont characterFormAt: c) width~= 0 ]]])
		ifFalse: [ shortcut shortcut printString ]
		ifTrue: [ String streamContents: [:stream | shortcut shortcut prettyPrintOn: stream ] ]
]

{
	#category : #'widget API',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicMenuItemAdapter>>state [
	| state | 
	
	state := self model state.
	
	^ (state isBlock or: [ state isMessageSend ])
		ifTrue: [ state cull: self model ]
		ifFalse: [ state ]
]

{
	#category : #'widget API',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicMenuItemAdapter>>stateSelector [

	^ self state
		ifNil: [ nil ]
		ifNotNil: [ #state ]
]

{
	#category : #'widget API',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicMenuItemAdapter>>subMenu [
	| subMenu | 
	
	subMenu := self model subMenu.
	subMenu ifNil: [ ^ nil ].
	
	^ (subMenu isBlock or: [ subMenu isMessageSend ])
		ifTrue: [ subMenu cull: self model ]
		ifFalse: [ subMenu buildWithSpecAsPopup ]
]
