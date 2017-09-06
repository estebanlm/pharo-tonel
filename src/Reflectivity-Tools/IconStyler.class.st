"
I'm in charge to styling an ast with highlighting. To highglight something I need the rubric text model in textModel.

"
Class {
	#name : #IconStyler,
	#superclass : #RBProgramNodeVisitor,
	#instVars : [
		'textModel'
	],
	#category : #Reflectivity-Tools-Breakpoints,
	#timestamp : 'mcamp 11/17/2015 11:33'
}

{
	#category : #options,
	#timestamp : ' 8/31/2017 05:26:28'
}
IconStyler class>>shouldStyle [
	^true
]

{
	#category : #style,
	#timestamp : ' 8/31/2017 05:26:28'
}
IconStyler class>>style: textModel [
	^self new textModel: textModel.
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:28'
}
IconStyler class>>styleText: textModel withAst: ast [
	self allSubclassesDo: [ :styleClass | 
			styleClass shouldStyle
				ifTrue: [ ast acceptVisitor: (styleClass style: textModel) ] ]
]

{
	#category : #styling,
	#timestamp : ' 8/31/2017 05:26:28'
}
IconStyler>>addIconMethodStyle: aMethodNode [
	self addIconStyle: aMethodNode from: 1 to: 0
]

{
	#category : #styling,
	#timestamp : ' 8/31/2017 05:26:28'
}
IconStyler>>addIconStyle: aNode [
	self addIconStyle: aNode from: aNode start to: aNode stop.
]

{
	#category : #styling,
	#timestamp : ' 8/31/2017 05:26:28'
}
IconStyler>>addIconStyle: aNode from: start to: stop [
	
	self addIconStyle: aNode from: start to: stop color: self highlightColor 
]

{
	#category : #styling,
	#timestamp : ' 8/31/2017 05:26:28'
}
IconStyler>>addIconStyle: aNode from: start to: stop color: aColor [
	|conf|
	(self shouldStyleNode: aNode) ifFalse: [ ^self ].
	conf := RubConfigurationChange new.
	conf configurationBlock: [ :text| |r| 
		r := RubTextSegmentMorph from: start to: stop + 1.
		text addSegment: r.
		
		r label: (self iconLabelBlock: aNode).
		r icon: (self iconFor: aNode).
		r iconBlock: (self iconBlock: aNode).
		r color: aColor.
		r borderColor: self borderColor.
	].

	textModel announce: conf
]

{
	#category : #defaults,
	#timestamp : ' 8/31/2017 05:26:28'
}
IconStyler>>borderColor  [
	^Color gray
]

{
	#category : #defaults,
	#timestamp : ' 8/31/2017 05:26:28'
}
IconStyler>>highlightColor [
	^(Color green alpha: 0.1)
]

{
	#category : #defaults,
	#timestamp : ' 8/31/2017 05:26:28'
}
IconStyler>>iconBlock: aNode [
	^ [ ] 
]

{
	#category : #defaults,
	#timestamp : ' 8/31/2017 05:26:28'
}
IconStyler>>iconFor: aNode [
	^nil
]

{
	#category : #defaults,
	#timestamp : ' 8/31/2017 05:26:28'
}
IconStyler>>iconLabel: aNode [
	^ ''
]

{
	#category : #defaults,
	#timestamp : ' 8/31/2017 05:26:28'
}
IconStyler>>iconLabelBlock: aNode [
	^ [self iconLabel: aNode]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:28'
}
IconStyler>>shouldStyleNode: aNode [
	^false 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:28'
}
IconStyler>>textModel [
	^ textModel
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:28'
}
IconStyler>>textModel: anObject [
	textModel := anObject
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 05:26:28'
}
IconStyler>>visitArgumentNode: anArgumentNode  [
	self addIconStyle: anArgumentNode.
	super visitArgumentNode: anArgumentNode.
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 05:26:28'
}
IconStyler>>visitArrayNode: anArrayNode  [
	self addIconStyle: anArrayNode.
	super visitArrayNode: anArrayNode.
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 05:26:28'
}
IconStyler>>visitAssignmentNode: anAssignmentNode  [
	self addIconStyle: anAssignmentNode.
	super visitAssignmentNode: anAssignmentNode.
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 05:26:28'
}
IconStyler>>visitBlockNode: aBlockNode  [
	self addIconStyle: aBlockNode.
	super visitBlockNode: aBlockNode.
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 05:26:28'
}
IconStyler>>visitCascadeNode: aCascadeNode  [
	self addIconStyle: aCascadeNode.
	super visitCascadeNode: aCascadeNode.
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 05:26:28'
}
IconStyler>>visitGlobalNode: aSelfNode  [
	self addIconStyle: aSelfNode.
	super visitGlobalNode: aSelfNode.
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 05:26:28'
}
IconStyler>>visitInstanceVariableNode: aSelfNode  [
	self addIconStyle: aSelfNode.
	super visitInstanceVariableNode: aSelfNode.
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 05:26:28'
}
IconStyler>>visitLiteralArrayNode: aRBLiteralArrayNode  [
	self addIconStyle: aRBLiteralArrayNode.
	super visitLiteralArrayNode: aRBLiteralArrayNode.
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 05:26:28'
}
IconStyler>>visitLiteralNode: aLiteralNode  [
	self addIconStyle: aLiteralNode.
	super visitLiteralNode: aLiteralNode.
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 05:26:28'
}
IconStyler>>visitMessageNode: aMessageNode  [
	self addIconStyle: aMessageNode.
	super visitMessageNode: aMessageNode.
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 05:26:28'
}
IconStyler>>visitMethodNode: aMethodNode  [
	self addIconMethodStyle: aMethodNode.
	super visitMethodNode: aMethodNode.
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 05:26:28'
}
IconStyler>>visitParseErrorNode: anErrorNode  [
	self addIconStyle: anErrorNode.
	super visitParseErrorNode: anErrorNode.
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 05:26:28'
}
IconStyler>>visitPragmaNode: aPragmaNode  [
	self addIconStyle: aPragmaNode.
	super visitPragmaNode: aPragmaNode.
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 05:26:28'
}
IconStyler>>visitReturnNode: aReturnNode  [
	self addIconStyle: aReturnNode.
	super visitReturnNode: aReturnNode 
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 05:26:28'
}
IconStyler>>visitSelfNode: aSelfNode  [
	self addIconStyle: aSelfNode.
	super visitSelfNode: aSelfNode 
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 05:26:28'
}
IconStyler>>visitSequenceNode: aSequenceNode  [
	self addIconStyle: aSequenceNode.
	super visitSequenceNode: aSequenceNode.
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 05:26:28'
}
IconStyler>>visitSuperNode: aSuperNode  [
	self addIconStyle: aSuperNode.
	super visitSuperNode: aSuperNode.
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 05:26:28'
}
IconStyler>>visitTemporaryNode: aNode  [
	self addIconStyle: aNode.
	super visitTemporaryNode: aNode.
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 05:26:28'
}
IconStyler>>visitThisContextNode: aThisContextNode  [
	self addIconStyle: aThisContextNode.
	super visitThisContextNode: aThisContextNode.
]
