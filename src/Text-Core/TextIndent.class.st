"
create a hanging indent. 
"
Class {
	#name : #TextIndent,
	#superclass : #TextAttribute,
	#instVars : [
		'amount'
	],
	#category : #Text-Core,
	#timestamp : '<historical>'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:16'
}
TextIndent class>>amount: amount [
	"create a TextIndent which will indent by the given amount.  Currently this is a number of tabs, but may change in the futur"
	^super new amount: amount
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:16'
}
TextIndent class>>tabs: numTabs [
	"create an indentation by the given number of tabs"
	^self amount: numTabs
]

{
	#category : #access,
	#timestamp : ' 8/31/2017 07:16:16'
}
TextIndent>>amount [
	"number of tab spaces to indent by"
	^amount
]

{
	#category : #access,
	#timestamp : ' 8/31/2017 07:16:16'
}
TextIndent>>amount: anInteger [
	"change the number of tabs to indent by"
	amount := anInteger
]

{
	#category : #condensing,
	#timestamp : ' 8/31/2017 07:16:16'
}
TextIndent>>dominates: anAttribute [
	^(self class == anAttribute class)
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:16'
}
TextIndent>>printOn: aStream [
	super printOn: aStream.
	aStream nextPutAll: ' amount: '.
	amount printOn: aStream
]
