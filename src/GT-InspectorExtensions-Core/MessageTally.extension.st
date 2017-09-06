Extension {
	#name : #MessageTally
}

{
	#category : #'*GT-InspectorExtensions-Core',
	#timestamp : ' 8/31/2017 05:26:35'
}
MessageTally>>children [
	^ self sonsOver: 0
]

{
	#category : #'*GT-InspectorExtensions-Core',
	#timestamp : ' 8/31/2017 05:26:35'
}
MessageTally>>gtDisplayIdentifierOn: aStream [
	class gtDisplayOn: aStream.
	self method methodClass ~~ class 
		ifTrue: [ aStream nextPut: $(; print: self method methodClass; nextPut: $) ].
	aStream 
		nextPutAll: '>>';
		store: self method selector
]

{
	#category : #'*GT-InspectorExtensions-Core',
	#timestamp : ' 8/31/2017 05:26:35'
}
MessageTally>>gtDisplayOn: aStream [
	self gtDisplayIdentifierOn: aStream.
	aStream 
		nextPutAll: ' (';
		nextPutAll: self tally printString;
		nextPutAll: ')'
]

{
	#category : #'*GT-InspectorExtensions-Core',
	#timestamp : ' 8/31/2017 05:26:35'
}
MessageTally>>gtInspectorReportIn: composite [
	<gtInspectorPresentationOrder: 60>
	^ composite text
		title: 'Report';
		display: [ String streamContents: [:s | self report: s ] ]
]

{
	#category : #'*GT-InspectorExtensions-Core',
	#timestamp : ' 8/31/2017 05:26:35'
}
MessageTally>>gtInspectorSourceIn: composite [
	<gtInspectorPresentationOrder: 50>
	^ self method ifNotNil: [
		self method gtInspectorSourceIn: composite]
]

{
	#category : #'*GT-InspectorExtensions-Core',
	#timestamp : ' 8/31/2017 05:26:35'
}
MessageTally>>localTally [
	^ self children 
		inject: self tally
		into: [ :diff :each | diff - each tally ]
]

{
	#category : #'*GT-InspectorExtensions-Core',
	#timestamp : ' 8/31/2017 05:26:35'
}
MessageTally>>localTime [
	^ self children
		inject: self time 
		into: [ :diff :each | diff - each time ]
]

{
	#category : #'*GT-InspectorExtensions-Core',
	#timestamp : ' 8/31/2017 05:26:35'
}
MessageTally class>>on: aBlock [
	"This utility method constructs a tally object and returns it without
	triggering the construction of the default report"
	^ MessageTally new
		spyEvery: 1
		on: aBlock;
		yourself 
]
