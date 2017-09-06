"
A pseudo file stream which can be used for updates.
"
Class {
	#name : #MCPseudoFileStream,
	#superclass : #RWBinaryOrTextStream,
	#instVars : [
		'localName'
	],
	#category : #MonticelloConfigurations,
	#timestamp : '<historical>'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:16'
}
MCPseudoFileStream>>localName [
	^localName
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:16'
}
MCPseudoFileStream>>localName: aString [
	localName := aString
]
