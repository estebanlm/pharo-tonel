Extension {
	#name : #ReInvocationSequenceRuleSequence
}

{
	#category : #'*qualityAssistantRecording',
	#timestamp : ' 8/31/2017 05:26:37'
}
ReInvocationSequenceRuleSequence>>dataForQAR [

	^ Dictionary newFromPairs: { 
		#before . before .
		#after  . after }
]
