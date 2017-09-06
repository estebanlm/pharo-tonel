"
I am a morphic item used to show ocompletion entries. 
"
Class {
	#name : #NOCMenuMorph,
	#superclass : #NECMenuMorph,
	#category : #NECompletion-View,
	#timestamp : '<historical>'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
NOCMenuMorph>>height [
	^ 7
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:21'
}
NOCMenuMorph>>narrowCompletion [
	| model |
	
	self selected: 0.
	firstVisible := 1.
	model := context model.
	model narrowWith: context completionToken.
	model notEmpty ifTrue: [self selected: 1].
	model entries size < self selected ifTrue: [self selected: model entries size].
	self show.
	^ true
]
