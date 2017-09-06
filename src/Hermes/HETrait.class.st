"

"
Class {
	#name : #HETrait,
	#superclass : #HEMethodContainer,
	#instVars : [
		'traitName'
	],
	#category : #Hermes-Model,
	#timestamp : ''
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:17'
}
HETrait class>>for: aTrait [
	^ self new
		fromTrait: aTrait;
		yourself
]

{
	#category : #reading,
	#timestamp : ' 8/31/2017 07:16:17'
}
HETrait>>doReadHeaderFrom: aReader [
	traitName := aReader readByteSymbol.
]

{
	#category : #writing,
	#timestamp : ' 8/31/2017 07:16:17'
}
HETrait>>doWriteHeaderInto: aWriter [
	aWriter writeByteString: traitName
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:17'
}
HETrait>>fromTrait: aTrait [
	traitName := aTrait name.

	self doFromMethodContainer: aTrait
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:17'
}
HETrait>>traitName [
	^ traitName
]
