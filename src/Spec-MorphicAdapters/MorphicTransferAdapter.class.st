"
I am a morphic specific adapter used to build a transfer object during a drang and drop operation
"
Class {
	#name : #MorphicTransferAdapter,
	#superclass : #AbstractMorphicAdapter,
	#category : #Spec-MorphicAdapters,
	#timestamp : 'BenjaminVanRyseghem 4/24/2014 16:38'
}

{
	#category : #factory,
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicTransferAdapter>>buildWidget [

	^ SpecTransferMorph new
		model: self;
		passenger: self passenger;
		source: self source;
		yourself
]

{
	#category : #'widget API',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicTransferAdapter>>passenger [

	^ [ self model passenger ]
]

{
	#category : #'widget API',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicTransferAdapter>>source [

	^ [ self model source ]
]
