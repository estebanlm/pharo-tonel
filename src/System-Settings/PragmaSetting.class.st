"
A PragmaSetting is a holder for a setting. A setting is declared in a class method which contains a pragma (as examples, <menu> or <setting>). 
Settings can be collected on the fly by a PragmaCollector and browsed by a SettingBrowser. Settings are organized in trees.

Instance Variables
	allowedInStyle:		<Object>
	description:		<Object>
	dialog:		<Object>
	icon:		<Object>
	label:		<Object>
	name:		<Object>
	order:		<Object>
	ordering:		<Object>
	precondition:		<Object>
	target:		<Object>
	targetSelector:		<Object>

allowedInStyle
	- xxxxx

description
	- xxxxx

dialog
	- xxxxx

icon
	- xxxxx

label
	- xxxxx

name
	- xxxxx

order
	- xxxxx

ordering
	- xxxxx

precondition
	- xxxxx

target
	- xxxxx

targetSelector
	- xxxxx

"
Class {
	#name : #PragmaSetting,
	#superclass : #Model,
	#instVars : [
		'precondition',
		'target',
		'targetSelector',
		'name',
		'label',
		'description',
		'order',
		'icon',
		'ordering',
		'dialog',
		'allowedInStyle'
	],
	#category : #System-Settings-Core,
	#timestamp : 'AlainPlantec 1/3/2011 10:54'
}

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 05:26:16'
}
PragmaSetting>>= other  [
	^ self species = other species
		and: [self name = other name]
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:16'
}
PragmaSetting>>acceptSettings: aVisitor [
	^ aVisitor visitPragmaSetting: self
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:16'
}
PragmaSetting>>allowedInStyle [
	^ allowedInStyle ifNil: [allowedInStyle := self hasValue]
]

{
	#category : #'user interface',
	#timestamp : ' 8/31/2017 05:26:16'
}
PragmaSetting>>asString [
	^ self name
]

{
	#category : #'user interface',
	#timestamp : ' 8/31/2017 05:26:16'
}
PragmaSetting>>chooseFileDirectory [
	| result |
	result := self theme chooseDirectoryIn: World title: 'Choose a file' path: nil.
	result ifNotNil: [ self realValue: result fullName ].
]

{
	#category : #'user interface',
	#timestamp : ' 8/31/2017 05:26:16'
}
PragmaSetting>>chooseFilePath [
	| result |
	result := self theme fileOpenIn: World title: 'Choose a file' extensions: nil path: nil preview: true.
	result 
		ifNotNil: [
			self realValue: result name. 
			result close]
]

{
	#category : #'user interface',
	#timestamp : ' 8/31/2017 05:26:16'
}
PragmaSetting>>defaultIcon [
	^ self iconNamed: #smallConfigurationIcon
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:16'
}
PragmaSetting>>description [
	"Answer the value of description"

	^ description 
		ifNil: [description := ''] 
		ifNotNil: [ description translated ]

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:16'
}
PragmaSetting>>description: aString [
	"Set the value of description"

	description := aString 
]

{
	#category : #'user interface',
	#timestamp : ' 8/31/2017 05:26:16'
}
PragmaSetting>>dialog [
	^ dialog
]

{
	#category : #'user interface',
	#timestamp : ' 8/31/2017 05:26:16'
}
PragmaSetting>>dialog: aValuable [
	dialog := aValuable
]

{
	#category : #'user interface',
	#timestamp : ' 8/31/2017 05:26:16'
}
PragmaSetting>>enabled [
	^ true
]

{
	#category : #export,
	#timestamp : ' 8/31/2017 05:26:16'
}
PragmaSetting>>exportSettingAction [
	
	^ nil
]

{
	#category : #'user interface',
	#timestamp : ' 8/31/2017 05:26:16'
}
PragmaSetting>>fontButtonLabel [
	| emphases |
	emphases := IdentityDictionary new at: nil put: 'Regular' translated;
				 at: 0 put: 'Regular' translated;
				 at: 1 put: 'Bold' translated;
				 at: 2 put: 'Italic' translated;
				 at: 4 put: 'Underlined' translated;
				 at: 8 put: 'Narrow' translated; 
				 at: 16 put: 'StruckOut' translated;
				 yourself.
	^ StringMorph contents: self realValue familyName , ' '
			, (emphases
					at: self realValue emphasis
					ifAbsent: ['']) , ' ' , self realValue pointSize asString font: self realValue
]

