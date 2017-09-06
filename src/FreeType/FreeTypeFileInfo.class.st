"
File infos for a FreeType font
"
Class {
	#name : #FreeTypeFileInfo,
	#superclass : #FreeTypeFileInfoAbstract,
	#instVars : [
		'absoluteOrRelativePath',
		'absolutePath',
		'locationType',
		'modificationTime',
		'fileSize'
	],
	#category : #FreeType-FontManager,
	#timestamp : 'TorstenBergmann 2/4/2014 22:10'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:12'
}
FreeTypeFileInfo>>absoluteOrRelativePath [
	"Answer the value of absoluteOrRelativePath"

	^ absoluteOrRelativePath
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:12'
}
FreeTypeFileInfo>>absoluteOrRelativePath: anObject [
	"Set the value of absoluteOrRelativePath"

	absoluteOrRelativePath := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:12'
}
FreeTypeFileInfo>>absolutePath [
	"Answer the value of absolutePath"

	^ absolutePath
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:12'
}
FreeTypeFileInfo>>absolutePath: anObject [
	"Set the value of absolutePath"

	absolutePath := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:12'
}
FreeTypeFileInfo>>baseName [
	^ absolutePath asFileReference basename
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:12'
}
FreeTypeFileInfo>>fileSize [
	"Answer the value of fileSize"

	^ fileSize
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:12'
}
FreeTypeFileInfo>>fileSize: anObject [
	"Set the value of fileSize"

	fileSize := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:12'
}
FreeTypeFileInfo>>locationType [
	"Answer the value of locationType"

	^ locationType
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:12'
}
FreeTypeFileInfo>>locationType: anObject [
	"Set the value of locationType"

	locationType := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:12'
}
FreeTypeFileInfo>>modificationTime [
	"Answer the value of modificationTime"

	^ modificationTime
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:12'
}
FreeTypeFileInfo>>modificationTime: anObject [
	"Set the value of modificationTime"

	modificationTime := anObject
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:12'
}
FreeTypeFileInfo>>printOn: aStream [
	"super printOn: aStream."
	aStream 
		nextPutAll: familyGroupName asString, '::',styleNameExtracted asString, ' '; 
		nextPutAll:  
			(locationType = #absolute 
				ifTrue:[''] 
				ifFalse:['{',locationType asString,'}']);
		nextPutAll: absoluteOrRelativePath asString;
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
