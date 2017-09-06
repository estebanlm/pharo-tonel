"

"
Class {
	#name : #MetacelloMethodSection,
	#superclass : #Object,
	#instVars : [
		'attributes'
	],
	#category : #Metacello-Core-Constructors,
	#timestamp : ''
}

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloMethodSection>>attributePrintString [
    | stream |
    stream := WriteStream on: String new.
    self attributes size = 1
        ifTrue: [ stream nextPutAll: '#' , attributes first asString printString ]
        ifFalse: [ 
            stream nextPutAll: '#('.
            self attributes
                do: [ :attribute | 
                    stream
                        nextPutAll: '#' , attribute asString printString;
                        space ].
            stream nextPut: $) ].
    ^ stream contents
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloMethodSection>>attributes [
    attributes ifNil: [ attributes := OrderedCollection new ].
    ^ attributes
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloMethodSection>>attributes: aCollectionOrSymbol [
    attributes := aCollectionOrSymbol asMetacelloAttributeList
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloMethodSection>>includesAttributeFrom: attributeCollection [
    ^ (attributeCollection asSet intersection: self attributes asSet) notEmpty
]
