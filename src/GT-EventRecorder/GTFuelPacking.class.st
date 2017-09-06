"
I serialize or materialize objects using FUEL framework. Create instance of me calling GTEventPacking fuel.
"
Class {
	#name : #GTFuelPacking,
	#superclass : #GTEventPacking,
	#instVars : [
		'migrations'
	],
	#category : #GT-EventRecorder-Support,
	#timestamp : 'JurajKubelka 10/13/2015 23:01'
}

{
	#category : #adding,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTFuelPacking>>addMigration: oneArgBlock  [
	^ self migrations addLast: oneArgBlock
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTFuelPacking>>initializeMaterializer: aFLMaterializer  [
	self migrations do: [ :eachMigration | eachMigration value: aFLMaterializer ]
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTFuelPacking>>initializeMigrations [
	| pragmas |
	pragmas := Pragma allNamed: #fuelMaterializerMigration in: self class.
	migrations := pragmas
		collect: [ :eachPragma | self perform: eachPragma methodSelector ]
		as: OrderedCollection
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTFuelPacking>>materialize: aByteArray [
	| materializer stream gzstream materialization |
	stream := aByteArray asByteArray readStream. 
	gzstream := GZipReadStream on: stream.
	materializer := FLMaterializer newDefault.
	self initializeMaterializer: materializer.
	materialization := materializer materializeFrom: gzstream.
	gzstream close.
	stream close.
	^ materialization root.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTFuelPacking>>migrations [
	migrations ifNil: [ self initializeMigrations ].
	^ migrations
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTFuelPacking>>migrations: aCollectionOrNil [
	migrations := aCollectionOrNil
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTFuelPacking>>serialize: anObject [
	| serializer stream gzstream |
	stream := ByteArray new writeStream binary. 
	gzstream := GZipWriteStream on: stream.
	serializer := FLSerializer newDefault.
	serializer at: #recorderVersion putAdditionalObject: self version.
	serializer stream: gzstream.
	serializer serialize: anObject.
	gzstream close.
	stream close.
	^ stream contents.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTFuelPacking>>technologyName [
	^ 'fuel'
]
