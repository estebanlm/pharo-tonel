Extension { #name : #SequenceableCollection }

{ #category : #'*Morphic-Base-Pluggable Widgets' }
SequenceableCollection >> detectIndex: aBlock [

	^ self detectIndex: aBlock ifNone: [ self errorNotFound: aBlock ] 
]

{ #category : #'*Morphic-Base-Pluggable Widgets' }
SequenceableCollection >> detectIndex: aBlock ifNone: exceptionBlock [

	self doWithIndex: [:each :index | (aBlock value: each) ifTrue: [^ index]].
	^ exceptionBlock value
]