{
	#category : #'user interface',
	#timestamp : ' 8/31/2017 05:26:16'
}
PragmaSetting>>getFont [
	^ FontChooser
		openWithWindowTitle: 'Font for ' , self name
		for: self
		setSelector: #realValue:
		getSelector: #realValue 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:16'
}
PragmaSetting>>hasDefault [
	^ false
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:16'
}
PragmaSetting>>hasEditableList [
	^ false
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:16'
}
PragmaSetting>>hasValue [
	^ false
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 05:26:16'
}
PragmaSetting>>hash [
	^ self species hash bitXor: self name hash 
]

{
	#category : #'user interface',
	#timestamp : ' 8/31/2017 05:26:16'
}
PragmaSetting>>icon [
	^ icon ifNil: [icon := self defaultIcon]
]

{
	#category : #'user interface',
	#timestamp : ' 8/31/2017 05:26:16'
}
PragmaSetting>>icon: aForm  [
	icon := aForm
]

{
	#category : #'user interface',
	#timestamp : ' 8/31/2017 05:26:16'
}
PragmaSetting>>inputMorphFor: aContainer  [
	^ self inputWidget
		ifNotNil: [:iw | 
			( self theme newRowIn: World for: {iw})
				 clipSubmorphs: true;
				 hResizing: #shrinkWrap;
				 cellInset: 0;
				 yourself]
]

{
	#category : #'user interface',
	#timestamp : ' 8/31/2017 05:26:16'
}
PragmaSetting>>inputWidget [
	"return the default widget for the input a the setting"
	^ self dialog
		ifNotNil: [:d | d numArgs = 0
				ifTrue: [d value]
				ifFalse: [d value: self]] 
]

{
	#category : #export,
	#timestamp : ' 8/31/2017 05:26:16'
}
PragmaSetting>>isExportable [

	^ false
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:16'
}
PragmaSetting>>label [
	^ label ifNil: [self name translated] ifNotNil: [label translated]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:16'
}
PragmaSetting>>label: aString [
	label := aString
]

{
	#category : #'user interface',
	#timestamp : ' 8/31/2017 05:26:16'
}
PragmaSetting>>labelMorphFor: aContainer [
	^ StringMorph contents: (aContainer model viewedLabelOfSetting: self)
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:16'
}
PragmaSetting>>name [
	^ name ifNil: [super name] ifNotNil: [name]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:16'
}
PragmaSetting>>name: aName [
	name := aName
]

{
	#category : #'user interface',
	#timestamp : ' 8/31/2017 05:26:16'
}
PragmaSetting>>noOrdering [
	ordering := false
]

{
	#category : #'user interface',
	#timestamp : ' 8/31/2017 05:26:16'
}
PragmaSetting>>notInStyle [
	allowedInStyle := false
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:16'
}
PragmaSetting>>order [
	^ order
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:16'
}
PragmaSetting>>order: aNumber [
	order := aNumber
]

{
	#category : #'user interface',
	#timestamp : ' 8/31/2017 05:26:16'
}
PragmaSetting>>ordering [
	^ ordering ifNil: [ordering := true]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:16'
}
PragmaSetting>>precondition [
	^ precondition ifNil: [precondition := [true]].
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:16'
}
PragmaSetting>>precondition: aValuable [
	precondition := aValuable
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:16'
}
PragmaSetting>>realTarget [
	^ target isSymbol
		ifTrue: [ Smalltalk globals at: target ifAbsent: [  ] ]
		ifFalse: [ target ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:16'
}
PragmaSetting>>settingReceiver [
	^ self targetSelector ifNil: [self realTarget] ifNotNil: [self realTarget perform: self targetSelector]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:16'
}
PragmaSetting>>target [
	^ target
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:16'
}
PragmaSetting>>target: anObject [
	target := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:16'
}
PragmaSetting>>targetSelector [
	^ targetSelector
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:16'
}
PragmaSetting>>targetSelector: aSelector [
	targetSelector := aSelector
]
