"
STONDictionaryWriter helps in writing dictionary based STON representations.
"
Class {
	#name : #STONMapWriter,
	#superclass : #STONStreamWriter,
	#category : #STON-Core,
	#timestamp : '<historical>'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:27'
}
STONMapWriter>>at: key put: value [
	first ifTrue: [ first := false ] ifFalse: [ writer mapElementSeparator ].
	writer encodeKey: key value: value
]
