"

"
Class {
	#name : #GTSpotterUIThreadStream,
	#superclass : #Object,
	#instVars : [
		'onAddedSelector',
		'onRemoveSelector',
		'receiver',
		'timestamp'
	],
	#category : #GT-Spotter-Utils,
	#timestamp : ''
}

{
	#category : #adding/removing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterUIThreadStream>>addObject: firstObject inProcessor: secondObject [

	self performSymbol: self onAddedSelector withArguments: { firstObject. secondObject }.
	Processor yield
]

{
	#category : #adding/removing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterUIThreadStream>>addObjects: aCollection inProcessor: aProcessor [

	self performSymbol: #addAllCandidates:in: withArguments: { aCollection . aProcessor }.
	Processor yield
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterUIThreadStream>>onAddedSelector [
	^ onAddedSelector
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterUIThreadStream>>onAddedSelector: anObject [
	onAddedSelector := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterUIThreadStream>>onRemoveSelector [
	^ onRemoveSelector
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterUIThreadStream>>onRemoveSelector: anObject [
	onRemoveSelector := anObject
]

{
	#category : #performing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterUIThreadStream>>performSymbol: aSymbol withArguments: aCollection [
	|time|
	"we save current timestamp here, so that defer block can check if it belongs to the correct task"
	time := self timestamp.
	"UI manages commands for us"
	Processor yield.
	"if timestamp is wrong just skip command"
	UIManager default defer: [ time = self timestamp ifTrue: [ self receiver perform: aSymbol withEnoughArguments: aCollection ] ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterUIThreadStream>>receiver [
	^ receiver
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterUIThreadStream>>receiver: anObject [
	receiver := anObject
]

{
	#category : #adding/removing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterUIThreadStream>>removeAllCandidates [

	self performSymbol: #removeAllCandidates withArguments: { }.
	Processor yield
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterUIThreadStream>>timestamp [
	^ timestamp
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterUIThreadStream>>timestamp: anObject [
	timestamp := anObject
]

{
	#category : #updating,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterUIThreadStream>>updateTimestamp [

	self timestamp: Time microsecondClockValue
]
