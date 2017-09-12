"
A DialogWindowModel is a model used to describe a DialogWindow
"
Class {
	#name : #DialogWindowModel,
	#superclass : #WindowModel,
	#instVars : [
		'contents',
		'toolbar'
	],
	#category : #Spec-Core-Support
}

{ #category : #specs }
DialogWindowModel class >> adapterName [

	^ #DialogWindowAdapter
]

{ #category : #specs }
DialogWindowModel class >> defaultSpec [
	<spec>
	
	^ #(DialogWindowAdapter
		adapt: #(model))
]

{ #category : #private }
DialogWindowModel >> buildWithSpecLayout: aSpec [
	"Build the widget using the spec name provided as argument"
	| widget |
	
	(self spec notNil and: [ self needRebuild not ])
		ifTrue: [ widget := self spec instance ]
		ifFalse: [ 
			contents := self model buildWithSpecLayout: aSpec.
			widget := self privateAdapterFromModel: self withSpec: self defaultSpecSelector.
			contents := nil ].

	self extent ifNotNil: [:ex | 
		(widget respondsTo: #extent:)
			ifTrue: [ widget extent: ex ]].
		
	^ widget
]

{ #category : #api }
DialogWindowModel >> cancelAction: aBlock [

	^ self changed: #cancelAction: with: { aBlock }
]

{ #category : #api }
DialogWindowModel >> cancelled [

	^ self toolbar cancelled
]

{ #category : #accessing }
DialogWindowModel >> contents [

	^ contents
]

{ #category : #initialization }
DialogWindowModel >> initialize [

	super initialize.

	toolbar := OkCancelToolbar new asValueHolder.
	toolbar whenChangedDo: [ :t | self changed: #toolbar: with: { t } ]
]

{ #category : #api }
DialogWindowModel >> okAction: aBlock [

	^ self changed: #okAction: with: { aBlock }
]

{ #category : #api }
DialogWindowModel >> okButtonEnabled: aBoolean [

	self changed: #okButtonEnabled: with: { aBoolean }
]

{ #category : #api }
DialogWindowModel >> toolbar [

	^ toolbar value
]

{ #category : #api }
DialogWindowModel >> toolbar: aBar [

	toolbar value: aBar
]

{ #category : #api }
DialogWindowModel >> triggerCancelAction [

	self changed: #triggerCancelAction with: #()
]

{ #category : #api }
DialogWindowModel >> triggerOkAction [

	self changed: #triggerOkAction with: #()
]
