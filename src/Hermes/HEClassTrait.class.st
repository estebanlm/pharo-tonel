"

"
Class {
	#name : #HEClassTrait,
	#superclass : #HESymbol,
	#category : #Hermes-Model,
	#timestamp : ''
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:17'
}
HEClassTrait class>>tag [
	^ 22
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 07:16:17'
}
HEClassTrait>>asLiteralIn: env [
	^ (env classNamed: value) classTrait
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:17'
}
HEClassTrait>>value: aClassTrait [
	value := aClassTrait baseTrait name.
]
