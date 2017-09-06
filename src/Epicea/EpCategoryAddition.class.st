"
I represent the creation of a category in a package.
"
Class {
	#name : #EpCategoryAddition,
	#superclass : #EpCategoryChange,
	#category : #Epicea-Model,
	#timestamp : 'MartinDias 12/12/2014 14:48'
}

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpCategoryAddition>>accept: aVisitor [

	^ aVisitor visitCategoryAddition: self
]
