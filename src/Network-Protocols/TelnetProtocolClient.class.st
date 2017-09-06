"
Abstract super class for protocol clients based on the generic telnet protocol ""<response code> <response>""

Structure:
	responseCode	the numerical (integer) value of the last response code

"
Class {
	#name : #TelnetProtocolClient,
	#superclass : #ProtocolClient,
	#instVars : [
		'responseCode'
	],
	#category : #Network-Protocols,
	#timestamp : 'mir 5/12/2003 18:06'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:57'
}
TelnetProtocolClient class>>rawResponseCodes [
	self subclassResponsibility
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:57'
}
TelnetProtocolClient>>determineResponseCode [
	self lastResponse size >= 3
		ifFalse: [^0].
	^[SmallInteger readFromString: (self lastResponse copyFrom: 1 to: 3)]
		on: Error
		do: [:ex | ex return: 0]
]

{
	#category : #'private protocol',
	#timestamp : ' 8/31/2017 07:16:57'
}
TelnetProtocolClient>>fetchNextResponse [
	"The FTP and similar protocols allow multi-line responses.
	If the response is multi-line, the fourth character of the first line is a  
	$- and the last line repeats the numeric code but the code is followed by 
	a space."

	| response result firstLine |
	result := '' writeStream.
	firstLine := self stream nextLine.
	result nextPutAll: firstLine.
	(self responseIsContinuation: firstLine) 
		ifTrue: 
			["continued over multiple lines. Discard continuation lines."

			
			[response := self stream nextLine.
			response ifNil: [^nil].
			response size > 3 and: 
					[(response copyFrom: 1 to: 3) = (firstLine copyFrom: 1 to: 3) 
						and: [(response at: 4) = Character space]]] 
					whileFalse: 
						[result
							cr;
							nextPutAll: response]].
	self lastResponse: result contents
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:57'
}
TelnetProtocolClient>>lastResponse: aString [
	super lastResponse: aString.
	responseCode := self determineResponseCode
]

{
	#category : #'private protocol',
	#timestamp : ' 8/31/2017 07:16:57'
}
TelnetProtocolClient>>lookForCode: code [
	"We are expecting a certain code next."

	self
		lookForCode: code
		ifDifferent: [:response | (TelnetProtocolError protocolInstance: self) signal: response]

]

{
	#category : #'private protocol',
	#timestamp : ' 8/31/2017 07:16:57'
}
TelnetProtocolClient>>lookForCode: code ifDifferent: handleBlock [
	"We are expecting a certain code next."

	self fetchNextResponse.

	self responseCode == code
		ifFalse: [handleBlock value: self lastResponse]

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:57'
}
TelnetProtocolClient>>responseCode [
	^responseCode
]

{
	#category : #'private testing',
	#timestamp : ' 8/31/2017 07:16:57'
}
TelnetProtocolClient>>responseIsContinuation [
	^(self lastResponse size > 3
		and: [(self lastResponse at: 4) == $-])
]

{
	#category : #'private testing',
	#timestamp : ' 8/31/2017 07:16:57'
}
TelnetProtocolClient>>responseIsContinuation: response [
	^(response size > 3
		and: [(response at: 4) == $-])
]

{
	#category : #'private testing',
	#timestamp : ' 8/31/2017 07:16:57'
}
TelnetProtocolClient>>responseIsError [
	^self responseCode between: 500 and: 599
]

{
	#category : #'private testing',
	#timestamp : ' 8/31/2017 07:16:57'
}
TelnetProtocolClient>>responseIsWarning [
	^self responseCode between: 400 and: 499
]
