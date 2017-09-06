"
I am an eye element for the class of an inspected element.
"
Class {
	#name : #ClassEyeElement,
	#superclass : #AbstractEyeElement,
	#category : #Spec-Inspector-Element,
	#timestamp : '<historical>'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
ClassEyeElement>>accessorCode [
	^ 'self class'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
ClassEyeElement>>label [
	^ 'class'
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:18'
}
ClassEyeElement>>shouldShowInTree [
	^ false
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
ClassEyeElement>>value [
	^ self host class
]
