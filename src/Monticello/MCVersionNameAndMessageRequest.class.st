"
Notify to requests for version name and message
"
Class {
	#name : #MCVersionNameAndMessageRequest,
	#superclass : #Notification,
	#instVars : [
		'suggestion',
		'suggestedLogComment'
	],
	#category : #Monticello-Versioning,
	#timestamp : 'TorstenBergmann 2/6/2014 08:09'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCVersionNameAndMessageRequest>>suggestedLogComment [

	^ suggestedLogComment
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCVersionNameAndMessageRequest>>suggestedLogComment: aLogMessage [

	suggestedLogComment := aLogMessage
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCVersionNameAndMessageRequest>>suggestedName [
	^ suggestion
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCVersionNameAndMessageRequest>>suggestedName: aString [
	suggestion := aString
]
