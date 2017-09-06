"
I represent the class side of a class in a refactoring namespace. 

I shouldn't be created directly, but always be part of a refactoring namespace.
My  namespace usally knows me and my non meta class.
"
Class {
	#name : #RBMetaclass,
	#superclass : #RBAbstractClass,
	#category : #Refactoring-Core-Model,
	#timestamp : 'NicolaiHess 5/18/2016 23:43'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:24'
}
RBMetaclass class>>existingNamed: aSymbol  [
	^(self named: aSymbol)
		realName: aSymbol;
		yourself
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:24'
}
RBMetaclass class>>named: aSymbol  [
	^(self new)
		name: aSymbol;
		yourself
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBMetaclass>>allClassVariableNames [
	^ self theNonMetaClass allClassVariableNames
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBMetaclass>>allPoolDictionaryNames [
	^ self theNonMetaClass allPoolDictionaryNames
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBMetaclass>>directlyDefinesClassVariable: aString  [
	^ self theNonMetaClass directlyDefinesClassVariable: aString
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBMetaclass>>directlyDefinesPoolDictionary: aString  [
	^ self theNonMetaClass directlyDefinesPoolDictionary: aString
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBMetaclass>>isMeta [
	^true
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBMetaclass>>printOn: aStream [
	super printOn: aStream.
	aStream nextPutAll: ' class'
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBMetaclass>>realName: aSymbol  [
	self realClass: (Smalltalk globals at: aSymbol) classSide
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBMetaclass>>storeOn: aStream  [
	super storeOn: aStream.
	aStream nextPutAll: ' class'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBMetaclass>>theMetaClass [
	^ self
]
