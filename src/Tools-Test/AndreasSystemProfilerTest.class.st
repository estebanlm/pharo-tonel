"
SUnit tests for AndreasSystemProfiler
"
Class {
	#name : #AndreasSystemProfilerTest,
	#superclass : #TestCase,
	#instVars : [
		'tally'
	],
	#category : #Tools-Test-Profilers,
	#timestamp : 'TorstenBergmann 2/4/2014 20:45'
}

{
	#category : #'tests tally',
	#timestamp : ' 8/31/2017 05:26:47'
}
AndreasSystemProfilerTest>>setUp [
	tally := QSystemTally new.
	tally class: self class method: self class >> #testPrintingTally	
	"tally class: Object method: Object >> #printString."
]

{
	#category : #'tests tally',
	#timestamp : ' 8/31/2017 05:26:47'
}
AndreasSystemProfilerTest>>testFullPrintOn [
	| stream |
	stream := WriteStream on: String new.
	tally 
		fullPrintOn: stream tallyExact: false orThreshold: 0 time: 10.
	
	self assert: stream contents =  '**Tree**

**Leaves**
'
]

{
	#category : #'tests tally',
	#timestamp : ' 8/31/2017 05:26:47'
}
AndreasSystemProfilerTest>>testGetNewTab [
	| tabs |
	
	self assert: (tally getNewTabsFor: #()) = #().
	self assert: (tally getNewTabsFor: #(' ')) =  #(' ').
	
	tabs := OrderedCollection new.
	tabs add: '['.
	(tally maxTabs + 1) timesRepeat: [ tabs add: ' ' ].
	self assert: (tally getNewTabsFor: tabs) asArray =  #('[' '[').
]

{
	#category : #'tests tally',
	#timestamp : ' 8/31/2017 05:26:47'
}
AndreasSystemProfilerTest>>testPrintingTally [

	self assert: tally printString =  'AndreasSystemProfilerTest>>#testPrintingTally -- 0'
]

{
	#category : #'tests tally',
	#timestamp : ' 8/31/2017 05:26:47'
}
AndreasSystemProfilerTest>>testPrintingTallyUninitialized [
	
	self assert: QSystemTally new printString = 'nil>>nil -- nil'
]

{
	#category : #'tests profiler',
	#timestamp : ' 8/31/2017 05:26:47'
}
AndreasSystemProfilerTest>>testSimple [
	AndreasSystemProfiler new spyOn: [ 200 timesRepeat: [ 1.23 printString ] ]
]

{
	#category : #'tests profiler',
	#timestamp : ' 8/31/2017 05:26:47'
}
AndreasSystemProfilerTest>>testSimpleReport [
	AndreasSystemProfiler new report
]

{
	#category : #'tests tally',
	#timestamp : ' 8/31/2017 05:26:47'
}
AndreasSystemProfilerTest>>testTallyTreePrint [
	| stream |
	stream := WriteStream on: String new.
	tally 
		treePrintOn: stream 
		tabs: #() 
		thisTab: nil 
		total: 50 
		totalTime: 100 
		tallyExact: true 
		orThreshold: 1.
	
	"Nothing is printed since there is no tab"
	self assert: stream contents isEmpty
]

{
	#category : #'tests tally',
	#timestamp : ' 8/31/2017 05:26:47'
}
AndreasSystemProfilerTest>>testTallyTreePrintWithTab [
	| stream |
	stream := WriteStream on: String new.
	tally 
		treePrintOn: stream 
		tabs: #(' ')
		thisTab: nil 
		total: 50 
		totalTime: 100 
		tallyExact: true 
		orThreshold: 1.
	
	
	self assert: stream contents = ' 0 AndreasSystemProfilerTest  testPrintingTally
'
]
