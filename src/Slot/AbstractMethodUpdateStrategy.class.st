"
I am used to update compiled methods in response to class modifications.
My sublcasses implement different strategies to update affected methods.
"
Class {
	#name : #AbstractMethodUpdateStrategy,
	#superclass : #Object,
	#category : #Slot-ClassBuilder,
	#timestamp : '<historical>'
}

{
	#category : #updating,
	#timestamp : ' 8/31/2017 07:16:35'
}
AbstractMethodUpdateStrategy>>transform: oldClass to: newClass using: aMethodModification [

	self subclassResponsibility 
]
