"
I am a specialized MCHttpRepository for http://squeaksource.com.
I optimize checks for existing files by doing a head request instead of reloading the whole file list first.
"
Class {
	#name : #MCSqueaksourceRepository,
	#superclass : #MCHttpRepository,
	#category : #MonticelloRemoteRepositories,
	#timestamp : '<historical>'
}

{
	#category : #'creation template',
	#timestamp : ' 8/31/2017 07:16:56'
}
MCSqueaksourceRepository class>>baseURL [
	^ 'http://squeaksource.com/'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:56'
}
MCSqueaksourceRepository class>>description [
	^ 'squeaksource.com'
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:56'
}
MCSqueaksourceRepository class>>isResponsibleFor: aUrl [
	^ aUrl includesSubstring: 'squeaksource.com/'
]

{
	#category : #interface,
	#timestamp : ' 8/31/2017 07:16:56'
}
MCSqueaksourceRepository>>includesFileNamed: aString [
	
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
MCSqueaksourceRepository>>includesVersionNamed: aString [
	"directly do a filename check since squeaksource only stores mcz"
	^ self includesFileNamed: aString, '.mcz'
]
