"
ZnUnknownScheme is signalled when an unknown/unsupported URL scheme is found.

Part of Zinc HTTP Components. 
"
Class {
	#name : #ZnUnknownScheme,
	#superclass : #Error,
	#instVars : [
		'scheme'
	],
	#category : #Zinc-Resource-Meta-Core,
	#timestamp : 'DamienPollet 8/4/2011 14:07'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:17:01'
}
ZnUnknownScheme class>>scheme: scheme [
	^ self new
		scheme: scheme;
		yourself
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
ZnUnknownScheme>>scheme [
	^ scheme
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
ZnUnknownScheme>>scheme: anObject [
	scheme := anObject
]
