"
I am an eye element for all inst vars, printing a description of all the instance vriables (usually second field in the inspector)
"
Class {
	#name : #AllInstVarsEyeElement,
	#superclass : #SelfEyeElement,
	#category : #Spec-Inspector-Element,
	#timestamp : '<historical>'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
AllInstVarsEyeElement>>description [
	^ self host longPrintStringLimitedTo: 2000
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
AllInstVarsEyeElement>>label [
	^ 'all inst vars'
]
