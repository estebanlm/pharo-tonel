"
A super test case that (re)stores  the setting value
"
Class {
	#name : #ReExceptionStrategyBaseTest,
	#superclass : #TestCase,
	#instVars : [
		'currentStrategy'
	],
	#category : #Renraku-Test,
	#timestamp : 'YuriyTymchuk 7/19/2017 13:51'
}

{
	#category : #helpers,
	#timestamp : ' 8/31/2017 05:26:45'
}
ReExceptionStrategyBaseTest>>errorMessage [

	^ 'test message'
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:45'
}
ReExceptionStrategyBaseTest>>setUp [
	super setUp.
	currentStrategy := ReExceptionStrategy current.
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:45'
}
ReExceptionStrategyBaseTest>>tearDown [
	
	ReExceptionStrategy current: currentStrategy.
	super tearDown.
]
