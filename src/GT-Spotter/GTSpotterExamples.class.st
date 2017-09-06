"
I provide examples for the class GTSpotter as class side methods.


"
Class {
	#name : #GTSpotterExamples,
	#superclass : #Object,
	#category : #GT-Spotter-Model,
	#timestamp : 'AndreiChis 9/24/2015 19:54'
}

{
	#category : #'examples - basic',
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterExamples class>>gtExampleBasic [
	<gtExample>
	<label: 'Basic Spotter object'>
	^ GTSpotter new
]

{
	#category : #'examples - filtering',
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterExamples class>>gtExampleCustomImplementorsSearchOn: aSpotter [
	<gtExample>
	<label: 'Custom implementors search'>
	<description: 'A spotter for searching through the implementors of a 
	method that overrides properties of the search step.'>
	<dependsOn: #gtExampleOnCompliedMethod>
	
	^ aSpotter
		processorsFilter: (GTSpotterMethodListProcessorFilter new 
			allowProcessorsFrom: CompiledMethod>>#spotterForImplementorsFor: 
			configuredWith: [ :aProcessor | aProcessor
				actLogic: [ :aMethod :step | 
					step exit.
					aMethod inform: aMethod name ];
				candidatesLimit: 50 ])
]

{
	#category : #'examples - filtering',
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterExamples class>>gtExampleCustomImplementorsSearchWithNavigationOn: aSpotter [
	<gtExample>
	<label: 'Custom implementors search with navigation'>
	<description: 'A spotter for searching through the implementors of a method that 
	overrides properties of the search step and enables the Collection 
	processor for items (to allow dive in).'>
	<dependsOn: #gtExampleOnCompliedMethod>
	
	^ aSpotter
		processorsFilter: (GTSpotterMethodListProcessorFilter new 
			allowProcessorsFrom: Collection>>#spotterItemsFor:;
			allowProcessorsFrom: CompiledMethod>>#spotterForImplementorsFor: 
			configuredWith: [ :aProcessor | aProcessor
				actLogic: [ :aMethod :step | 
					step exit.
					aMethod inform: aMethod name ];
				candidatesLimit: 50 ])
]

{
	#category : #'examples - filtering',
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterExamples class>>gtExampleHelpSearchOn: aSpotter [
	<gtExample>
	<label: 'Help search'>
	<description: 'A spotter for searching through help pages.'>
	<dependsOn: #gtExampleBasic>
	
	^ aSpotter
		filterByMethods: {
			GTSpotter>>#spotterForHelpTopicFor:.
			HelpTopic>>#spotterForHelpTopicFor:}
]

{
	#category : #'examples - filtering',
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterExamples class>>gtExampleImplementorsSearchOn: aSpotter [
	<gtExample>
	<label: 'Implementors search on single method'>
	<description: 'A spotter for searching through the implementors of a method.'>
	<dependsOn: #gtExampleOnCompliedMethod>
	
	^ aSpotter
		filterByMethods: {
			CompiledMethod>>#spotterForImplementorsFor:}
]

{
	#category : #'examples - basic',
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterExamples class>>gtExampleOnCompliedMethod [
	<gtExample>
	<label: 'Spotter on compiled method'>
	^ GTSpotter on: Object>>#copy
]

{
	#category : #'examples - basic',
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterExamples class>>gtExampleWithOneStepFrom: aSpotter [
	<gtExample>
	<label: 'Spotter object with one step'>
	<dependsOn: #gtExampleBasic>
	| step |
	step := GTSpotterStep new spotter: aSpotter.
	aSpotter steps add: step.
	aSpotter currentStep: step.
	^ aSpotter
]

{
	#category : #'examples - filtering',
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterExamples class>>gtExampleWorldMenuSearchOn: aSpotter [
	<gtExample>
	<label: 'World menu search'>
	<description: 'A spotter for searching through the world menu'>
	<dependsOn: #gtExampleBasic>

	^ aSpotter
		filterByMethods: {
			GTSpotter>>#spotterWorldMenuFor:}
	
	
]
