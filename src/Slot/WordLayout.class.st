"
I am a raw data layout that holds words (32 / 64 bit depending on the platform).
"
Class {
	#name : #WordLayout,
	#superclass : #BitsLayout,
	#category : #Slot-Layout,
	#timestamp : '<historical>'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:35'
}
WordLayout class>>extending: superLayout scope: aScope host: aClass [
	^ superLayout extendWord
		host: aClass;
		yourself
]

{
	#category : #extending,
	#timestamp : ' 8/31/2017 07:16:35'
}
WordLayout>>extendByte [
	IncompatibleLayoutConflict new
		layout: self;
		subType: #byte;
		signal
]

{
	#category : #format,
	#timestamp : ' 8/31/2017 07:16:35'
}
WordLayout>>instanceSpecification [
	^ 10
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:35'
}
WordLayout>>isBytes [
	^ false
]
