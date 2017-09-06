"

"
Class {
	#name : #HEClassVariable,
	#superclass : #HESymbol,
	#category : #Hermes-Model,
	#timestamp : ''
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:17'
}
HEClassVariable class>>tag [
	^ 6.
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 07:16:17'
}
HEClassVariable>>asLiteralIn: env [
	^ env newClass bindingOf: value 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:17'
}
HEClassVariable>>value: aClassVariable [
	value := aClassVariable name.
]
