"
I keep all GTEventBundle objects that should be delivered to the same remote server. That way, all data can be sent to the server at one HTTP request.

By calling #entity, you receive ZnMultiPartFormDataEntity object that contains ZnMimePart objects in a sequence 'category', 'data', 'category', 'data', etc. Server is then responsible for spliting this object into the parts and store each data in to a right position (directory).

For the Collaborators Part: 
- GTEventBundle: I keep collection of those objects and asks them for a ZnEntity object calling #entity.
- GTEventMultiBundleFactory knows how to create instances.
- GTEventDelivery knows how to send my #entity to a server.

Internal Representation and Key Implementation Points.

    Instance Variables
	bundles:		<Collection>
	url:			<ZnUrl>

"
Class {
	#name : #GTEventMultiBundle,
	#superclass : #Object,
	#instVars : [
		'url',
		'bundles'
	],
	#category : #GT-EventRecorder-Support,
	#timestamp : 'JurajKubelka 11/15/2015 18:03'
}

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTEventMultiBundle>>accept: aVisitor  [
	^ aVisitor visitMultiBundle: self
]

{
	#category : #adding,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTEventMultiBundle>>add: aGTEventBundle  [
	^ self bundles addLast: aGTEventBundle
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTEventMultiBundle>>bundles [
	^ bundles ifNil: [ bundles := OrderedCollection new ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTEventMultiBundle>>entity [
	| entity |
	entity := ZnMultiPartFormDataEntity new.
	self updateEntity: entity.
	^ entity
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTEventMultiBundle>>updateEntity: aZnMultiPartFormDataEntity  [
	bundles ifNil: [ ^ self ].
	self bundles do: [ :eachEventBundle |
		aZnMultiPartFormDataEntity 
			addPart: (ZnMimePart fieldName: 'category' value: eachEventBundle category);
			addPart: (ZnMimePart fieldName: 'data' entity: eachEventBundle entity) ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTEventMultiBundle>>url [
	^ url
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTEventMultiBundle>>url: anObject [
	url := anObject
]
