"

"
Class {
	#name : #GTMockSpotterStep,
	#superclass : #GTSpotterStep,
	#category : #GT-Tests-Spotter-Scripting-Mocks,
	#timestamp : ''
}

{
	#category : #accessing-defaults,
	#timestamp : ' 8/31/2017 05:26:42'
}
GTMockSpotterStep>>defaultStream [
	^ GTMockSpotterStream new
]

{
	#category : #accessing-defaults,
	#timestamp : ' 8/31/2017 05:26:42'
}
GTMockSpotterStep>>defaultTask [
	^ GTMockSpotterTask new
]
