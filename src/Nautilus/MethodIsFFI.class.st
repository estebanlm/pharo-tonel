"
Custom icon for methods which uses FFI
"
Class {
	#name : #MethodIsFFI,
	#superclass : #AbstractMethodIconAction,
	#category : #Nautilus-Widgets,
	#timestamp : 'HenrikNergaard 11/29/2016 19:35'
}

{
	#category : #order,
	#timestamp : ' 8/31/2017 05:26:22'
}
MethodIsFFI>>actionOrder [
	"Return the priority of this action"
	
	^0
]

{
	#category : #order,
	#timestamp : ' 8/31/2017 05:26:22'
}
MethodIsFFI>>actionStateToCache [
	"Return the state of the icon for caching purpose"
	
	^ icon
]

{
	#category : #order,
	#timestamp : ' 8/31/2017 05:26:22'
}
MethodIsFFI>>ffiSelectors [

	^ #( 
		ffiCall: ffiCall:module: ffiCall:options: ffiCall:module:options: 
		nbCall: nbCall:module: nbCall:options: nbCall:module:options: 
	)
]

{
	#category : #order,
	#timestamp : ' 8/31/2017 05:26:22'
}
MethodIsFFI>>isActionHandled [

	^ ((method literalAt: 1) class == ExternalLibraryFunction) or: [
		method sendsAnySelectorOf: self ffiSelectors
	] 
]

{
	#category : #order,
	#timestamp : ' 8/31/2017 05:26:22'
}
MethodIsFFI>>privateActionIcon [
	"Return the icon for this action"
	^ self iconNamed: #recoverLostChanges
]
