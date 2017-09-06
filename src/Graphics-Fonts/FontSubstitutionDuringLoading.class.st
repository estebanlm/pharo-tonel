"
signaled by font loading code when reading a DiskProxy that calls for a missing font.
"
Class {
	#name : #FontSubstitutionDuringLoading,
	#superclass : #Notification,
	#instVars : [
		'familyName',
		'pixelSize'
	],
	#category : #Graphics-Fonts,
	#timestamp : '<historical>'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:13'
}
FontSubstitutionDuringLoading class>>forFamilyName: aName pixelSize: aSize [
	^(self new)
		familyName: aName;
		pixelSize: aSize;
		yourself.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
FontSubstitutionDuringLoading>>defaultAction [
	familyName ifNil: [ familyName := 'NoName' ].
	pixelSize ifNil: [ pixelSize := 12 ].

	^((familyName beginsWith: 'Comic')
		ifTrue: [ TextStyle named: (StandardFonts buttonFont familyName) ]
		ifFalse: [ TextStyle default ]) fontOfSize: pixelSize.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
FontSubstitutionDuringLoading>>familyName [
	"Answer the value of familyName"

	^ familyName
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
FontSubstitutionDuringLoading>>familyName: anObject [
	"Set the value of familyName"

	familyName := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
FontSubstitutionDuringLoading>>pixelSize [
	"Answer the value of pixelSize"

	^ pixelSize
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
FontSubstitutionDuringLoading>>pixelSize: anObject [
	"Set the value of pixelSize"

	pixelSize := anObject
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:13'
}
FontSubstitutionDuringLoading>>printOn: aStream [
	super printOn: aStream.
	aStream nextPut: $(;
		nextPutAll: familyName;
		nextPut: $-;
		print: pixelSize;
		nextPut: $).
]
