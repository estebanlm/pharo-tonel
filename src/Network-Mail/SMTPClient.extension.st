Extension {
	#name : #SMTPClient
}

{
	#category : #'*Network-Mail',
	#timestamp : ' 8/31/2017 05:26:23'
}
SMTPClient class>>deliver: aMailMessage usingServer: aString [
	"See comment for #deliverMailFrom:to:text:usingServer:"
	
	self deliverMailFrom: aMailMessage from to: aMailMessage recipientList text: aMailMessage text usingServer: aString.
]
