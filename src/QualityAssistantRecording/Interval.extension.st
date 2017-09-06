Extension {
	#name : #Interval
}

{
	#category : #'*qualityAssistantRecording',
	#timestamp : ' 8/31/2017 05:26:37'
}
Interval>>dataForQAR [

	^ Dictionary newFromPairs: { 
		#from . start .
		#to   . stop }
]
