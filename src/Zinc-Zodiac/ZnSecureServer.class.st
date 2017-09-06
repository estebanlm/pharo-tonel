"
I am ZnSecureServer, an implementation of an HTTPS server.
I am a ZnMultiThreadedServer

(ZnSecureServer on: 1443)
	certificate: '/home/sven/ssl/key-cert.pem';
	logToTranscript;
	start;
	yourself.
	
Disclaimer: this is an experimental proof of concept.
"
Class {
	#name : #ZnSecureServer,
	#superclass : #ZnMultiThreadedServer,
	#instVars : [
		'certificate'
	],
	#category : #Zinc-Zodiac,
	#timestamp : 'SvenVanCaekenberghe 12/13/2011 13:26'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:32'
}
ZnSecureServer>>certificate [
	^ certificate
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:32'
}
ZnSecureServer>>certificate: anObject [
	certificate := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:32'
}
ZnSecureServer>>scheme [
	^ #https
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:32'
}
ZnSecureServer>>socketStreamOn: socket [
	| stream |
	stream := ZdcSecureSocketStream on: socket.
	stream sslSession certificateName: self certificate.
	stream accept.
	^ stream
]
