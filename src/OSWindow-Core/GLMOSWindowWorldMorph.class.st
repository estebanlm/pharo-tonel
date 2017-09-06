"
I am an OSWindow world morph that is used by Glamour to display its content in a external OSWindow.

Usage examples:

GTInspector new openInExternalWindowOn: 3.

3 inspectInExternalWindow.
"
Class {
	#name : #GLMOSWindowWorldMorph,
	#superclass : #OSWindowWorldMorphWithModel,
	#instVars : [
		'toolbarBox'
	],
	#category : #OSWindow-Core-Morphic,
	#timestamp : 'RonieSalgado 9/9/2016 18:08'
}

{
	#category : #callbacks,
	#timestamp : ' 8/31/2017 05:26:40'
}
GLMOSWindowWorldMorph>>actOnWindowRequest: ann [

	ann action value: self	
]

{
	#category : #submorphs-add/remove,
	#timestamp : ' 8/31/2017 05:26:40'
}
GLMOSWindowWorldMorph>>delete [
	self model notNil ifTrue: [self model unregisterFromAllAnnouncements].
	super delete
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:40'
}
GLMOSWindowWorldMorph>>initialize [
	super initialize.
	
	self layoutPolicy: ProportionalLayout new.
	self clipSubmorphs: true.

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
GLMOSWindowWorldMorph>>toolbarBox: anObject [
	toolbarBox := anObject
]

{
	#category : #announcing,
	#timestamp : ' 8/31/2017 05:26:40'
}
GLMOSWindowWorldMorph>>when: anAnnouncement do: aBlock  [
	^ self announcer when: anAnnouncement do: aBlock
]
