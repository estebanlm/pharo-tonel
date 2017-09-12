Extension { #name : #ComposableModel }

{ #category : #'*Spec-MorphicAdapters' }
ComposableModel >> beginsWith: aString fromList: aMorph [
	"This method is used bu the list for the search of elements when you are typing directly in the list"
	
	^ self ensureMorphicAdapterDo: [ :adapter | adapter beginsWith: aString fromList: aMorph ]
]

{ #category : #'*Spec-MorphicAdapters' }
ComposableModel >> detectMorphicAdapterDo: aBlock [

	^ self dependents 
		detect: [:e | e isMorphicAdapter ]
		ifFound: aBlock
]

{ #category : #'*Spec-MorphicAdapters' }
ComposableModel >> detectMorphicAdapterDo: doBlock ifNone: aBlock [

	^ self dependents 
		detect: [:e | e isMorphicAdapter ]
		ifFound: doBlock
		ifNone: aBlock
]

{ #category : #'*Spec-MorphicAdapters' }
ComposableModel >> ensureMorphicAdapter [

	^ self dependents 
		detect: [:e | e isMorphicAdapter ]
		ifNone: [ self buildWithSpec ]
]

{ #category : #'*Spec-MorphicAdapters' }
ComposableModel >> ensureMorphicAdapterDo: aBlock [

	^ aBlock value: self ensureMorphicAdapter
]

{ #category : #'*Spec-MorphicAdapters' }
ComposableModel >> heightToDisplayInList: aList [
	"Return the width of my representation as a list item"
	
	^ self ensureMorphicAdapterDo: [ :adapter | adapter heightToDisplayInList: aList ]
]

{ #category : #'*Spec-MorphicAdapters' }
ComposableModel >> heightToDisplayInTree: aTree [
	"Return the width of my representation as a list item"
	
	^ self ensureMorphicAdapterDo: [ :adapter | adapter heightToDisplayInTree: aTree ]
]

{ #category : #'*Spec-MorphicAdapters' }
ComposableModel >> listRenderOn: aCanvas atRow: aRow bounds: drawBounds color: drawColor backgroundColor: backgroundColor from: aMorph [
	"Specify how this object as a list item should be drawn"

	^ self ensureMorphicAdapterDo: [ :adapter | adapter
		listRenderOn: aCanvas
		atRow: aRow
		bounds: drawBounds
		color: drawColor
		backgroundColor: backgroundColor
		from: aMorph ]
]

{ #category : #'*Spec-MorphicAdapters' }
ComposableModel >> openWorldWithSpec [
	"Build the widget using the default spec and display it into the world"

	^ self openWorldWithSpec: self defaultSpecSelector.
]

{ #category : #'*Spec-MorphicAdapters' }
ComposableModel >> openWorldWithSpec: aSpec [
	"Build the widget using the spec name provided as argument and display it into the world"

	^ self openWorldWithSpecLayout: (self retrieveSpec: aSpec)
]

{ #category : #'*Spec-MorphicAdapters' }
ComposableModel >> openWorldWithSpecLayout: aSpec [
	"Build the widget using the spec name provided as argument and display it into the world"

	(window value notNil and: [ self needRebuild not ])
		ifTrue: [
			window value rebuildWithSpecLayout: aSpec ]
		ifFalse: [ 
			window value: (WorldModel new model: self).
			window value openWithSpecLayout: aSpec.
			self takeKeyboardFocus ].
		
	^ window value
]

{ #category : #'*Spec-MorphicAdapters' }
ComposableModel >> treeRenderOn: aCanvas bounds: drawBounds color: drawColor font: aFont from: aMorph [
	"Specify how this object as a list item should be drawn"

	^ self ensureMorphicAdapterDo: [ :adapter | adapter 
		treeRenderOn: aCanvas 
		bounds: drawBounds 
		color: drawColor 
		font: aFont 
		from: aMorph ]
]

{ #category : #'*Spec-MorphicAdapters' }
ComposableModel >> widthToDisplayInList: aList [
	"Return the width of my representation as a list item"
	
	^ self ensureMorphicAdapterDo: [ :adapter | adapter widthToDisplayInList: aList ]
]

{ #category : #'*Spec-MorphicAdapters' }
ComposableModel >> widthToDisplayInTree: aTree [
	"Return the width of my representation as a list item"
	
	^ self ensureMorphicAdapterDo: [ :adapter | adapter widthToDisplayInTree: aTree ]
]
