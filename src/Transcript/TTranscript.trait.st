"
I define the API of Transcript, which is quite similar to stream.

A Transcript acts like a character write stream, accumulating output send to it. Some operations buffer output without necessarily showing it (like #nextPut: nextPutAll: #print: #cr #space and #tab), while others add their output and show any buffered output (like #show: #crShow: and <<). Use #flush or #endEntry to force buffered output to be shown.

Clients are required to implement #critical: #flush: #nextPut: and #nextPutAll: 

Note that #critical: should serialize multithreaded access

Client can optionally implement #close or #clear themselves

Historical note: #ensureCr and #reset were removed since they were not used
"
Trait {
	#name : #TTranscript,
	#traits : '{}',
	#classTraits : '{}',
	#category : #Transcript,
	#timestamp : 'SvenVanCaekenberghe 5/12/2015 14:14'
}

{
	#category : #streaming,
	#timestamp : ' 8/31/2017 07:16:25'
}
TTranscript>><< anObject [
	"Output anObject asString on the receiver and show the output"
	
	self show: anObject
]

{
	#category : #streaming,
	#timestamp : ' 8/31/2017 07:16:25'
}
TTranscript>>clear [
	"Clear the receiver, removing all existing output"
]

{
	#category : #streaming,
	#timestamp : ' 8/31/2017 07:16:25'
}
TTranscript>>close [
	"Close the receiver, indicating it is not longer needed"
]

{
	#category : #streaming,
	#timestamp : ' 8/31/2017 07:16:25'
}
TTranscript>>cr [
	"Output a cr on the receiver, buffered and not yet shown"
	
	self nextPut: Character cr
]

{
	#category : #streaming,
	#timestamp : ' 8/31/2017 07:16:25'
}
TTranscript>>crShow: anObject [
	"Output anObject asString on the receiver preceded by a cr and show the output"
	
	self critical: [ self cr; show: anObject ]
]

{
	#category : #streaming,
	#timestamp : ' 8/31/2017 07:16:25'
}
TTranscript>>critical: block [
	"Execute block making sure only one thread accesses the receiver"
	
	self explicitRequirement
]

{
	#category : #streaming,
	#timestamp : ' 8/31/2017 07:16:25'
}
TTranscript>>endEntry [
	"Show the currently buffered output"

	self flush
]

{
	#category : #streaming,
	#timestamp : ' 8/31/2017 07:16:25'
}
TTranscript>>flush [
	"Show the currently buffered output"

	self explicitRequirement
]

{
	#category : #streaming,
	#timestamp : ' 8/31/2017 07:16:25'
}
TTranscript>>nextPut: character [
	"Output character on the receiver, buffered, not yet shown"

	self explicitRequirement
]

{
	#category : #streaming,
	#timestamp : ' 8/31/2017 07:16:25'
}
TTranscript>>nextPutAll: string [
	"Output string on the receiver, buffered, not yet shown"

	self explicitRequirement
]

{
	#category : #streaming,
	#timestamp : ' 8/31/2017 07:16:25'
}
TTranscript>>print: anObject [
	"Output anObject asString on the receiver, buffered, not yet shown"
	
	self nextPutAll: anObject asString
]

{
	#category : #streaming,
	#timestamp : ' 8/31/2017 07:16:25'
}
TTranscript>>show: anObject [
	"Output anObject asString on the receiver and show the output"
	
	self critical: [ self print: anObject; endEntry ]
]

{
	#category : #streaming,
	#timestamp : ' 8/31/2017 07:16:25'
}
TTranscript>>space [
	"Output a space on the receiver, buffered and not yet shown"

	self nextPut: Character space
]

{
	#category : #streaming,
	#timestamp : ' 8/31/2017 07:16:25'
}
TTranscript>>tab [
	"Output a tab on the receiver, buffered and not yet shown"

	self nextPut: Character tab
]
