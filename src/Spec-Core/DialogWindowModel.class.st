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
	#category : #Spec-Core-Support,
	#timestamp : '<historical>'
}

{
	#category : #specs,
	#timestamp : ' 8/31/2017 05:26:18'
}
DialogWindowModel class>>adapterName [

	^ #DialogWindowAdapter
]

{
	#category : #specs,
	#timestamp : ' 8/31/2017 05:26:18'
}
DialogWindowModel class>>defaultSpec [
	<spec>
	
	^ #(DialogWindowAdapter
		adapt: #(model))
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:18'
}
DialogWindowModel>>buildWithSpecLayout: aSpec [
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

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
DialogWindowModel>>cancelAction: aBlock [

	^ self changed: #cancelAction: with: { aBlock }
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
DialogWindowModel>>cancelled [

	^ self toolbar cancelled
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
DialogWindowModel>>contents [

	^ contents
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:18'
}
DialogWindowModel>>initialize [

	super initialize.

	toolbar := OkCancelToolbar new asValueHolder.
	toolbar whenChangedDo: [ :t | self changed: #toolbar: with: { t } ]
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
DialogWindowModel>>okAction: aBlock [

	^ self changed: #okAction: with: { aBlock }
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
DialogWindowModel>>okButtonEnabled: aBoolean [

	self changed: #okButtonEnabled: with: { aBoolean }
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
DialogWindowModel>>toolbar [

	^ toolbar value
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
DialogWindowModel>>toolbar: aBar [

	toolbar value: aBar
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
DialogWindowModel>>triggerCancelAction [

	self changed: #triggerCancelAction with: #()
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
DialogWindowModel>>triggerOkAction [

	self changed: #triggerOkAction with: #()
]
