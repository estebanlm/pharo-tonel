"
A PragmaMenuAndShortcutRegistrationItem is an item of a menu or keymap
"
Class {
	#name : #PragmaMenuAndShortcutRegistrationItem,
	#superclass : #Object,
	#instVars : [
		'item',
		'action',
		'parent',
		'order',
		'enabledBlock',
		'label',
		'help',
		'icon',
		'selector',
		'arguments',
		'withSeparatorAfter',
		'target',
		'enabled',
		'group',
		'with',
		'precondition',
		'shortcut',
		'platform',
		'default',
		'category',
		'shortcutName',
		'keyText'
	],
	#category : #MenuRegistration-Core,
	#timestamp : '<historical>'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
PragmaMenuAndShortcutRegistrationItem>>action [
	
	^ action
]

{
	#category : #'menu protocol',
	#timestamp : ' 8/31/2017 05:26:13'
}
PragmaMenuAndShortcutRegistrationItem>>action: aBlock [

	action := aBlock
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
PragmaMenuAndShortcutRegistrationItem>>arguments [
	
	^ arguments
]

{
	#category : #'menu protocol',
	#timestamp : ' 8/31/2017 05:26:13'
}
PragmaMenuAndShortcutRegistrationItem>>arguments: anArray [

	arguments := anArray
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:13'
}
PragmaMenuAndShortcutRegistrationItem>>category [

	^ category
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:13'
}
PragmaMenuAndShortcutRegistrationItem>>category: aByteSymbol  [
	
	category := aByteSymbol
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
PragmaMenuAndShortcutRegistrationItem>>default [

	^ default
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:13'
}
PragmaMenuAndShortcutRegistrationItem>>default: aKMModifiedShortcut  [

	default := aKMModifiedShortcut 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
PragmaMenuAndShortcutRegistrationItem>>enabled [

	^ enabled
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
PragmaMenuAndShortcutRegistrationItem>>enabled: aBoolean [

	enabled := aBoolean
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
PragmaMenuAndShortcutRegistrationItem>>enabledBlock [
	
	^ enabledBlock
]

{
	#category : #'menu protocol',
	#timestamp : ' 8/31/2017 05:26:13'
}
PragmaMenuAndShortcutRegistrationItem>>enabledBlock: aBlock [

	enabledBlock := aBlock
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
PragmaMenuAndShortcutRegistrationItem>>group [
	
	^ group
]

{
	#category : #'menu protocol',
	#timestamp : ' 8/31/2017 05:26:13'
}
PragmaMenuAndShortcutRegistrationItem>>group: aSymbol [

	group := aSymbol
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
PragmaMenuAndShortcutRegistrationItem>>help [

	^ help
]

{
	#category : #'menu protocol',
	#timestamp : ' 8/31/2017 05:26:13'
}
PragmaMenuAndShortcutRegistrationItem>>help: aString  [
	
	help := aString 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
PragmaMenuAndShortcutRegistrationItem>>icon [

	^ icon
]

{
	#category : #'menu protocol',
	#timestamp : ' 8/31/2017 05:26:13'
}
PragmaMenuAndShortcutRegistrationItem>>icon: anIcon [
	
	icon := anIcon
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:13'
}
PragmaMenuAndShortcutRegistrationItem>>initialize [

	super initialize.

	withSeparatorAfter := false.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
PragmaMenuAndShortcutRegistrationItem>>isWithSeparatorAfter [
	
	^ withSeparatorAfter
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
PragmaMenuAndShortcutRegistrationItem>>item [

	^ item
]

{
	#category : #'menu protocol',
	#timestamp : ' 8/31/2017 05:26:13'
}
PragmaMenuAndShortcutRegistrationItem>>item: aSymbol  [
	
	item := aSymbol
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
PragmaMenuAndShortcutRegistrationItem>>keyText [
	^keyText
]

{
	#category : #'menu protocol',
	#timestamp : ' 8/31/2017 05:26:13'
}
PragmaMenuAndShortcutRegistrationItem>>keyText: aString [
	keyText := aString
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
PragmaMenuAndShortcutRegistrationItem>>label [

	^ label
]

{
	#category : #'menu protocol',
	#timestamp : ' 8/31/2017 05:26:13'
}
PragmaMenuAndShortcutRegistrationItem>>label: aString [
	
	label := aString
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
PragmaMenuAndShortcutRegistrationItem>>order [

	^ order
]

{
	#category : #'menu protocol',
	#timestamp : ' 8/31/2017 05:26:13'
}
PragmaMenuAndShortcutRegistrationItem>>order: anInteger  [

	order := anInteger
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
PragmaMenuAndShortcutRegistrationItem>>parent [

	^ parent
]

{
	#category : #'menu protocol',
	#timestamp : ' 8/31/2017 05:26:13'
}
PragmaMenuAndShortcutRegistrationItem>>parent: aSymbol  [
	
	parent := aSymbol 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
PragmaMenuAndShortcutRegistrationItem>>platform [

	^ platform
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:13'
}
PragmaMenuAndShortcutRegistrationItem>>platform: aSymbol  [

	platform := aSymbol
]

{
	#category : #'menu protocol',
	#timestamp : ' 8/31/2017 05:26:13'
}
PragmaMenuAndShortcutRegistrationItem>>precondition: aBlock [
	
	precondition := aBlock 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
PragmaMenuAndShortcutRegistrationItem>>selector [

	^ selector
]

{
	#category : #'menu protocol',
	#timestamp : ' 8/31/2017 05:26:13'
}
PragmaMenuAndShortcutRegistrationItem>>selector: aSymbol  [
	
	selector := aSymbol 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
PragmaMenuAndShortcutRegistrationItem>>shortcut [
	
	^ shortcut
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:13'
}
PragmaMenuAndShortcutRegistrationItem>>shortcut: aSymbol  [
	
	shortcut := aSymbol
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:13'
}
PragmaMenuAndShortcutRegistrationItem>>shortcutName [
	
	^shortcutName
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:13'
}
PragmaMenuAndShortcutRegistrationItem>>shortcutName: aSymbol  [
	
	shortcutName := aSymbol
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
PragmaMenuAndShortcutRegistrationItem>>target [

	^ target
]

{
	#category : #'menu protocol',
	#timestamp : ' 8/31/2017 05:26:13'
}
PragmaMenuAndShortcutRegistrationItem>>target: aSymbol  [
	
	target := aSymbol 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
PragmaMenuAndShortcutRegistrationItem>>with [

	^ with
]

{
	#category : #'menu protocol',
	#timestamp : ' 8/31/2017 05:26:13'
}
PragmaMenuAndShortcutRegistrationItem>>with: aBlock [
 
	with := aBlock
]

{
	#category : #'menu protocol',
	#timestamp : ' 8/31/2017 05:26:13'
}
PragmaMenuAndShortcutRegistrationItem>>withSeparatorAfter [

	withSeparatorAfter := true
]
