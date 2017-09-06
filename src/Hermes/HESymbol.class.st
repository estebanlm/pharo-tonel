"

"
Class {
	#name : #HESymbol,
	#superclass : #HEByteString,
	#category : #Hermes-Model,
	#timestamp : ''
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:17'
}
HESymbol class>>tag [
	^ 9.
]

{
	#category : #reading,
	#timestamp : ' 8/31/2017 07:16:17'
}
HESymbol>>doConvertValue: aValue [
	^ aValue asSymbol.
]
