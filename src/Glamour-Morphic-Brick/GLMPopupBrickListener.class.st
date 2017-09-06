"
I am an internal popup brick event listener. I know a popup I belong to
"
Class {
	#name : #GLMPopupBrickListener,
	#superclass : #Object,
	#instVars : [
		'popup',
		'predicates'
	],
	#category : #Glamour-Morphic-Brick-Widgets-UI-Popup,
	#timestamp : 'AliakseiSyrel 2/28/2017 09:24'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMPopupBrickListener class>>predicate: aPopupPredicate [

	^ self new
		predicate: aPopupPredicate;
		yourself
]

{
	#category : #action,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMPopupBrickListener>>act [
	"Perform an action when predicate is activated"
	self subclassResponsibility
]

{
	#category : #events-processing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMPopupBrickListener>>handleListenEvent: anEvent [

	self predicates
		detect: [ :aPredicate | aPredicate popup: self popup event: anEvent ]
		ifFound: [ :aPredicate | self act ]
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMPopupBrickListener>>initialize [
	super initialize.
	
	predicates := OrderedCollection new
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMPopupBrickListener>>popup [
	^ popup
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMPopupBrickListener>>popup: anObject [
	popup := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMPopupBrickListener>>predicate: anObject [
	predicates add: anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMPopupBrickListener>>predicates [
	^ predicates
]
