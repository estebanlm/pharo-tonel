"
Reader for an MCZ format
"
Class {
	#name : #MCMczReader,
	#superclass : #MCVersionReader,
	#instVars : [
		'zip',
		'infoCache'
	],
	#category : #Monticello-Storing,
	#timestamp : 'TorstenBergmann 2/6/2014 08:08'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCMczReader class>>extension [
	^ 'mcz'
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCMczReader class>>supportsDependencies [
	^ true
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCMczReader class>>supportsVersions [
	^ true
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCMczReader>>associate: tokens [
	| result |
	result := Dictionary new.
	tokens pairsDo: [:key :value | 
					| tmp |
					tmp := value.
					value isString ifFalse: [tmp := value collect: [:ea | self associate: ea]].
					value = 'nil' ifTrue: [tmp := ''].
					result at: key put: tmp].
	^ result
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCMczReader>>contentStreamForMember: member [
	^[(member contentStreamFromEncoding: 'utf8') text] on: ZnInvalidUTF8
		do: [:exc | 
			"Case of legacy encoding, presumably it is latin-1 and we do not need to do anything
			But if contents starts with a null character, it might be a case of WideString encoded in UTF-32BE"
			| str |
			str := (member contentStreamFromEncoding: 'latin1') text.
			(str peek = Character null and: [ str size \\ 4 = 0 ])
				ifTrue: [str := (WideString fromByteArray: str contents asByteArray) readStream].
			exc return: str]
]

{
	#category : #parsing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCMczReader>>contentsForMember: member [
	^[(member contentStreamFromEncoding: 'utf8') text contents] on: ZnInvalidUTF8, UTF8InvalidText
		do: [:exc | 
			"Case of legacy encoding, presumably it is latin-1.
			But if contents starts with a null character, it might be a case of WideString encoded in UTF-32BE"
			| str |
			str := (member contentStreamFromEncoding: 'latin1') text.
			exc return: ((str peek = Character null and: [ str size \\ 4 = 0 ])
				ifTrue: [WideString fromByteArray: str contents asByteArray]
				ifFalse: [str contents])]
]

{
	#category : #parsing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCMczReader>>extractDefinitionsFrom: member [
	| reader |
	(MCSnapshotReader readerClassForFileNamed: member fileName)
		ifNotNil: [:rc |
			reader := rc on: (self contentsForMember: member) readStream.
			definitions addAll: reader definitions]

]

{
	#category : #parsing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCMczReader>>extractDependencyFrom: zipMember [
	^ MCVersionDependency
		package: (MCPackage named: (zipMember fileName copyAfterLast: $/))
		info: (self extractInfoFrom: (self parseMember: zipMember))
]

{
	#category : #utilities,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCMczReader>>extractInfoFrom: dict [
	^MCWorkingCopy infoFromDictionary: dict cache: self infoCache
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCMczReader>>infoCache [
	^ infoCache ifNil: [infoCache := Dictionary new]
]

{
	#category : #loading,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCMczReader>>loadDefinitions [
	definitions := OrderedCollection new.
	(self zip memberNamed: 'snapshot.bin') ifNotNil:
		[:m | [^ definitions := (MCDataStream on: m contentStream) next definitions]
			on: Error do: [:fallThrough |]].
	"otherwise"
	(self zip membersMatching: 'snapshot/*')
		do: [:m | self extractDefinitionsFrom: m].

]

{
	#category : #loading,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCMczReader>>loadDependencies [
	dependencies := (self zip membersMatching: 'dependencies/*') collect: [:m | self extractDependencyFrom: m].
	dependencies := dependencies asArray.

]

{
	#category : #loading,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCMczReader>>loadPackage [
	| dict |
	dict := self parseMember: 'package'.
	package := MCPackage named: (dict at: #name)
]

{
	#category : #loading,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCMczReader>>loadVersionInfo [

	info := self extractInfoFrom: (self parseMember: 'version')
]

{
	#category : #parsing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCMczReader>>parseMember: memberOrName [
	| member tokens |
	member := self zip member: memberOrName.
	tokens := (self contentsForMember: member) parseLiterals first.
	^ self associate: tokens
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCMczReader>>scanner [
	^ MCScanner
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCMczReader>>zip [
	stream closed ifTrue: [ zip := nil].
	zip ifNil:
		[zip := ZipArchive new.
		zip readFrom: self stream].
	^ zip
]
