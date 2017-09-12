"
An ImageModel is a spec model for images.
See AbstractWidgetModel

self example

I provide the following variables and their accessors
- action is the action performed when I am displayed.
- image is the form i display.
"
Class {
	#name : #ImageModel,
	#superclass : #AbstractWidgetModel,
	#instVars : [
		'imageHolder',
		'action',
		'actionHolder',
		'autoScaleHolder'
	],
	#category : #Spec-Core-Widgets
}

{ #category : #specs }
ImageModel class >> adapterName [

	^ #ImageAdapter
]

{ #category : #specs }
ImageModel class >> defaultSpec [
	<spec>
	
	^ #(ImageAdapter
		adapt: #(model))
]

{ #category : #api }
ImageModel >> action [
	"<api: #inspect>"

	^ actionHolder value
]

{ #category : #api }
ImageModel >> action: aBlock [
	"Set the action of the image"
	"<api: #block getter: #action>"
	actionHolder value: aBlock
]

{ #category : #api-valueHolder }
ImageModel >> actionHolder [
	"To be able to register action when the action is changed."
	^ actionHolder
]

{ #category : #api }
ImageModel >> autoScale [
	"<api: #inspect>"

	^ autoScaleHolder value
]

{ #category : #api-valueHolder }
ImageModel >> autoScaleHolder [
	"To be able to register action when the autoscale is changed."

	^ autoScaleHolder
]

{ #category : #api }
ImageModel >> image [
	"<api: #inspect>"

	^ imageHolder value
]

{ #category : #api }
ImageModel >> image: aForm [
	"<api: #image getter: #image>"
	"Set the form of the imagemorph"
	
	imageHolder value: aForm
]

{ #category : #api-valueHolder }
ImageModel >> imageHolder [
	"To be able to register action when the image is changed."
	^ imageHolder
]

{ #category : #initialization }
ImageModel >> initialize [
	super initialize.
	imageHolder := nil asValueHolder.
	actionHolder := [] asValueHolder. 
	autoScaleHolder := false asValueHolder.
	imageHolder whenChangedDo: [ self changed: #getImage ].
]

{ #category : #api }
ImageModel >> switchAutoscale [
	autoScaleHolder value: autoScaleHolder value not.
	self changed: #switchAutoscale with: {}
]
