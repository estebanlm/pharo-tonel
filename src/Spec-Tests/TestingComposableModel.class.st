"
A TestingComposableModel is a stupid composable model used to test SpecInterpreter.
"
Class {
	#name : #TestingComposableModel,
	#superclass : #ComposableModel,
	#instVars : [
		'list'
	],
	#category : #Spec-Tests-Utils,
	#timestamp : 'Spirita 7/28/2016 11:15'
}

{
	#category : #specs,
	#timestamp : ' 8/31/2017 05:26:46'
}
TestingComposableModel class>>defaultSpec [
	<spec>

	^ SpecLayout composed
		add: #list;
		yourself
]

{
	#category : #specs,
	#timestamp : ' 8/31/2017 05:26:46'
}
TestingComposableModel class>>testingSpec [
	^ {#RubPluggableTextMorph. #model:. #model. }
]

{
	#category : #specs,
	#timestamp : ' 8/31/2017 05:26:46'
}
TestingComposableModel class>>title [

	^ 'You should not see me !'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:46'
}
TestingComposableModel>>getText [
	^ Text new
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:46'
}
TestingComposableModel>>initializeWidgets [
	list := self newList
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:46'
}
TestingComposableModel>>list [

	^ list
]
