"
STONTestDomainObject is used to support unit tests.

Instance Variables
	boolean:		<Boolean>
	bytes:			<ByteArray>
	color:			<Symbol>
	created:		<DateAndTime>
	description:	<String>
	float:			<Float>
	integer:		<Integer>
	modified:	<DateAndTime>
	tags:			<Array of: Symbol>
"
Class {
	#name : #STONTestDomainObject,
	#superclass : #Object,
	#instVars : [
		'created',
		'modified',
		'integer',
		'float',
		'description',
		'color',
		'tags',
		'bytes',
		'boolean'
	],
	#category : #STON-Tests,
	#timestamp : 'SvenVanCaekenberghe 2/10/2012 20:25'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:46'
}
STONTestDomainObject class>>dummy [
	^ self new
		integer: 999999 atRandom;
		float: 999 atRandom / Float pi;
		boolean: #(true false) atRandom;
		bytes: (ByteArray streamContents: [ :out | 32 timesRepeat: [ out nextPut: 255 atRandom ] ]);
		description: (String streamContents: [ :out | 16 atRandom timesRepeat: [ out nextPutAll: 'Blah' ] ]);
		color: #(#red #green #blue) atRandom;
		tags: (Array 
			with: #(#one #two #three) atRandom
 			with: #(#alpha #beta #gamma) atRandom 
			with: #(#low #medium #high) atRandom);
		yourself

]

{
	#category : #ston-core,
	#timestamp : ' 8/31/2017 05:26:46'
}
STONTestDomainObject class>>stonName [
	^ #TestDomainObject
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 05:26:46'
}
STONTestDomainObject>>= anObject [
	"Answer whether the receiver and anObject represent the same object."

	self == anObject
		ifTrue: [ ^ true ].
	self class = anObject class
		ifFalse: [ ^ false ].
	^ color = anObject color
		and: [ 
			modified = anObject modified
				and: [ 
					created = anObject created
						and: [ 
							description = anObject description
								and: [ 
									boolean = anObject boolean
										and: [ 
											(float closeTo: anObject float) 		"Use #closeTo: instead of #= to increase portability"
												and: [ 
													bytes = anObject bytes 
														and: [ 
															integer = anObject integer 
																and: [ tags = anObject tags ] ] ] ] ] ] ] ]

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:46'
}
STONTestDomainObject>>boolean [
	^ boolean
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:46'
}
STONTestDomainObject>>boolean: anObject [
	boolean := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:46'
}
STONTestDomainObject>>bytes [
	^ bytes
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:46'
}
STONTestDomainObject>>bytes: anObject [
	bytes := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:46'
}
STONTestDomainObject>>color [
	^ color
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:46'
}
STONTestDomainObject>>color: anObject [
	color := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:46'
}
STONTestDomainObject>>created [
	^ created
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:46'
}
STONTestDomainObject>>created: anObject [
	created := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:46'
}
STONTestDomainObject>>description [
	^ description
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:46'
}
STONTestDomainObject>>description: anObject [
	description := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:46'
}
STONTestDomainObject>>float [
	^ float
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:46'
}
STONTestDomainObject>>float: anObject [
	float := anObject
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 05:26:46'
}
STONTestDomainObject>>hash [
	"Answer an integer value that is related to the identity of the receiver."

	^ color hash
		bitXor:
			(modified hash
				bitXor:
					(created hash
						bitXor:
							(description hash
								bitXor: (boolean hash bitXor: (float hash bitXor: (bytes hash bitXor: (integer hash bitXor: tags hash)))))))
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:46'
}
STONTestDomainObject>>initialize [
	created := modified := DateAndTime now.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:46'
}
STONTestDomainObject>>integer [
	^ integer
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:46'
}
STONTestDomainObject>>integer: anObject [
	integer := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:46'
}
STONTestDomainObject>>modified [
	^ modified
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:46'
}
STONTestDomainObject>>modified: anObject [
	modified := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:46'
}
STONTestDomainObject>>tags [
	^ tags
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:46'
}
STONTestDomainObject>>tags: anObject [
	tags := anObject
]
