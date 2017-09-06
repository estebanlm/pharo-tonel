"
I am a class refactoring change for removing a class. On execution, my class will be removed from the system (all globals).
"
Class {
	#name : #RBRemoveClassChange,
	#superclass : #RBRefactoryClassChange,
	#category : #Refactoring-Changes,
	#timestamp : 'NicolaiHess 9/9/2016 20:42'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:23'
}
RBRemoveClassChange class>>remove: aClass [
	^ self new changeClass: aClass
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:23'
}
RBRemoveClassChange class>>removeClassName: aSymbol [
	^ self new changeClassName: aSymbol
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBRemoveClassChange>>asUndoOperation [
	| classChanges |
	classChanges := RBRefactoryChangeManager changeFactory compositeRefactoryChange.
	self changeClass withAllSubclasses do: [ :each | 
		classChanges defineClass: each definition.
		each class instVarNames 
			do: [ :varName | classChanges addInstanceVariable: varName to: each class ].
		each selectors 
			do: [ :selector | classChanges compile: (each sourceCodeAt: selector) in: each ].
		each class selectors 
			do: [ :selector | classChanges compile: (each class sourceCodeAt: selector) in: each class ] ].
	^ classChanges
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBRemoveClassChange>>changeClass: aBehavior [
	super changeClass: aBehavior.
	isMeta := false
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBRemoveClassChange>>changeString [
	^ 'Remove ' , self displayClassName
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBRemoveClassChange>>primitiveExecute [
	self changeClass removeFromSystem
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBRemoveClassChange>>printOn: aStream  [
	aStream
		nextPutAll: self displayClassName;
		nextPutAll: ' removeFromSystem';
		nextPut: $!
]
