"
ZnPortNotANumber is signalled when an URL is parsed containing an illegal port specification.

Part of Zinc HTTP Components.
"
Class {
	#name : #ZnPortNotANumber,
	#superclass : #Error,
	#instVars : [
		'port'
	],
	#category : #Zinc-Resource-Meta-Core,
	#timestamp : 'SvenVanCaekenberghe 2/28/2011 15:23'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:17:01'
}
ZnPortNotANumber class>>port: port [
	^ self new
		port: port;
		yourself
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
ZnPortNotANumber>>port [
	^ port
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
ZnPortNotANumber>>port: anObject [
	port := anObject
]
