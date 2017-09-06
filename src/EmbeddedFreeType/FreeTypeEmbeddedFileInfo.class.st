"
File info for embbeded FreeType fonts
"
Class {
	#name : #FreeTypeEmbeddedFileInfo,
	#superclass : #FreeTypeFileInfoAbstract,
	#instVars : [
		'fileContents',
		'baseName'
	],
	#category : #EmbeddedFreeType,
	#timestamp : 'TorstenBergmann 2/4/2014 22:10'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:11'
}
FreeTypeEmbeddedFileInfo>>baseName [
	"Answer the value of baseName"

	^ baseName
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:11'
}
FreeTypeEmbeddedFileInfo>>baseName: anObject [
	"Set the value of baseName"

	baseName := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:11'
}
FreeTypeEmbeddedFileInfo>>fileContents [
	"Answer the value of fileContents"

	^ fileContents
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:11'
}
FreeTypeEmbeddedFileInfo>>fileContents: anObject [
	"Set the value of fileContents"

	fileContents := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:11'
}
FreeTypeEmbeddedFileInfo>>fileSize [
	^fileContents size
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:11'
}
FreeTypeEmbeddedFileInfo>>isEmbedded [
	^true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:11'
}
FreeTypeEmbeddedFileInfo>>locationType [
	"Answer the value of locationType"

	^ #embedded
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:11'
}
FreeTypeEmbeddedFileInfo>>printOn: aStream [
	"super printOn: aStream."
	aStream 
		nextPutAll:  '{', self locationType asString,'}';
		nextPutAll: '(' , fileContents size asString, ' bytes )';
		nextPutAll: '[',index asString,'] ';
		nextPutAll: familyName asString;
		nextPutAll: ' - ', styleName asString;
		nextPutAll: ' - ', postscriptName asString;		
		nextPutAll: ' ',(bold ifTrue:['B'] ifFalse:['']);
		nextPutAll: ' ',(italic ifTrue:['I'] ifFalse:['']);
		nextPutAll: ' ',(fixedWidth ifTrue:['Monospaced'] ifFalse:['']);
		nextPutAll: ' ',(stretchValue asString);
		nextPutAll: ' ',(weightValue asString);	
		cr
]
