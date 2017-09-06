"
A DummyPackageSelectedPlugin is a dummy plugin which displays the selected package
"
Class {
	#name : #DummyPackageSelectedPlugin,
	#superclass : #AbstractPackageSelectedPlugin,
	#instVars : [
		'morph'
	],
	#category : #NautilusCommon-Plugin-Examples,
	#timestamp : 'StephaneDucasse 10/30/2014 08:21'
}

{
	#category : #position,
	#timestamp : ' 8/31/2017 05:26:22'
}
DummyPackageSelectedPlugin class>>defaultPosition [

	^ #middle
]

{
	#category : #display,
	#timestamp : ' 8/31/2017 05:26:22'
}
DummyPackageSelectedPlugin>>display [

	morph :=  LabelMorph new 
					contents: '';
					enabled: false;
					vResizing: #shrinkWrap;
					hResizing: #spaceFill;
					yourself.
	^ morph
]

{
	#category : #announcement,
	#timestamp : ' 8/31/2017 05:26:22'
}
DummyPackageSelectedPlugin>>packageSelected: anAnnouncement [
	
	| package name |
	package := anAnnouncement package.
	name := package name asString.
	package ifNil: [ name := ''].
	morph ifNotNil: [ morph contents: name]
]
