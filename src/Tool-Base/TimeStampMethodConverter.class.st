"
A TimeStampMessageConverter is a wrapper wich display the timestamp of the provided message
"
Class {
	#name : #TimeStampMethodConverter,
	#superclass : #AbstractMethodConverter,
	#category : #Tool-Base,
	#timestamp : '<historical>'
}

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:18'
}
TimeStampMethodConverter>>formattedModificationTextFor:aUser atStamp:aTimeStampString [
|stamp|
stamp:= DateAndTime fromString:aTimeStampString.
^ String streamContents:[ :s |
			s << 'Last Modification :' << Character cr.
			s << Character tab << 'date:' << Character tab << stamp asDate asString << Character space << stamp asTime asString << Character cr.
 			s << Character tab << 'by:' << Character tab << Character tab << aUser ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:18'
}
TimeStampMethodConverter>>internalGetText [
	| list |
	list := method stamp substrings.
	list ifEmpty: [ ^ 'No information available' ].
	^ self formattedModificationTextFor:(list first) atStamp:(list allButFirst joinUsing:' ')

]
