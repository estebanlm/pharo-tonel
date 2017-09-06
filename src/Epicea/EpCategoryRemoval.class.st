"
I represent the removal of a category in a package.
"
Class {
	#name : #EpCategoryRemoval,
	#superclass : #EpCategoryChange,
	#category : #Epicea-Model,
	#timestamp : 'MartinDias 12/12/2014 14:48'
}

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpCategoryRemoval>>accept: aVisitor [

	^ aVisitor visitCategoryRemoval: self
]
