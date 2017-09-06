"
This eye element is used in the right panel of the debugger to show thiscontext instead of self as a label
"
Class {
	#name : #ThisContextEyeElement,
	#superclass : #SelfEyeElement,
	#category : #Spec-Inspector-Element,
	#timestamp : '<historical>'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
ThisContextEyeElement>>accessorCode [
	^ super label
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
ThisContextEyeElement>>label [
	^ 'thisContext'
]
