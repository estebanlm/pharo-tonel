"
I am a model representing a transfer during a drag and drop operation. I keep a pointer the source of the drag, and a pointer to what is dragged
"
Class {
	#name : #TransferModel,
	#superclass : #AbstractWidgetModel,
	#instVars : [
		'passenger',
		'source'
	],
	#category : #Spec-Core-Support
}

{ #category : #specs }
TransferModel class >> adapterName [

	^ #TransferAdapter
]

{ #category : #accessing }
TransferModel >> from: aModel [

	source value: aModel
]

{ #category : #initialize }
TransferModel >> initialize [

	super initialize.

	passenger := nil asValueHolder.
	source := nil asValueHolder.
]

{ #category : #accessing }
TransferModel >> passenger [

	^ passenger value
]

{ #category : #accessing }
TransferModel >> source [

	^ source value
]

{ #category : #accessing }
TransferModel >> transfer: anObject [

	passenger value: anObject
]
