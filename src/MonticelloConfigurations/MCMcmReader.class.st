"
Reader for Metacello MCM
"
Class {
	#name : #MCMcmReader,
	#superclass : #MCVersionReader,
	#instVars : [
		'fileName',
		'configuration'
	],
	#category : #MonticelloConfigurations,
	#timestamp : 'TorstenBergmann 2/20/2014 16:24'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:16'
}
MCMcmReader class>>extension [
	^ 'mcm'
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:16'
}
MCMcmReader class>>on: aStream fileName: aFileName [
	| reader |
	reader := self on: aStream.
	reader fileName: aFileName.
	^reader
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:16'
}
MCMcmReader>>configuration [
	configuration ifNil: [self loadConfiguration].
	"browser modifies configuration, but the reader might get cached"
	^configuration copy
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:16'
}
MCMcmReader>>configurationName [
	^fileName ifNotNil: [(fileName findTokens: '/\:') last copyUpToLast: $.]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:16'
}
MCMcmReader>>fileName: aString [
	fileName := aString
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:16'
}
MCMcmReader>>loadConfiguration [
	stream reset.
	configuration := MCConfiguration fromArray: (MCScanner scan: stream).
	configuration name: self configurationName.

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:16'
}
MCMcmReader>>loadVersionInfo [
	info := self configuration
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:16'
}
MCMcmReader>>version [
	^self configuration
]
