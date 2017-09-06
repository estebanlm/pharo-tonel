"
I am a specialized layout which does not hold slots but only raw data (bytes or words).
"
Class {
	#name : #BitsLayout,
	#superclass : #ObjectLayout,
	#category : #Slot-Layout,
	#timestamp : '<historical>'
}

{
	#category : #extending,
	#timestamp : ' 8/31/2017 07:16:35'
}
BitsLayout>>extend [
	"Answer a default extension of me."

	^ self species new 
]

{
	#category : #reshaping,
	#timestamp : ' 8/31/2017 07:16:35'
}
BitsLayout>>extendAgain: aLayout with: aScope  [
	"Answer my default layout since any subclass of me only can have my layout type."

	^ self extend
		host: host;
		yourself
]

{
	#category : #extending,
	#timestamp : ' 8/31/2017 07:16:35'
}
BitsLayout>>extendWeak: aLayoutClassScope  [
	IncompatibleLayoutConflict new
		layout: self;
		subType: #weak;
		signal
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 07:16:35'
}
BitsLayout>>initializeInstance: anInstance [

]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:35'
}
BitsLayout>>isBits [
	^ true
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:35'
}
BitsLayout>>isBytes [
	^ self subclassResponsibility
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:35'
}
BitsLayout>>isVariable [
	^ true
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:35'
}
BitsLayout>>isWords [
	^ self isBytes not
]

{
	#category : #reshaping,
	#timestamp : ' 8/31/2017 07:16:35'
}
BitsLayout>>reshapeFrom: oldScope to: newParentLayout [
	"Answer the reshaped version of me for a new parent layout.

	If the new parent layout has not fields, then the new version 
	is just a copy of me. But if it has fields, that means that 
	the new version of me cannot be a bits layout anymore, so the
	answer is a new default layout. "

	^ newParentLayout hasFields 
		ifTrue: [ 
			(newParentLayout extend)
				host: host;
				yourself ]
		ifFalse: [ 
			self copy ]

]
