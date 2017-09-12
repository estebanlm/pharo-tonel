Extension { #name : #TextModel }

{ #category : #'*NodeNavigation' }
TextModel >> isWorkspace [
	^false
]

{ #category : #'*NodeNavigation' }
TextModel >> sourceTextArea [
	^ self widget
]
