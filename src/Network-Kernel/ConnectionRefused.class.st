"
Signals that a connection to the specified host and port was refused.

	host		host which refused the connection
	port		prot to which the connection was refused

"
Class {
	#name : #ConnectionRefused,
	#superclass : #NetworkError,
	#instVars : [
		'host',
		'port'
	],
	#category : #Network-Kernel,
	#timestamp : 'mir 5/12/2003 18:14'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:32'
}
ConnectionRefused class>>host: addressOrHostName port: portNumber [
	^ self new host: addressOrHostName port: portNumber
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:32'
}
ConnectionRefused>>host [
	^ host
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:32'
}
ConnectionRefused>>host: addressOrHostName port: portNumber [
	host := addressOrHostName.
	port := portNumber
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:32'
}
ConnectionRefused>>port [
	^ port
]
