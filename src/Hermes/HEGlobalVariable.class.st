"

"
Class {
	#name : #HEGlobalVariable,
	#superclass : #HESymbol,
	#category : #Hermes-Model,
	#timestamp : ''
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:17'
}
HEGlobalVariable class>>tag [
	^ 7.
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 07:16:17'
}
HEGlobalVariable>>asLiteralIn: env [
	^ env newClass bindingOf: value
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:17'
}
HEGlobalVariable>>value: aClassVariable [
	value := aClassVariable name.
]
