"
I manage the links of the chain of responsibilites to retrieve the good preference file.
"
Class {
	#name : #StartupPreferencesHandler,
	#superclass : #Object,
	#instVars : [
		'firstLink',
		'actions'
	],
	#category : #StartupPreferences,
	#timestamp : '<historical>'
}

{
	#category : #actions,
	#timestamp : ' 8/31/2017 07:16:51'
}
StartupPreferencesHandler>>buildActionList [
	"All found files will be executed."
	
	| directories |
	directories := OrderedCollection new.
	directories add: [ self lookInGeneralPreferencesFolder ].
	directories add: [ self lookInPreferencesVersionFolder ].
	directories add: [ self lookInImageFolder ].
	^ directories
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:16:51'
}
StartupPreferencesHandler>>initialize [

	super initialize.
	actions := self buildActionList.
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:51'
}
StartupPreferencesHandler>>lookInFolder: folder [

	| result |

	self flag: 'I should be #lookInFolder:forFilesMatching:, so that #lookInImageFolder can delegate to me, like the other two lookup methods'.
	result := OrderedCollection new.
	folder isDirectory ifFalse: [ ^ nil ].
	
	"To filter resources files such as .DS_Store"
	folder fileNames do: [:name |
		name first = $.
			ifFalse: [ result add: (folder / name)]].

	^ result isEmpty
		ifTrue: [ nil ]
		ifFalse: [ result ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:51'
}
StartupPreferencesHandler>>lookInFolder: folder forFilesMatching: pattern [

	| result files |
	result := OrderedCollection new.
	folder isDirectory ifFalse: [ ^ nil ].
	
	files := folder filesMatching: pattern.
	files do: [ :e | result add: e ].

	^ result isEmpty
		ifTrue: [ nil ]
		ifFalse: [ result ]
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 07:16:51'
}
StartupPreferencesHandler>>lookInGeneralPreferencesFolder [

	^ StartupPreferencesLoader preferencesGeneralFolder 
		ifNotNil: [ :folder | self lookInFolder:  folder forFilesMatching: '*.st' ].
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 07:16:51'
}
StartupPreferencesHandler>>lookInImageFolder [

	^ self 
		lookInFolder: FileSystem workingDirectory 
		forFilesMatching: StartupPreferencesLoader startupScriptName.
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 07:16:51'
}
StartupPreferencesHandler>>lookInPreferencesVersionFolder [

	^ StartupPreferencesLoader preferencesVersionFolder 
		ifNotNil: [ :folder | 
			self 
				lookInFolder: folder
				forFilesMatching: '*.st' ].
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 07:16:51'
}
StartupPreferencesHandler>>perform [

	| results |
	results := OrderedCollection new.
	actions do: [:each |
		each value ifNotNil: [ :res |  results addAll: res ]
	].
	^ results

]
