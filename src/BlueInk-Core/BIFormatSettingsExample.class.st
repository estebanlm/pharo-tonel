"
Some examples of the action of a pretty printing option 
"
Class {
	#name : #BIFormatSettingsExample,
	#superclass : #Object,
	#category : #BlueInk-Core,
	#timestamp : 'FranckWarlouzet 7/27/2015 13:39'
}

{
	#category : #prettyPrintOptionRelated,
	#timestamp : ' 8/31/2017 05:26:21'
}
BIFormatSettingsExample>>cascadedMessageInsideParenthesesExample [
	"option on :
	(self bar)
			foo;
			foo;
			foo
			
	option off :
	self bar
			foo;
			foo;
			foo"
]

{
	#category : #prettyPrintOptionRelated,
	#timestamp : ' 8/31/2017 05:26:21'
}
BIFormatSettingsExample>>keepBlockInMessageExample [
	"option on:
	
	self foo
	or: [ 
	self bar
	ifTrue: [ true ] ]
	
	option off:
	
	self foo
	or:
	[ 
	self bar
	ifTrue: [ true ] ]"

	
]

{
	#category : #prettyPrintOptionRelated,
	#timestamp : ' 8/31/2017 05:26:21'
}
BIFormatSettingsExample>>lineUpBlockBracketsExample [
	"option on:
	self foo
	or: [ 
	self bar
	ifTrue: [ true ] ]
	
	option off: 
	self foo
		or: [ 
			self bar
				ifTrue: [ true ]
			]"
]

{
	#category : #prettyPrintOptionRelated,
	#timestamp : ' 8/31/2017 05:26:21'
}
BIFormatSettingsExample>>newLineAfterCascadeExample [
	"option on:
		self
			foo;
			foo;
			foo
			
	option off: 
	self
		foo; foo; foo"
]

{
	#category : #prettyPrintOptionRelated,
	#timestamp : ' 8/31/2017 05:26:21'
}
BIFormatSettingsExample>>newLineBeforeFirstCascadeExample [
	"option on:
		self
			foo;
			foo;
			foo	
				
	option off: 
		self foo;
			foo;
			foo"
]

{
	#category : #prettyPrintOptionRelated,
	#timestamp : ' 8/31/2017 05:26:21'
}
BIFormatSettingsExample>>newLineBeforeFirstKeywordExample [
	"option on: 
		self
		foo
		
	option off:
		self foo"
]
