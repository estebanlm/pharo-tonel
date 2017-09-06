"
SUnit tests for ClassAPIHelpBuilder
"
Class {
	#name : #ClassAPIHelpBuilderTest,
	#superclass : #TestCase,
	#category : #HelpSystem-Tests-Builders,
	#timestamp : 'TorstenBergmann 2/4/2014 21:18'
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:43'
}
ClassAPIHelpBuilderTest>>testBuildingTraits [
	|topic|
	topic := ClassAPIHelpBuilder 
				buildHelpTopicFrom: TSortable .				 
	self assert: topic subtopics size = 2.
	self assert: topic subtopics first title = 'Instance side'.
	self assert: topic subtopics last title = 'Class side'
 

 
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:43'
}
ClassAPIHelpBuilderTest>>testDefaultBuilding [
	|topic|
	topic := ClassAPIHelpBuilder 
				buildHelpTopicFrom: Integer.				 
	self assert: topic subtopics size = 2.
	self assert: topic subtopics first title = 'Instance side'.
	self assert: topic subtopics last title = 'Class side'
 

 
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:43'
}
ClassAPIHelpBuilderTest>>testMethodsButNoSubclasses [
	|topic|
	topic := ClassAPIHelpBuilder 
				buildHierarchicalHelpTopicFrom: Integer 
				withSubclasses: false 
				withMethods: true.
	self assert: topic subtopics size = 2.
	self assert: topic subtopics first title = 'Instance side'.
	self assert: topic subtopics last title = 'Class side'
 

 
]
