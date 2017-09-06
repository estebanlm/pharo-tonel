"
I serialize or materialize objects using FUEL framework. Create instance of me calling GlobalIdentifierPersistence fuel.
"
Class {
	#name : #GlobalIdentifierFuelPersistence,
	#superclass : #GlobalIdentifierPersistence,
	#category : #System-Identification,
	#timestamp : 'JurajKubelka 10/30/2015 16:55'
}

{
	#category : #configuration,
	#timestamp : ' 8/31/2017 05:26:36'
}
GlobalIdentifierFuelPersistence>>fileName  [
	^ 'org.pharo.gt.spotter.event.recorder.fuel'
]

{
	#category : #'load and saving',
	#timestamp : ' 8/31/2017 05:26:36'
}
GlobalIdentifierFuelPersistence>>load [
	^ FLMaterializer materializeFromFileNamed: self preferences fullName
]

{
	#category : #'load and saving',
	#timestamp : ' 8/31/2017 05:26:36'
}
GlobalIdentifierFuelPersistence>>save: aDictionary into: aWriteStream [
	aWriteStream binary.
	[ FLSerializer serialize: aDictionary on: aWriteStream ]
		on: Error
		do: [ :anError | "ignore" ]
]
