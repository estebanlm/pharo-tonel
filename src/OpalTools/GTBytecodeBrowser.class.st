"
This is a simple browser that displays bytecode and previews each node on the source code.

Example:
self openOn: (self>>#compose) 
"
Class {
	#name : #GTBytecodeBrowser,
	#superclass : #GLMCompositePresentation,
	#category : #OpalTools,
	#timestamp : 'MarcusDenker 10/16/2014 11:28'
}

{
	#category : #building,
	#timestamp : ' 8/31/2017 05:26:40'
}
GTBytecodeBrowser>>compose [
	self title: 'Tree'.
	self tabulator with: [ :browser |
		browser
			row: #tree;
			row: #source.
		browser transmit
			to: #tree;
			andShow: [ :a | self treeIn: a ].
		browser transmit
			to: #source;
			andShow: [ :a | self sourceIn: a ].
		browser transmit
			from: #tree;
			to: #source port: #selectionInterval;
			transformed: [ :rbNode | rbNode sourceInterval ].
		browser transmit
			toOutsidePort: #selection;
			from: #tree port: #selectedNode ]
]

{
	#category : #building,
	#timestamp : ' 8/31/2017 05:26:40'
}
GTBytecodeBrowser>>sourceIn: a [
	^ a pharoMethod 
		smalltalkClass: [ :each | each method methodClass ]; 
		display: [ :each | each sourceCode ]
]

{
	#category : #building,
	#timestamp : ' 8/31/2017 05:26:40'
}
GTBytecodeBrowser>>treeIn: a [
	^ a tree
		rootsExpanded;
		display: [ :anObject | anObject symbolicBytecodes ];
		children: [ :each | each isArray ifTrue: [each] ifFalse: #() ];
		selectionPopulate: #selectedNode
			on: $o
			entitled: 'Open'
			with: [ :tree | tree selection ];
		format: [ :each | each printString].
]
