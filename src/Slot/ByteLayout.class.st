"
I am a raw data layout that holds bytes (8 bit).
"
Class {
	#name : #ByteLayout,
	#superclass : #BitsLayout,
	#category : #Slot-Layout,
	#timestamp : '<historical>'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:35'
}
ByteLayout class>>extending: superLayout scope: aScope host: aClass [
	^ superLayout extendByte
		host: aClass;
		yourself
]

{
	#category : #extending,
	#timestamp : ' 8/31/2017 07:16:35'
}
ByteLayout>>extendWord [
	IncompatibleLayoutConflict new
		layout: self;
		subType: #word;
		signal
]

{
	#category : #format,
	#timestamp : ' 8/31/2017 07:16:35'
}
ByteLayout>>instanceSpecification [
	^ 16
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:35'
}
ByteLayout>>isBytes [
	^ true
]
