"
Used to measure test coverage for Hudson reports
"
Class {
	#name : #HDTestCoverage,
	#superclass : #ProtoObject,
	#instVars : [
		'hasRun',
		'reference',
		'method'
	],
	#category : #JenkinsTools-ExtraReports,
	#timestamp : 'TorstenBergmann 2/12/2014 22:32'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:09'
}
HDTestCoverage class>>on: aMethodReference [
	^ self new initializeOn: aMethodReference
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:09'
}
HDTestCoverage>>doesNotUnderstand: aMessage [
	^ method perform: aMessage selector withArguments: aMessage arguments
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:09'
}
HDTestCoverage>>hasRun [
	^ hasRun
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:09'
}
HDTestCoverage>>initializeOn: aMethodReference [
	hasRun := false.
	reference := aMethodReference.
	method := reference compiledMethod
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:09'
}
HDTestCoverage>>install [
	reference actualClass methodDict
		at: reference selector
		put: self.
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:09'
}
HDTestCoverage>>mark [
	hasRun := true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:09'
}
HDTestCoverage>>method [
	^ method
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:09'
}
HDTestCoverage>>reference [
	^ reference
]

{
	#category : #evaluation,
	#timestamp : ' 8/31/2017 05:26:09'
}
HDTestCoverage>>run: aSelector with: anArray in: aReceiver [
	self mark; uninstall.
	^ aReceiver withArgs: anArray executeMethod: method
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:09'
}
HDTestCoverage>>uninstall [
	reference actualClass methodDict
		at: reference selector
		put: method.
]
