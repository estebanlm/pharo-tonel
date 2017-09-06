"
I am a private class used by AnnotationPanePlugin
"
Class {
	#name : #AnnotationRequest,
	#superclass : #Object,
	#instVars : [
		'separator',
		'annotationRequests',
		'method'
	],
	#category : #NautilusCommon-Plugin,
	#timestamp : 'MarcusDenker 11/24/2015 14:10'
}

{
	#category : #instance-creation,
	#timestamp : ' 8/31/2017 05:26:22'
}
AnnotationRequest class>>onClass: aClass selector: aSelector [
	^ self new
		onClass: aClass selector: aSelector;
		yourself
]

{
	#category : #requests,
	#timestamp : ' 8/31/2017 05:26:22'
}
AnnotationRequest>>allChangeSets [
	"A list of all change sets bearing the method."

	| changeSets |
	changeSets := ChangeSet allChangeSetsWithClass: self methodClass selector: self methodSelector.
	^ changeSets isEmpty
		ifFalse: [ 
			String
				streamContents: [ :aStream | 
					changeSets size = 1
						ifTrue: [ aStream nextPutAll: 'only in change set ' ]
						ifFalse: [ aStream nextPutAll: 'in change sets: ' ].
					changeSets
						do: [ :aChangeSet | 
							aStream
								nextPutAll: aChangeSet name;
								nextPutAll: ' ' ] ] ]
		ifTrue: [ 'in no change set' ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
AnnotationRequest>>annotationRequests [
	
	^ annotationRequests ifNil: [ annotationRequests := self defaultAnnotationInfo ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
AnnotationRequest>>annotationRequests: annotationArray [
	"check defaultAnnotationInfo to know what you can pass in the array"
	annotationRequests := annotationArray
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
AnnotationRequest>>defaultAnnotationInfo [
	"Answer a list of symbol characterizing all the available kinds of annotations"

	^ #(#timeStamp #messageCategory #implementorsCount #allChangeSets)	"Each symbol represents the info type:
		#timeStamp	
			The time stamp of the last submission of the method.
		#firstComment 
			The first comment in the method, if any.
		#masterComment 
			The comment at the beginning of the supermost implementor 
			of the method if any.
		#documentation 
			Comment at beginning of the method or, if it has none, 
			comment at the beginning of a superclass's implementation of the method.
		#messageCategory 
			Which method category the method lies in.
		#sendersCount 
			A report of how many senders there of the message.
		#implementorsCount 
			A report of how many implementors there are of the message.
		#recentChangeSet	 
			The most recent change set bearing the method.
		#allChangeSets	 
			A list of all change sets bearing the method.
		#priorVersionsCount: 
			A report of how many previous versions there are of the method.
		#priorTimeStamp 
			The time stamp of the penultimate submission of the method, if any.
		"
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:22'
}
AnnotationRequest>>getAnnotations [
	^ String streamContents: [ :aStream | 
		((self annotationRequests 
			collect: [ :request | self perform: request ]) 
			reject: [ :stringOrNil | stringOrNil isEmptyOrNil ]) 
				do: [ :each | aStream nextPutAll: each ]
				separatedBy: [ aStream nextPutAll: separator ] ]
]

{
	#category : #requests,
	#timestamp : ' 8/31/2017 05:26:22'
}
AnnotationRequest>>implementorsCount [
	"A report of how many implementors there are of the message."

	| implementorsCount |
	implementorsCount := self methodSelector implementors size.
	^ implementorsCount = 1
		ifTrue: [ '1 implementor' ]
		ifFalse: [ implementorsCount printString , ' implementors' ]
]

{
	#category : #requests,
	#timestamp : ' 8/31/2017 05:26:22'
}
AnnotationRequest>>messageCategory [
	"Which method category the method lies in."

	^ self methodClass organization categoryOfElement: self methodSelector
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
AnnotationRequest>>method [
	^ method
]

{
	#category : #requests,
	#timestamp : ' 8/31/2017 05:26:22'
}
AnnotationRequest>>methodClass [
	^ method methodClass
]

{
	#category : #requests,
	#timestamp : ' 8/31/2017 05:26:22'
}
AnnotationRequest>>methodSelector [
	^ method selector
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:22'
}
AnnotationRequest>>onCompiledMethod: aCompiledMethod [
	method := aCompiledMethod.
	separator := ' - '
]

{
	#category : #requests,
	#timestamp : ' 8/31/2017 05:26:22'
}
AnnotationRequest>>sendersCount [
	"A report of how many senders there of the message."

	| sendersCount |
	sendersCount := (self systemNavigation allCallsOn: self methodSelector) size.
	^ sendersCount = 1
		ifTrue: [ '1 sender' ]
		ifFalse: [ sendersCount printString , ' senders' ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
AnnotationRequest>>separator: aString [
	separator := aString
]

{
	#category : #requests,
	#timestamp : ' 8/31/2017 05:26:22'
}
AnnotationRequest>>timeStamp [
	"The time stamp of the last submission of the method."

	^ method ifNotNil: [ method timeStamp ]
]
