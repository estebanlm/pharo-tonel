"
I represent the addition of a protocol of a class or a trait.
"
Class {
	#name : #EpProtocolAddition,
	#superclass : #EpProtocolChange,
	#category : #Epicea-Model,
	#timestamp : 'MartinDias 12/12/2014 14:45'
}

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpProtocolAddition>>accept: aVisitor [
	^ aVisitor visitProtocolAddition: self
]
