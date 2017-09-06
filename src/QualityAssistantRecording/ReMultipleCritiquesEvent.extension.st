Extension {
	#name : #ReMultipleCritiquesEvent
}

{
	#category : #'*qualityAssistantRecording',
	#timestamp : ' 8/31/2017 05:26:37'
}
ReMultipleCritiquesEvent>>dataForQAR [

	| data |

	data := super dataForQAR
		at: #critiques put:
			(critiques collect: #dataForQAREntityless as: Array);
		yourself.
		
	critiques ifEmpty: [ 
		(data at: #entity) removeKey: #sourceCode ifAbsent: [  ] ].

	^ data
]
