"
I serialize or materialize objects using STON framework. Create instance of me calling GlobalIdentifierPersistence ston.
"
Class {
	#name : #GlobalIdentifierStonPersistence,
	#superclass : #GlobalIdentifierPersistence,
	#category : #System-Identification,
	#timestamp : 'JurajKubelka 10/30/2015 16:55'
}

{
	#category : #configuration,
	#timestamp : ' 8/31/2017 05:26:36'
}
GlobalIdentifierStonPersistence>>fileName [
	^ 'org.pharo.global-identifiers.ston'
]

{
	#category : #'load and saving',
	#timestamp : ' 8/31/2017 05:26:36'
}
GlobalIdentifierStonPersistence>>load [
	^ self preferences readStreamDo: [ :aReadStream |
			STON fromStream: aReadStream ]
]

{
	#category : #'load and saving',
	#timestamp : ' 8/31/2017 05:26:36'
}
GlobalIdentifierStonPersistence>>save: aDictionary into: aWriteStream [
	STON put: aDictionary onStreamPretty: aWriteStream
]
