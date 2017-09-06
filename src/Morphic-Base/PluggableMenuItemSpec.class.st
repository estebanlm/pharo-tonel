"
I'm a spec for an item menu. The World menu pragma based registration uses it for now. I'm moved in this package so that later we can decide what to do with it. 
We could probably avoid MenuSpec and just use MenuMorph instead. 
"
Class {
	#name : #PluggableMenuItemSpec,
	#superclass : #Object,
	#instVars : [
		'label',
		'action',
		'checked',
		'enabled',
		'separator',
		'subMenu',
		'icon',
		'enabledBlock',
		'keyText',
		'help',
		'name'
	],
	#category : #Morphic-Base-Menus,
	#timestamp : 'StephaneDucasse 9/30/2014 20:22'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
PluggableMenuItemSpec>>action [
	"Answer the action associated with the receiver"
	^action
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
PluggableMenuItemSpec>>action: aMessageSend [
	"Answer the action associated with the receiver"
	action := aMessageSend
]

{
	#category : #morphic,
	#timestamp : ' 8/31/2017 05:26:13'
}
PluggableMenuItemSpec>>asMenuItemMorphFrom: parentMenu isLast: aBoolean [

	| it act lbl menu |
	it := self morphClass new.
	lbl := self label ifNil: [''].
	"here checked can be nil, true, false"
	checked notNil 
		ifTrue: [ lbl := self hasCheckBox -> lbl].
	it contents: lbl.
	it icon: self icon.
	it keyText: self keyText.
	it isEnabled: self enabled.
	(act := self action) ifNotNil: [
				it 
					target: act receiver;
					selector: act selector;
					arguments: act arguments ].
	(menu := self subMenu) ifNotNil: [ self enabled ifTrue: [ it subMenu: (menu asMenuMorph) ]].
		
	parentMenu ifNotNil: [ parentMenu addMorphBack: it ].
	aBoolean ifFalse: [ self separator ifTrue: [ parentMenu addLine ] ].
	^it
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
PluggableMenuItemSpec>>checked [
	"Answer whether the receiver is checked"
	^checked 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
PluggableMenuItemSpec>>checked: aBool [
	"Indicate whether the receiver is checked"
	checked := aBool.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
PluggableMenuItemSpec>>enabled [
	"Answer whether the receiver is enabled"
	^ enabledBlock
		ifNil:[enabled ifNil: [ true ]]
		ifNotNil: [ enabledBlock value ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
PluggableMenuItemSpec>>enabled: aBool [
	"Indicate whether the receiver is enabled"
	enabled := aBool
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
PluggableMenuItemSpec>>enabledBlock [

	^ enabledBlock
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
PluggableMenuItemSpec>>enabledBlock: aBlock [

	enabledBlock := aBlock
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
PluggableMenuItemSpec>>hasCheckBox	 [
	^ checked notNil
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
PluggableMenuItemSpec>>help [
	"Answer the message to get the help texts of this element."
	^ help
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
PluggableMenuItemSpec>>help: aSymbol  [
	"Indicate the message to retrieve the help texts of this element."
	help := aSymbol
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
PluggableMenuItemSpec>>icon [
	^ icon
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
PluggableMenuItemSpec>>icon: aForm [
	 icon := aForm
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
PluggableMenuItemSpec>>keyText [
	^keyText
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
PluggableMenuItemSpec>>keyText: aString [
	keyText := aString.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
PluggableMenuItemSpec>>label [
	"Answer the receiver's label"
	^label
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
PluggableMenuItemSpec>>label: aString [
	"Set the receiver's label"
	label := aString
]

{
	#category : #morphic,
	#timestamp : ' 8/31/2017 05:26:13'
}
PluggableMenuItemSpec>>morphClass [
	^ ToggleMenuItemMorph
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
PluggableMenuItemSpec>>name [
	^ name
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
PluggableMenuItemSpec>>name: anObject [
	name := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
PluggableMenuItemSpec>>separator [
	"Answer whether the receiver should be followed by a separator"
	^separator ifNil:[false]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
PluggableMenuItemSpec>>separator: aBool [
	"Indicate whether the receiver should be followed by a separator"
	separator := aBool.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
PluggableMenuItemSpec>>subMenu [
	"Answer the receiver's subMenu"
	^subMenu
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
PluggableMenuItemSpec>>subMenu: aMenuSpec [
	"Answer the receiver's subMenu"
	subMenu := aMenuSpec
]
