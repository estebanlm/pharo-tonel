"
Registry for metacello servers
"
Class {
	#name : #MCServerRegistry,
	#superclass : #Object,
	#instVars : [
		'registry'
	],
	#classInstVars : [
		'uniqueInstance'
	],
	#category : #MonticelloRemoteRepositories,
	#timestamp : 'TorstenBergmann 2/5/2014 13:56'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:56'
}
MCServerRegistry class>>uniqueInstance [

	^ uniqueInstance ifNil: [ uniqueInstance := self new ].
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:16:56'
}
MCServerRegistry>>initialize [

	super initialize.
	registry := Dictionary new.
]

{
	#category : #public,
	#timestamp : ' 8/31/2017 07:16:56'
}
MCServerRegistry>>on: repositoryUrl beUser: nameString withPassword: passwordString [

	| credentials |
	credentials := MCServerCredentials user: nameString password: passwordString.
	registry at: repositoryUrl put: credentials.
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:56'
}
MCServerRegistry>>repositoryAt: urlString credentialsDo: aBlock [


	| possibleMatches bestMatch |
	possibleMatches := registry associations select: [ :e | urlString beginsWith: e key ].
	possibleMatches isEmpty ifTrue: [ ^ aBlock value: '' value: '' ].
	bestMatch := possibleMatches inject: possibleMatches anyOne into: [ :last :new | 
		((new key asUrl path size > last key asUrl path size) 
		"this is ugly, but URL always returns a path element, even an empty one..."
		or: [ last key asUrl path size = 1 and: [ last key asUrl path last isEmpty ]]) 
			ifTrue: [ new ]
			ifFalse: [ last ]].
	^ aBlock value: bestMatch value username value: bestMatch value password.
]
