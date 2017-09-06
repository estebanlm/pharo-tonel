"
I serialize or materialize objects using STON framework. Create instance of me calling GTEventPacking ston.
"
Class {
	#name : #GTStonPacking,
	#superclass : #GTEventPacking,
	#category : #GT-EventRecorder-Support,
	#timestamp : 'JurajKubelka 10/13/2015 23:01'
}

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTStonPacking>>materialize: aByteArray [
	| stream gzstream |
	stream := aByteArray asString readStream.
	gzstream := GZipReadStream on: stream.
	^ [ STON fromStream: gzstream ] ensure: [ gzstream close. stream close ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTStonPacking>>serialize: anObject [
	^ (String streamContents: [ :stream | | gzstream |
		gzstream := GZipWriteStream on: stream.
		[ STON put: anObject onStreamPretty: gzstream ]
			ensure: [ gzstream close ] ]) asByteArray
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTStonPacking>>technologyName [
	^ 'ston'
]
