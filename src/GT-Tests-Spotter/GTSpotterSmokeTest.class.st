"

"
Class {
	#name : #GTSpotterSmokeTest,
	#superclass : #TestCase,
	#instVars : [
		'window'
	],
	#category : #GT-Tests-Spotter,
	#timestamp : ''
}

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:42'
}
GTSpotterSmokeTest>>setUp [
	super setUp.
	
	
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:42'
}
GTSpotterSmokeTest>>tearDown [
	super tearDown.
	
	window ifNotNil: [ window delete ]
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
GTSpotterSmokeTest>>testOpen [

	window := (GTSpotterMorph new spotterModel: GTSpotter new; showPreview; yourself) extent: 500@500; openInWorld.
]
