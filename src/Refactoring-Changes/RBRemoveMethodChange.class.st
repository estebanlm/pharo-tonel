"
I am a refactoring change for a method removement. I know about the class of this method, the selector and whether it is from the 
class or instance side. On removing this method (selector) will be removed from the class.
"
Class {
	#name : #RBRemoveMethodChange,
	#superclass : #RBRefactoryClassChange,
	#instVars : [
		'selector'
	],
	#category : #Refactoring-Changes,
	#timestamp : 'NicolaiHess 9/9/2016 20:43'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:23'
}
RBRemoveMethodChange class>>remove: aSymbol from: aClass [
	^ self new
		changeClass: aClass;
		selector: aSymbol;
		yourself
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBRemoveMethodChange>>= aRemoveMethodChange [
	super = aRemoveMethodChange
		ifFalse: [ ^ false ].
	^ selector = aRemoveMethodChange selector
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBRemoveMethodChange>>asUndoOperation [
	^ RBRefactoryChangeManager changeFactory addMethodSource: (self methodSourceFor: selector) in: self changeClass
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBRemoveMethodChange>>changeString [
	^ 'Remove <1s>>>#<2s>'
		expandMacrosWith: self displayClassName
		with: selector
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBRemoveMethodChange>>hash [
	^ selector hash
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBRemoveMethodChange>>primitiveExecute [
	^ self changeClass removeSelector: selector
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBRemoveMethodChange>>printOn: aStream  [
	aStream
		nextPutAll: self displayClassName;
		nextPutAll: ' removeSelector: ';
		print: self selector;
		nextPut: $!
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBRemoveMethodChange>>selector [
	^ selector
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBRemoveMethodChange>>selector: aSymbol [
	selector := aSymbol
]
