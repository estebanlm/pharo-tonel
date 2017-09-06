"

"
Class {
	#name : #GTMockSpotter,
	#superclass : #GTSpotter,
	#category : #GT-Tests-Spotter-Scripting-Mocks,
	#timestamp : ''
}

{
	#category : #accessing-defaults,
	#timestamp : ' 8/31/2017 05:26:42'
}
GTMockSpotter>>defaultExceptionHandler [
	^ GTSpotterDebuggingExceptionHandler new
]

{
	#category : #accessing-defaults,
	#timestamp : ' 8/31/2017 05:26:42'
}
GTMockSpotter>>defaultPagerModel [
	^ GLMMockPagerModel new
]

{
	#category : #accessing-defaults,
	#timestamp : ' 8/31/2017 05:26:42'
}
GTMockSpotter>>defaultStep [
	^ GTMockSpotterStep new
]
