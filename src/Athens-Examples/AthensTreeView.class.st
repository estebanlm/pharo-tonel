"
A tree visualization using Athens for display
"
Class {
	#name : #AthensTreeView,
	#superclass : #Object,
	#instVars : [
		'nodeExtentBlock',
		'nodeChildsBlock',
		'root',
		'rows'
	],
	#category : #Athens-Examples,
	#timestamp : 'TorstenBergmann 2/12/2014 22:16'
}

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensTreeView class>>example1 [

	AthensTreeView openOn: Collection extentBlock: [ :each | (5 + each instVarNames size)@(5 + each methodDict size)  ] childsBlock: [:el | el subclasses ] 
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensTreeView class>>openOn: root extentBlock: extBlock childsBlock: childsBlock [

	| scene |
	
	scene := self new root: root extentBlock: extBlock childsBlock: childsBlock.
		

	^ AthensSceneView new
		scene: scene;
		openInWindow.
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensTreeView>>buildSubtreeFor: aNodeObject level: aLevel [
	| node childs |
	
	node := AthensSimpleTreeNode new.
	node 
		subject: aNodeObject;
		extent: (nodeExtentBlock value: aNodeObject).
		
	childs := (nodeChildsBlock value: aNodeObject) collect:  [ :each | self buildSubtreeFor: each level: aLevel+1 ].
	node children: childs.

	(self rowAt: aLevel) add: node.
	
	^ node	

]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensTreeView>>layOutGeometry [

	"first do a vertical layout"
	
	| origin |
	
	origin := 0.
	
	
	rows do: [:row |  | rowHeight color |
		
		rowHeight := 0.
		color := Color random.
		
		row do: [ :node |
			node originY: origin.
			node color: color.
			rowHeight := rowHeight max: node height.
		].
	
		origin := origin + rowHeight + self spacingBetweenRows.
	].

	"now do a horizontal one"
	
	root layoutHorizontally: 0.
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensTreeView>>renderOn: aCanvas [
	aCanvas surface clear: Color white.
	root renderOn: aCanvas
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensTreeView>>root: aRootObject [

	root := self buildSubtreeFor: aRootObject level: 1.
	
	self layOutGeometry
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensTreeView>>root: aRootObject extentBlock: extBlock childsBlock: childsBlock [

	nodeExtentBlock := extBlock.
	nodeChildsBlock := childsBlock.

	root := self buildSubtreeFor: aRootObject level: 1.
	
	self layOutGeometry
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensTreeView>>rowAt: aLevel [
	rows ifNil: [  rows := OrderedCollection new ].
	
	[ aLevel > rows size ] whileTrue: [  rows add: OrderedCollection new ].

	^ rows at: aLevel
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensTreeView>>spacingBetweenRows [
	^ 30
]
