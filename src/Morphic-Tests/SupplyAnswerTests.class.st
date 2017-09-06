"
A test for supplying answer 
"
Class {
	#name : #SupplyAnswerTests,
	#superclass : #TestCase,
	#category : #Morphic-Tests-Widgets,
	#timestamp : 'TorstenBergmann 9/5/2014 17:00'
}

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:43'
}
SupplyAnswerTests>>testChooseDirectory [

	| tmpDirectory answer |
	tmpDirectory :=FileSystem / 'tmp'.
	
	answer := ([ MorphicUIManager new chooseDirectory ] valueSupplyingAnswer: { 'Choose Directory'. tmpDirectory }).
	
	self assert: answer = tmpDirectory.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:43'
}
SupplyAnswerTests>>testFillInTheBlank [

	| answer |
	answer := [ MorphicUIManager new request: 'Your favorite color?' ] valueSupplyingAnswer: #('Your favorite color?' 'blue').
	
	self assert: answer = 'blue'.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:43'
}
SupplyAnswerTests>>testInform [

	| answer |
	[ MorphicUIManager new inform: 'blah' ] on: Exception do: [:ex | answer := ex messageText ].
	self assert: answer  = 'blah'.
]
