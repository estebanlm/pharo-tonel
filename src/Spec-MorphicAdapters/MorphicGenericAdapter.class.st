"
I am a generic adapter used to embed directly a Morph in spec.

Be aware that when you use this, you broke Spec plateform independency and force you application to run only on top of Morphic
"
Class {
	#name : #MorphicGenericAdapter,
	#superclass : #AbstractMorphicAdapter,
	#category : #Spec-MorphicAdapters,
	#timestamp : '<historical>'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicGenericAdapter class>>morph: morph [

	^ self new
		morph: morph;
		yourself
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicGenericAdapter>>morph [

	^ self widget
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicGenericAdapter>>morph: anObject [

	widget := anObject
]
