Extension {
	#name : #OSPlatform
}

{
	#category : #'*System-CommandLine',
	#timestamp : ' 8/31/2017 07:16:54'
}
OSPlatform>>newTerminfo [
	"By default we create a TermInfoCharacter, that uses escaping characters to style the text in a terminal.
	This imp is a hack: the platform should offer way to set it"
	^ TermInfoCharacter new
]
