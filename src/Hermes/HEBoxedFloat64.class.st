"

"
Class {
	#name : #HEBoxedFloat64,
	#superclass : #HEExportedLiteral,
	#category : #Hermes-Model,
	#timestamp : ''
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:17'
}
HEBoxedFloat64 class>>tag [
	^ 3.
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 07:16:17'
}
HEBoxedFloat64>>asLiteralIn: env [
	^ value.
]

{
	#category : #reading,
	#timestamp : ' 8/31/2017 07:16:17'
}
HEBoxedFloat64>>doReadFrom: aReader [
	value := BoxedFloat64 new.
	value at:1 put: (aReader readUInt).
	value at:2 put: (aReader readUInt).	
]

{
	#category : #writing,
	#timestamp : ' 8/31/2017 07:16:17'
}
HEBoxedFloat64>>doWriteInto: aWriter [
	aWriter writeUInt: (value at:1).
	aWriter writeUInt: (value at:2).	
]
