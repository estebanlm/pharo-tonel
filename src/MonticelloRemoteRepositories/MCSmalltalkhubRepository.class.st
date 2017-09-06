"
I am specialized version of an MCHttpRepository for http://smalltalkhub.com.
I support a faster mcz listing that does not rely on parsing an html size.
"
Class {
	#name : #MCSmalltalkhubRepository,
	#superclass : #MCHttpRepository,
	#instVars : [
		'owner',
		'project'
	],
	#category : #MonticelloRemoteRepositories,
	#timestamp : '<historical>'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:56'
}
MCSmalltalkhubRepository class>>baseURL [
	^ self smalltalkhubUrl, 'mc/'
]

{
	#category : #'creation template',
	#timestamp : ' 8/31/2017 07:16:56'
}
MCSmalltalkhubRepository class>>creationTemplate [
	^self creationTemplateOwner: ''
		project: ''
		user: ''
		password: ''

]

{
	#category : #'creation template',
	#timestamp : ' 8/31/2017 07:16:56'
}
MCSmalltalkhubRepository class>>creationTemplateOwner: owner project: project user: user password: password [
	^ String streamContents: [ :s|
		s 
			nextPutAll: self name; cr;
			tab; nextPutAll: 'owner: '; print: owner; cr;
			tab; nextPutAll: 'project: '; print: project; cr;
			tab; nextPutAll: 'user: '; print: user; cr;
			tab; nextPutAll: 'password: '; print: password ].
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:56'
}
MCSmalltalkhubRepository class>>description [
	^ 'smalltalkhub.com'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:56'
}
MCSmalltalkhubRepository class>>hostName [
	^ 'smalltalkhub.com'
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:56'
}
MCSmalltalkhubRepository class>>isResponsibleFor: aUrl [
	^ aUrl includesSubstring: self hostName
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:56'
}
MCSmalltalkhubRepository class>>owner: owner project: project  [
	^ self
		owner: owner
		project: project
		user: String empty
		password: String empty
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:56'
}
MCSmalltalkhubRepository class>>owner: owner project: project user: user password: password [
	^ self new
		owner: owner;
		project: project;
		user: user;
		password: password;
		yourself
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:56'
}
MCSmalltalkhubRepository class>>smalltalkhubUrl [
	^ 'http://', self hostName, '/'
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 07:16:56'
}
MCSmalltalkhubRepository>>asCreationTemplate [
	^self class 
		creationTemplateOwner: self owner project: self project user: user password: password
]

{
	#category : #interface,
	#timestamp : ' 8/31/2017 07:16:56'
}
MCSmalltalkhubRepository>>includesFileNamed: aString [
	"avoid the slower default method and simply do a head request "
	self httpClient
		numberOfRetries: 0;
		ifFail: [ :exception | 
			((exception isKindOf: ZnHttpUnsuccessful) and: [ exception response isNotFound ])
				ifTrue: [ ^ false ].
			exception pass];
		head: (self urlForFileNamed: aString).
	^ true
]

{
	#category : #interface,
	#timestamp : ' 8/31/2017 07:16:56'
}
MCSmalltalkhubRepository>>includesVersionNamed: aString [
	"directly do a filename check since squeaksource only stores mcz"
	^ self includesFileNamed: aString, '.mcz'
]

{
	#category : #interface,
	#timestamp : ' 8/31/2017 07:16:56'
}
MCSmalltalkhubRepository>>loadAllFileNames [
	| client |
	client := self httpClient.
	client
		ifFail: [ :exception | self error: 'Could not access ', self location, ': ', exception printString ];
		url: self locationWithTrailingSlash;
		queryAt: 'format' put: 'raw';
		get.
	self assertNonBinaryResponse: client response.
	^ self parseFileNamesFromStream: client contents
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:56'
}
MCSmalltalkhubRepository>>location [
	^ 'http://smalltalkhub.com/mc/', self owner, '/', self project, '/main/' 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:56'
}
MCSmalltalkhubRepository>>location: aUrlString [
	| pathSegments |
	(self class isResponsibleFor: aUrlString)
		ifFalse: [ Error signal: 'Please provide a smalltalkhub url' ].
	"extract the smalltalkhub properties from the path part in the given URL"
	pathSegments := aUrlString asZnUrl pathSegments reject: [ :each | each = 'mc' ].
	self owner: pathSegments first.
	self project: pathSegments second.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:56'
}
MCSmalltalkhubRepository>>locationWithTrailingSlash [
	^ self location
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:56'
}
MCSmalltalkhubRepository>>owner [
	
	^ owner
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:56'
}
MCSmalltalkhubRepository>>owner: aString [
	
	owner := aString
]

{
	#category : #interface,
	#timestamp : ' 8/31/2017 07:16:56'
}
MCSmalltalkhubRepository>>parseFileNamesFromStream: aNewLineDelimitedString [
	^ aNewLineDelimitedString 
		ifNil: [ ^ OrderedCollection new ]
		ifNotNil: [ aNewLineDelimitedString substrings: String crlf ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:56'
}
MCSmalltalkhubRepository>>project [
	
	^ project
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:56'
}
MCSmalltalkhubRepository>>project: aString [
	
	project := aString
]
