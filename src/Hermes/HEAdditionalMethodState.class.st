"

"
Class {
	#name : #HEAdditionalMethodState,
	#superclass : #HEExportedLiteral,
	#instVars : [
		'method',
		'selector'
	],
	#category : #Hermes-Model,
	#timestamp : ''
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:17'
}
HEAdditionalMethodState class>>tag [
	^ 1.
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 07:16:17'
}
HEAdditionalMethodState>>asLiteralIn: env [
	| additionalMethodState |
	additionalMethodState := AdditionalMethodState new: value value size.
	additionalMethodState method: env newMethod.
	additionalMethodState selector: (selector asLiteralIn: env).

	value value withIndexDo: [ :e :idx | additionalMethodState basicAt: idx put: (e asLiteralIn: env) ].
	^ additionalMethodState
]

{
	#category : #reading,
	#timestamp : ' 8/31/2017 07:16:17'
}
HEAdditionalMethodState>>doReadFrom: aReader [
	method := HEExportedLiteral readFrom: aReader.
	selector := HEExportedLiteral readFrom: aReader.
	value := HEExportedLiteral readFrom: aReader.

]

{
	#category : #writing,
	#timestamp : ' 8/31/2017 07:16:17'
}
HEAdditionalMethodState>>doWriteInto: aWriter [
	method writeInto: aWriter.
	selector writeInto: aWriter.
	value writeInto: aWriter.		
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:17'
}
HEAdditionalMethodState>>value: anAdditionalMethodState [
	method := anAdditionalMethodState method asExportedLiteral.
	selector := anAdditionalMethodState selector asExportedLiteral.

	value := Array new: anAdditionalMethodState size.
	1 to: anAdditionalMethodState size do: [ :idx | value at: idx put: (anAdditionalMethodState basicAt: idx) ].
	value := value asExportedLiteral
]
