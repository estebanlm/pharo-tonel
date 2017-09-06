"
I represent the addition of a method to a class.  I can produce the CompiledMethod, install it, and then notify the system that the method has been added.  This allows Monticello to implement atomic addition.  A loader can compile all classes and methods first and then install all methods only after they have been all compiled, and in a way that executes little code.ß
"
Class {
	#name : #MethodAddition,
	#superclass : #Object,
	#instVars : [
		'text',
		'category',
		'changeStamp',
		'requestor',
		'logSource',
		'myClass',
		'selector',
		'compiledMethod',
		'priorMethodOrNil',
		'priorCategoryOrNil'
	],
	#category : #Monticello-Loading,
	#timestamp : 'rej 2/25/2007 19:30'
}

{
	#category : #compilation,
	#timestamp : ' 8/31/2017 07:17:01'
}
MethodAddition>>compile [
    "This method is the how compiling a method used to work.  All these steps were done at once.
     This method should not normally be used, because the whole point of MethodAddition is to let
	you first create a compiled method and then install the method later."
	self createCompiledMethod.
	self installMethod.
	self notifyObservers.
	^selector
]

{
	#category : #compilation,
	#timestamp : ' 8/31/2017 07:17:01'
}
MethodAddition>>compile: aString classified: aString1 withStamp: aString2 notifying: aRequestor logSource: aBoolean inClass: aClass [

	text := aString.
	category := aString1.
	changeStamp := aString2.
	requestor := aRequestor.
	logSource := aBoolean.
	myClass := aClass
]

{
	#category : #operations,
	#timestamp : ' 8/31/2017 07:17:01'
}
MethodAddition>>createCompiledMethod [
	compiledMethod := myClass compiler 
		source: text asString;
		requestor: requestor;
		failBlock: [ ^nil ];
		compile.
	selector := compiledMethod selector.
	self writeSourceToLog.
	priorMethodOrNil := myClass compiledMethodAt: selector ifAbsent: [ nil ].
	priorCategoryOrNil := myClass organization categoryOfElement: selector
]

{
	#category : #operations,
	#timestamp : ' 8/31/2017 07:17:01'
}
MethodAddition>>installMethod [
	myClass addSelectorSilently: selector withMethod: compiledMethod.

]

{
	#category : #notifying,
	#timestamp : ' 8/31/2017 07:17:01'
}
MethodAddition>>notifyObservers [
	SystemAnnouncer uniqueInstance 
		suspendAllWhile: [myClass organization classify: selector under: category].
	priorMethodOrNil 
		ifNil: [ SystemAnnouncer uniqueInstance methodAdded: compiledMethod ]
		ifNotNil: [
			SystemAnnouncer uniqueInstance methodChangedFrom: priorMethodOrNil to: compiledMethod oldProtocol: priorCategoryOrNil.
			priorCategoryOrNil = category ifFalse: [
       			SystemAnnouncer uniqueInstance methodRecategorized: compiledMethod oldProtocol: priorCategoryOrNil ] ].
	"The following code doesn't seem to do anything."
	myClass instanceSide noteCompilationOfMethod: compiledMethod meta: myClass isClassSide.

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MethodAddition>>priorCategoryOrNil [
	^ priorCategoryOrNil
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MethodAddition>>priorCategoryOrNil: anObject [
	priorCategoryOrNil := anObject
]

{
	#category : #operations,
	#timestamp : ' 8/31/2017 07:17:01'
}
MethodAddition>>writeSourceToLog [
	logSource ifTrue: [
		myClass logMethodSource: text forMethod: compiledMethod
			inCategory: category withStamp: changeStamp
	].

]
