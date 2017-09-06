Extension {
	#name : #RecentMessageList
}

{
	#category : #'*NautilusCommon',
	#timestamp : ' 8/31/2017 05:26:22'
}
RecentMessageList>>lastClasses: anInteger [

	"I return the last anInteger classes modified"
	| result tempList |
	result := WeakOrderedCollection new.
	tempList := self methodReferenceList sorted: [:a :b | a timeStamp >= b timeStamp].
	
	tempList do: [:method |
		result size = anInteger ifTrue: [ ^ result ].
		method methodClass ifNotNil:[:class | |nonMetaClass|
		nonMetaClass := method methodClass theNonMetaClass.
		(result includes: nonMetaClass) ifFalse: [ result add: nonMetaClass ]]].
	^ result
]
