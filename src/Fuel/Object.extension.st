Extension {
	#name : #Object
}

{
	#category : #'*Fuel',
	#timestamp : ' 8/31/2017 05:26:12'
}
Object>>fuelAccept: aGeneralMapper [

	"Be careful because the order is important. For example, weak are also variable, but we need that weak objects send #visitWeakObject: and not #visitVariableObject: "
	self class isFixed
		ifTrue: [ ^ aGeneralMapper visitFixedObject: self ].
	self class isWeak
		ifTrue: [ ^ aGeneralMapper visitWeakObject: self ].
	self class isPointers
		ifTrue: [ ^ aGeneralMapper visitVariableObject: self ].
	self class isBytes
		ifTrue: [ ^ aGeneralMapper visitBytesObject: self ].
	self class isWords
		ifTrue: [	^ aGeneralMapper visitWordsObject: self ].
	self error: 'Something is wrong!'
]

{
	#category : #'*Fuel',
	#timestamp : ' 8/31/2017 05:26:12'
}
Object>>fuelAfterMaterialization [
	"Materialization process will send this message after materializing instances of my class"
]

{
	#category : #'*Fuel',
	#timestamp : ' 8/31/2017 05:26:12'
}
Object>>fuelReplacement [
	^ self
]

{
	#category : #'*Fuel',
	#timestamp : ' 8/31/2017 05:26:12'
}
Object>>serializeToFileNamed: aFilename [
	^ FLSerializer serialize: self toFileNamed: aFilename
]
