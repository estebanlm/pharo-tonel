"

"
Class {
	#name : #GTSpotterStepFilteringTest,
	#superclass : #GTSpotterStepTest,
	#category : #GT-Tests-Spotter-Scripting,
	#timestamp : ''
}

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:42'
}
GTSpotterStepFilteringTest>>"protocol: running"
setUp [
	super setUp.
	
	"Reser the state of spotter as the filter nees to be set before running a query."
	spotter := GTMockSpotter new.
	currentStep := currentProcessor := currentCandidate := nil
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
GTSpotterStepFilteringTest>>testProcessorsFiltering [

	spotter filterByMethods: {
		GTSpotter>>#spotterImplementorsFor:.
		GTSpotter>>#spotterForPragmasFor:}.

	self shouldnt: [ spotter setText: '' from: self ] raise: Error. 
	
	self assertSearch: ' '.
	self assertProcessorByTitle: 'Pragmas'.
	self assertProcessorByTitle: 'Implementors'.

	self assert: currentStep processors size equals: 2.
	
]
