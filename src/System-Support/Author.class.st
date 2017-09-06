"
I am responsible for the full name used to identify the current code author.
"
Class {
	#name : #Author,
	#superclass : #Object,
	#instVars : [
		'fullName'
	],
	#classInstVars : [
		'uniqueInstance'
	],
	#category : #System-Support,
	#timestamp : 'MiguelCoba 7/25/2009 01:09'
}

{
	#category : #settings,
	#timestamp : ' 8/31/2017 07:16:13'
}
Author class>>authorSettingOn: aBuilder [
	<systemsettings>
	(aBuilder setting: #authorFullName)
		order: -100000;
		parent: #pharoSystem;
		label: 'Author identification';
		target: Author uniqueInstance;
		getSelector: #fullNamePerSe;
		setSelector: #fullName:;
		notInStyle;
		default: '';
		ghostHelp: 'VincentVanGogh';
		description: AuthorNameRequest messagePrompt

]

{
	#category : #utilities,
	#timestamp : ' 8/31/2017 07:16:13'
}
Author class>>changeStamp  [
	"Answer a string to be pasted into source code to mark who changed it and when."
	^ Author fullName , ' ' , Date today mmddyyyy, ' ',
		((String streamContents: [:s | Time now print24: true on: s]) copyFrom: 1 to: 5)
]

{
	#category : #utilities,
	#timestamp : ' 8/31/2017 07:16:13'
}
Author class>>changeStampPerSe [
	"Answer a string to be pasted into source code to mark who changed it and when."

	^ (Author fullNamePerSe ifNil: ['.']) , ' ' , Date today mmddyyyy, ' ',
		((String streamContents: [:s | Time now print24: true on: s]) 
			copyFrom: 1 to: 5)
]

{
	#category : #utilities,
	#timestamp : ' 8/31/2017 07:16:13'
}
Author class>>fixStamp: changeStamp  [
	| parts |
	parts := changeStamp findTokens: ' '.
	(parts notEmpty and: [parts last first isLetter]) ifTrue:
		["Put initials first in all time stamps..."
		^ String streamContents:
				[:s | s nextPutAll: parts last.
				parts allButLast do: [:p | s space; nextPutAll: p]]].
	^ changeStamp
]

{
	#category : #convenience,
	#timestamp : ' 8/31/2017 07:16:13'
}
Author class>>fullName [
	^ Author uniqueInstance fullName
]

{
	#category : #convenience,
	#timestamp : ' 8/31/2017 07:16:13'
}
Author class>>fullName: aString  [
	^ Author uniqueInstance checkAndSetFullNameWith: aString
]

{
	#category : #convenience,
	#timestamp : ' 8/31/2017 07:16:13'
}
Author class>>fullNamePerSe [
	^ Author uniqueInstance fullNamePerSe 
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:13'
}
Author class>>new [
	self error: 'Author is a singleton -- send uniqueInstance instead'
]

{
	#category : #convenience,
	#timestamp : ' 8/31/2017 07:16:13'
}
Author class>>requestFullName [
	^ Author uniqueInstance requestFullName
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:13'
}
Author class>>reset [
	^ self uniqueInstance reset.
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:13'
}
Author class>>uniqueInstance [
	^ uniqueInstance ifNil: [ uniqueInstance := super new ]
]

{
	#category : #testing-support,
	#timestamp : ' 8/31/2017 07:16:13'
}
Author class>>useAuthor: aString during: aBlock [
	^ self uniqueInstance useAuthor: aString during: aBlock
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:13'
}
Author>>checkAndSetFullNameWith: aString  [
	
	fullName := 
	aString select: [ :character |
		character charCode < 128 and: [ character isAlphaNumeric ]
	].
	
	(fullName = aString and: [ fullName isNotEmpty ]) ifFalse: [ self requestFullName ]
	
	
	
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:13'
}
Author>>fullName [
	"Answer the full name to be used to identify the current code author."

	[fullName isEmptyOrNil] whileTrue: [
		self requestFullName.
		(fullName isEmptyOrNil or:[ fullName = 'FirstnameLastname' ]) ifTrue: [fullName := nil. ^'Anonymous']
	].
	^ fullName
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:13'
}
Author>>fullName: aString [
	fullName := aString.	

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:13'
}
Author>>fullNamePerSe [
	"Answer the currently-prevailing author full name, such as it is, empty or not"
	^ fullName
]

{
	#category : #compatibility,
	#timestamp : ' 8/31/2017 07:16:13'
}
Author>>ifUnknownAuthorUse: aString during: aBlock [
	"If no author is set use the name aString while executing aBlock."
	"for compatibility with 1.0"
	
	fullName isEmptyOrNil ifFalse: [ ^ aBlock value ].
	fullName := aString.
	^ aBlock ensure: [ self reset ]
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:16:13'
}
Author>>initialize [
	super initialize.
	fullName := ''.
]

{
	#category : #ui-requests,
	#timestamp : ' 8/31/2017 07:16:13'
}
Author>>requestFullName [
	| initialAnswer |
	
	initialAnswer := fullName isEmptyOrNil
				ifTrue: ['FirstnameLastname']
				ifFalse: [fullName].
				
	(AuthorNameRequest new initialAnswer: initialAnswer) signal ifNotNil: [ :newName | 
		self checkAndSetFullNameWith: newName 
	] "nil means that the dialog was cancelled "
]

{
	#category : #compatibility,
	#timestamp : ' 8/31/2017 07:16:13'
}
Author>>reset [
	fullName := ''
]

{
	#category : #testing-support,
	#timestamp : ' 8/31/2017 07:16:13'
}
Author>>useAuthor: aString during: aBlock [
	| previous |
	previous := fullName.
	fullName := aString.
	^ aBlock ensure: [ fullName := previous ]
]
