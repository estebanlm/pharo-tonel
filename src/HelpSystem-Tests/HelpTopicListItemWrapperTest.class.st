"
SUnit tests for class HelpTopicListItemWrapper
"
Class {
	#name : #HelpTopicListItemWrapperTest,
	#superclass : #TestCase,
	#category : #HelpSystem-Tests-Core-UI,
	#timestamp : 'TorstenBergmann 2/4/2014 21:19'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:43'
}
HelpTopicListItemWrapperTest>>defaultTestClass  [
	^HelpTopicListItemWrapper 
	
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:43'
}
HelpTopicListItemWrapperTest>>testDisplayLabel [
	|instance|
	instance := self defaultTestClass with: (HelpTopic named: 'My Topic').
	self assert: instance asString = 'My Topic'
	
]
