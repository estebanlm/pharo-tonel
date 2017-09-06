"
I'm a Demo that show the usage of Metalink. When I'm installed in Nautilus I glow red whenever the selected method is being executed anywhere in the system 
"
Class {
	#name : #ExecutionDisplayPlugin,
	#superclass : #AbstractNautilusPlugin,
	#instVars : [
		'morph',
		'link'
	],
	#category : #Reflectivity-Examples,
	#timestamp : 'mcamp 10/2/2015 11:26'
}

{
	#category : #position,
	#timestamp : ' 8/31/2017 05:26:45'
}
ExecutionDisplayPlugin class>>defaultPosition [
		
	^ #middle
]

{
	#category : #information,
	#timestamp : ' 8/31/2017 05:26:45'
}
ExecutionDisplayPlugin class>>description [
	^ 'A demo of Metalink usage: when it is installed, it glows red when the selected method is executed somewhere in the system'
]

{
	#category : #display,
	#timestamp : ' 8/31/2017 05:26:45'
}
ExecutionDisplayPlugin class>>pluginName [

	^'Execution Metalink Demo'
]

{
	#category : #information,
	#timestamp : ' 8/31/2017 05:26:45'
}
ExecutionDisplayPlugin class>>possiblePositions [
	"Return all the possible positions for a plugin. Subclasses are not intented to override this method."
	^ {	#middle.
		#none. }
]

{
	#category : #display,
	#timestamp : ' 8/31/2017 05:26:45'
}
ExecutionDisplayPlugin>>display [

	^morph.
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:45'
}
ExecutionDisplayPlugin>>initialize [

	super initialize.
	morph := ExecutionDisplayMorph new height: 20.
	link := MetaLink new metaObject: morph; selector: #noteExecuted.
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:45'
}
ExecutionDisplayPlugin>>isMethodAlreadyLinked: aMethod [
	^ aMethod notNil
		and: [ link methods anySatisfy: [ :m | m selector = aMethod selector and: [ m methodClass = aMethod methodClass ] ] ]
]

{
	#category : #'execution Visualizer',
	#timestamp : ' 8/31/2017 05:26:45'
}
ExecutionDisplayPlugin>>noteExectuted: anAnnouncement [
	(self isMethodAlreadyLinked: anAnnouncement method)
		ifTrue: [ ^ self ].
	link uninstall.
	anAnnouncement method ifNotNil: [ :method | method ast link: link ]
]

{
	#category : #registration,
	#timestamp : ' 8/31/2017 05:26:45'
}
ExecutionDisplayPlugin>>registerTo: aModel [

	aModel announcer
   	 when: NautilusMethodSelected 
	 send: #noteExectuted:
	 to: self
]
