"
Block and Context cases for CannotReturn need to signal a dedicated exception.
(see subclasses and the related testcases)
"
Class {
	#name : #CannotReturn,
	#superclass : #Error,
	#instVars : [
		'result'
	],
	#category : #Kernel-Exceptions,
	#timestamp : 'MarcusDenker 5/30/2016 11:13'
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:33'
}
CannotReturn>>isResumable [

	^true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
CannotReturn>>result [

	^result
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
CannotReturn>>result: r [

	result := r
]
