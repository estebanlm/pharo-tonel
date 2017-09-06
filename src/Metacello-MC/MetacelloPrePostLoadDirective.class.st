"

"
Class {
	#name : #MetacelloPrePostLoadDirective,
	#superclass : #MetacelloDirective,
	#category : #Metacello-MC-Directives,
	#timestamp : ''
}

{
	#category : #actions,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloPrePostLoadDirective>>evaluateSupplyingAnswers: loadBlock [

	| answers |
	(answers := self spec answers) notEmpty
		ifTrue: [ loadBlock valueSupplyingMetacelloAnswers: answers ]
		ifFalse: [ loadBlock value]
]

{
	#category : #enumerating,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloPrePostLoadDirective>>prepostLoadDirectivesDo: aBlock [

	aBlock value: self
]

{
	#category : #enumerating,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloPrePostLoadDirective>>prepostLoadDo: aBlock [

	aBlock value: self
]
