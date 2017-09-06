"
A column in a morphic based tree
"
Class {
	#name : #MorphTreeColumn,
	#superclass : #Object,
	#instVars : [
		'header',
		'container',
		'currentWidth',
		'rowMorphGetSelector',
		'shrinkWrap',
		'color',
		'isPotentialDropTarget',
		'resizable'
	],
	#category : #Morphic-Widgets-Tree,
	#timestamp : 'TorstenBergmann 9/5/2014 15:25'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeColumn>>asDraggableMorph [
	^ self thumbnailOfSize: self header fullBounds extent
	
]

{
	#category : #'column drawing',
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeColumn>>asPotentialDropTarget [
	isPotentialDropTarget := true.
	self container invalidRect: self visibleBounds
]

{
	#category : #'column drawing',
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeColumn>>color  [
	^ color ifNil: [self container columnColors at: ((self index \\ 2) + 1)]
]

{
	#category : #'column drawing',
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeColumn>>color: aColor [
	color := aColor
]

{
	#category : #'column drawing',
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeColumn>>container [
	^ container
]

{
	#category : #'column drawing',
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeColumn>>container: aTreeMorph [
	container := aTreeMorph
]

{
	#category : #'column drawing',
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeColumn>>contentWidth [
	| w |
	w := 0.
	self container allNodeMorphs do: [:n | w := w max: (n columnMorphAt: self index) width].
	^ w
]

{
	#category : #'column drawing',
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeColumn>>currentWidth [
	^ currentWidth ifNil: [currentWidth := self defaultWidth]
]

{
	#category : #'column drawing',
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeColumn>>currentWidth: anInteger [
	self resizable ifTrue: [currentWidth := anInteger]
]

{
	#category : #'column drawing',
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeColumn>>dataBounds  [
	^ self visibleBounds withTop: self container topHeader bottom
]

{
	#category : #'column drawing',
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeColumn>>defaultRowMorph [
	^ Morph new color: Color red; borderWidth: 0; extent: 0@0; yourself

]

{
	#category : #'column drawing',
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeColumn>>defaultWidth [
	^ 100
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeColumn>>drawColumnOn: aCanvas [
	self isPotentialDropTarget 
		ifTrue: [aCanvas 
					frameAndFillRectangle: self dataBounds 
					fillColor: ((Color gray alpha: 0.1) alphaMixed: 0.9 with: (self color ifNotNil: [:c | c asColor] ifNil: [Color transparent]))
					borderWidth: 2 
					borderColor: Color gray]
		ifFalse: [self color 
						ifNotNil: [:c | 
							c isColor 
								ifTrue: [
									aCanvas 
										frameAndFillRectangle: self dataBounds 
										fillColor: self color
										borderWidth: 0 
										borderColor: Color transparent]
								ifFalse: [c origin: self dataBounds topLeft.
									c direction: 0@self dataBounds height.
									aCanvas fillRectangle: self dataBounds  basicFillStyle: c]]]
]

{
	#category : #'column drawing',
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeColumn>>fixedWidth: anInteger [
	currentWidth := anInteger.
	resizable := false
]

{
	#category : #'column drawing',
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeColumn>>forceWidthTo: anInteger [
	currentWidth := anInteger
]

{
	#category : #'column drawing',
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeColumn>>header [
	^ header ifNil: [header :=  (Morph new extent: 0@0) color: Color transparent]
]

{
	#category : #'column drawing',
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeColumn>>header: aMorph [
	header := aMorph clipSubmorphs: true; yourself.
	header model: self
]

{
	#category : #'column drawing',
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeColumn>>headerButton [
	self header: ((MorphTreeColumnButton new) 
		layoutPolicy: RowLayout new; 
		listDirection: #leftToRight; 
		wrapCentering: #center;
		cellInset: 5@0;
		layoutInset: 5@0;
		yourself)
]

{
	#category : #'column drawing',
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeColumn>>headerButtonLabel: aLabel font: aFont [
	self headerButton.
	self header label: aLabel font: aFont.


]

{
	#category : #'column drawing',
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeColumn>>headerButtonLabel: aLabel font: aFont icon: anIconForm target: aReceiver actionSelector: aSelector arguments: aCollection [
	self headerButton.
	self header label: aLabel font: aFont.
	self header icon: (ImageMorph new form: anIconForm).
	self header actionSelector: aSelector.
	self header target: aReceiver.
	self header arguments: aCollection
]

{
	#category : #'column drawing',
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeColumn>>headerButtonLabel: aLabel font: aFont target: aReceiver actionSelector: aSelector arguments: aCollection [
	self headerButton.
	self header label: aLabel font: aFont.
	self header actionSelector: aSelector.
	self header target: aReceiver.
	self header arguments: aCollection
	
]

{
	#category : #'column drawing',
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeColumn>>headerButtonLabel: aLabel icon: anIconForm [
	self headerButtonLabel: aLabel font: nil.
	self header cellInset: 3@0.
	self header icon: (ImageMorph new form: anIconForm)
]

{
	#category : #geometry,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeColumn>>height [
	^ header ifNil: [0] ifNotNil: [header height]
]

{
	#category : #'column drawing',
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeColumn>>index [
	^ self container columns indexOf: self
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeColumn>>isFirstColumn [
	^ container columns first = self
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeColumn>>isLastColumn [
	^ container columns last = self
]

{
	#category : #'column drawing',
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeColumn>>isPotentialDropTarget [
	^ isPotentialDropTarget ifNil: [isPotentialDropTarget := false]
]

{
	#category : #'column drawing',
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeColumn>>itemMorphGetter: aSelectorOrAValuable [
	rowMorphGetSelector := aSelectorOrAValuable isSymbol 
		ifTrue: [[:node | node complexContents item perform: aSelectorOrAValuable]]
		ifFalse: [[:node | aSelectorOrAValuable value: node complexContents item]]
]

{
	#category : #'column drawing',
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeColumn>>itemStringGetter: aSelectorOrAValuable [
	rowMorphGetSelector := aSelectorOrAValuable isSymbol 
		ifTrue: [[:node | (node complexContents item perform: aSelectorOrAValuable) asMorph]]
		ifFalse: [[:node | (aSelectorOrAValuable value: node complexContents item) asMorph]]
]

{
	#category : #'column drawing',
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeColumn>>noMorePotentialDropTarget [
	isPotentialDropTarget := false.
	self container invalidRect: self visibleBounds
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeColumn>>nodeStringGetter: aSelectorOrAValuable [
	rowMorphGetSelector := aSelectorOrAValuable isSymbol 
		ifTrue: [[:node | (node complexContents perform: aSelectorOrAValuable) asMorph]]
		ifFalse: [[:node | (aSelectorOrAValuable value: node complexContents ) asMorph]]
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeColumn>>release [
	container := nil.
	header := nil.
	self releaseActionMap. "we are not sure if we need it"
	super release.
]

{
	#category : #'column drawing',
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeColumn>>resizable [
	^ resizable ifNil: [resizable := true]
]

{
	#category : #'column drawing',
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeColumn>>resizable: aBoolean [
	resizable := aBoolean
]

{
	#category : #'column drawing',
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeColumn>>rowMorphFor: aNode  [
	| rowMorph |
	
	rowMorph := self rowMorphGetSelector
		ifNil: [aNode rowMorphForColumn: self]
		ifNotNil: [self rowMorphGetterBlock value: aNode value: self container].
	rowMorph := rowMorph asMorph.
	rowMorph
		ifNotNil: [rowMorph borderWidth: 0]
		ifNil: [rowMorph := self defaultRowMorph].
	^ rowMorph rowMorphForNode: aNode inColumn: self

]

{
	#category : #'column drawing',
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeColumn>>rowMorphGetSelector [
	^ rowMorphGetSelector
]

{
	#category : #'column drawing',
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeColumn>>rowMorphGetSelector: aSelector [
	rowMorphGetSelector := aSelector
]

{
	#category : #'column drawing',
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeColumn>>rowMorphGetterBlock [
	^ self rowMorphGetSelector isSymbol
		ifTrue: [self rowMorphGetSelector numArgs = 0
				ifTrue: [[:node :cont | node perform: self rowMorphGetSelector]]
				ifFalse: [[:node :cont| node perform: self rowMorphGetSelector with: self container]]]
		ifFalse: [self rowMorphGetSelector numArgs = 2
				ifTrue: [self rowMorphGetSelector]
				ifFalse: [[:node :cont| self rowMorphGetSelector value: node]]] 
]

{
	#category : #'column drawing',
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeColumn>>shrinkWrap [
	^ shrinkWrap ifNil: [shrinkWrap := false]
]

{
	#category : #'column drawing',
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeColumn>>shrinkWrap: aBoolean [
	shrinkWrap := aBoolean
]

{
	#category : #'column drawing',
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeColumn>>startWidth: anInteger [
	currentWidth := anInteger
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeColumn>>thumbnailOfSize: thumbExtent [
	"Answer a new thumbnail for the receiver."

	|f t r|
	r := self header fullBounds scaledAndCenteredIn: (0@0 extent: thumbExtent).
	f := Form extent: r extent depth: Display depth.
	t := MatrixTransform2x3 withScale: 1.0.
	f getCanvas
		transformBy: t
		clippingTo: f boundingBox
		during: [:c | c translateBy: self visibleBounds topLeft negated during: [:ct | self container fullDrawOn: ct]]
		smoothing: 6.
	^ImageMorph new
		form: f
]

{
	#category : #'column drawing',
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeColumn>>visibleBounds [
	^ self header bounds withBottom: self container scroller bottom
]
