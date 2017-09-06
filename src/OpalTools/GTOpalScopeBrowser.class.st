"
This is a simple browser that displays the scopes that the Opal Semantic Analysis add to te rb tree and previews each node on the source code.

Example:
self openOn: (self>>#compose) ast 
"
Class {
	#name : #GTOpalScopeBrowser,
	#superclass : #GLMCompositePresentation,
	#category : #OpalTools,
	#timestamp : 'MarcusDenker 10/16/2014 11:26'
}

{
	#category : #building,
	#timestamp : ' 8/31/2017 05:26:40'
}
GTOpalScopeBrowser>>compose [
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
GTOpalScopeBrowser>>sourceIn: a [
	^ a pharoMethod 
		smalltalkClass: [ :each | each parents first methodClass ]; 
		display: [ :each | each source ]
]

{
	#category : #building,
	#timestamp : ' 8/31/2017 05:26:40'
}
GTOpalScopeBrowser>>treeIn: a [
	^ a tree
		rootsExpanded;
		display: [ :anObject | anObject doSemanticAnalysis;scope ];
		children: [ :each | each children ];
		selectionPopulate: #selectedNode
			on: $o
			entitled: 'Open'
			with: [ :tree | tree selection ];
		format: [ :each | each printString];
		when: [ :anObject | anObject methodOrBlockNode notNil ].
]
