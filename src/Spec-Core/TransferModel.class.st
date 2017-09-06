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
	#category : #Spec-Core-Support,
	#timestamp : 'BenjaminVanRyseghem 4/24/2014 16:44'
}

{
	#category : #specs,
	#timestamp : ' 8/31/2017 05:26:18'
}
TransferModel class>>adapterName [

	^ #TransferAdapter
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
TransferModel>>from: aModel [

	source value: aModel
]

{
	#category : #initialize,
	#timestamp : ' 8/31/2017 05:26:18'
}
TransferModel>>initialize [

	super initialize.

	passenger := nil asValueHolder.
	source := nil asValueHolder.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
TransferModel>>passenger [

	^ passenger value
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
TransferModel>>source [

	^ source value
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
TransferModel>>transfer: anObject [

	passenger value: anObject
]
