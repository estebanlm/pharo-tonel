"
I represent a service

provider : the service provider
label : to be display in a menu
selector : to do the service
useLineAfter
stateSelector : a secondary selector (to be able to query state of the provider for example)
description : a description for balloon for example
argumentGetter : a selector to get additional arguments with (if selector requres them)
buttonLabel : a short label

The entire client interface (provided by FileList and other users of the registry)
is this (browse #getArgumentsFrom: and the 
senders of #argumentGetter:):

fullName (returns a String with the full filename)
dirAndFileName (returns {directory. fileName})
readOnlyStream (returns an open read-only stream)

"
Class {
	#name : #SimpleServiceEntry,
	#superclass : #Model,
	#instVars : [
		'provider',
		'label',
		'selector',
		'usingLineAfter',
		'stateSelector',
		'description',
		'argumentGetter',
		'buttonLabel'
	],
	#category : #System-FileRegistry,
	#timestamp : '<historical>'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:48'
}
SimpleServiceEntry class>>provider: anObject label: aString selector: aSymbol [

	^self provider: anObject label: aString selector: aSymbol description: ''.

]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:48'
}
SimpleServiceEntry class>>provider: anObject label: aString selector: aSymbol description: anotherString [

	^self new provider: anObject label: aString selector: aSymbol description: anotherString
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:48'
}
SimpleServiceEntry class>>provider: anObject label: aString selector: aSymbol description: anotherString buttonLabel: aLabel [
	"Answer a new service object with the given initializations.  This variant allows a custom button label to be provided, in order to preserve precious horizontal real-estate in the button pane, while still allowing more descriptive wordings in the popup menu"

	^ self new provider: anObject label: aString selector: aSymbol description: anotherString; buttonLabel: aLabel; yourself
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:48'
}
SimpleServiceEntry>>argumentGetter: aBlock [

	argumentGetter := aBlock
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:48'
}
SimpleServiceEntry>>buttonLabel [
	"Answer the label to be emblazoned on a button representing the service in a file list, for example"

	^ buttonLabel ifNil: [label]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:48'
}
SimpleServiceEntry>>buttonLabel: aString  [
	"Set the receiver's buttonLabel, to be used on a button in a 
	tool-pane; this is split out so that a more abbreviated wording 
	can be deployed if desired"
	buttonLabel := aString translated
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:48'
}
SimpleServiceEntry>>description [
	"may be used for balloon or other"

	^ description

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:48'
}
SimpleServiceEntry>>description: aString [
	"may be used for balloon or other"

	description := aString

]

{
	#category : #'services menu',
	#timestamp : ' 8/31/2017 07:16:48'
}
SimpleServiceEntry>>doNotUseLineAfter [

	self usingLineAfter: false
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:48'
}
SimpleServiceEntry>>extraSelector [
	"normally should not be used directly"

	^stateSelector
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:48'
}
SimpleServiceEntry>>extraSelector: aSymbol [

	stateSelector := aSymbol
]

{
	#category : #'performing service',
	#timestamp : ' 8/31/2017 07:16:48'
}
SimpleServiceEntry>>getArgumentsFrom: aProvider [

	argumentGetter ifNil: [^aProvider fullName].
	^argumentGetter value: aProvider
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:16:48'
}
SimpleServiceEntry>>initialize [
	
	super initialize.
	self useLineAfter
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:48'
}
SimpleServiceEntry>>label [
	^label
]

{
	#category : #extra,
	#timestamp : ' 8/31/2017 07:16:48'
}
SimpleServiceEntry>>performExtraFor: anObject [
	"carry out the extra service I provide"
	"the stateSelector can be used to ask state of the provider to be reflected in button or other"

	^stateSelector numArgs = 0
		ifTrue: [provider perform: stateSelector]
		ifFalse: [provider perform: stateSelector with: (self getArgumentsFrom: anObject) ]

]

{
	#category : #'performing service',
	#timestamp : ' 8/31/2017 07:16:48'
}
SimpleServiceEntry>>performServiceFor: anObject [
	"carry out the service I provide"

	^selector numArgs = 0
		ifTrue: [provider perform: selector]
		ifFalse: [
			selector numArgs = 1
				ifTrue: [ provider perform: selector with: (self getArgumentsFrom: anObject) ]
				ifFalse: [ provider perform: selector withArguments: (self getArgumentsFrom: anObject) ]]
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:48'
}
SimpleServiceEntry>>printOn: aStream [

	aStream nextPutAll: self class name; nextPutAll: ': ('.
	self provider notNil
		ifTrue: [aStream nextPutAll: provider printString].
	aStream nextPutAll: ' --- '. 
	self selector notNil
		ifTrue: [aStream nextPutAll: selector asString].
	aStream nextPut: $)


]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:48'
}
SimpleServiceEntry>>provider [

	^ provider
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:48'
}
SimpleServiceEntry>>provider: anObject label: aString selector: aSymbol  [
	"basic initialization message"
	provider := anObject.
	label := aString translated.
	selector := aSymbol.
	stateSelector := #none.
	description := ''
]

{
	#category : #'performing service',
	#timestamp : ' 8/31/2017 07:16:48'
}
SimpleServiceEntry>>provider: anObject label: aString selector: aSymbol description: anotherString  [
	"basic initialization message"
	self
		provider: anObject
		label: aString
		selector: aSymbol.
	stateSelector := #none.
	description := anotherString translated
]

{
	#category : #extra,
	#timestamp : ' 8/31/2017 07:16:48'
}
SimpleServiceEntry>>requestExtraSelector [
	"send me this message to ask me to perform secondary service"

	^#performExtraFor:

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:48'
}
SimpleServiceEntry>>selector [
	"normally should not be used directly"

	^selector
]

{
	#category : #'services menu',
	#timestamp : ' 8/31/2017 07:16:48'
}
SimpleServiceEntry>>useLineAfter [

	self usingLineAfter: true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:48'
}
SimpleServiceEntry>>usingLineAfter [

	^ usingLineAfter
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:48'
}
SimpleServiceEntry>>usingLineAfter: aBoolean [

	usingLineAfter := aBoolean
]
