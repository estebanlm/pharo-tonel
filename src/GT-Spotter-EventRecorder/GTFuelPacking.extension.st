Extension {
	#name : #GTFuelPacking
}

{
	#category : #'*GT-Spotter-EventRecorder',
	#timestamp : ' 8/31/2017 05:26:42'
}
GTFuelPacking>>migrationForGTSpotterRecorderDataAnnouncement [
	<fuelMaterializerMigration>
	^ [ :aMaterializer | aMaterializer 
				migrateClassNamed: #GTSpotterRecorderDataAnnouncement toClass: GTEventAnnouncement ]
]
