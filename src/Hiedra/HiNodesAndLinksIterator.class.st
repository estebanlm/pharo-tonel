"
I know how to iterate a collection of HiNode in a specific depth-first way.
"
Class {
	#name : #HiNodesAndLinksIterator,
	#superclass : #Object,
	#instVars : [
		'alreadyIteratedItems',
		'linkBuilders',
		'nodeByValue',
		'values'
	],
	#category : #Hiedra-Rendering,
	#timestamp : '<historical>'
}

{
	#category : #enumerating,
	#timestamp : ' 8/31/2017 05:26:27'
}
HiNodesAndLinksIterator>>doWithNodes: nodesBlock doWithLinks: linksBlock  [
	self prepareToIterate.
	
	linkBuilders do: [ :linkModel |
		values do: [ :each |
			self 
				doWithNodes: nodesBlock 
				doWithLinks: linksBlock
				from: each
				linkBuilder: linkModel ] ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:27'
}
HiNodesAndLinksIterator>>doWithNodes: nodesBlock doWithLinks: linksBlock from: initialValue linkBuilder: aLinkBuilder [

	| pendingItems |
	pendingItems := Stack with: (self nodeAt: initialValue).
		
	[ pendingItems isEmpty ] whileFalse: [
		| currentItem |
		currentItem := pendingItems pop.

		(alreadyIteratedItems includes: currentItem) ifFalse: [
			alreadyIteratedItems add: currentItem.
			currentItem ifNode: nodesBlock ifLink: linksBlock ].
		
		currentItem isLink ifFalse: [
			(aLinkBuilder targetsOf: currentItem contents) do: [ :targetValue |
				| targetNode |
				targetNode := self nodeAt: targetValue.
				
				pendingItems
					push: (HiLink linkBuilder: aLinkBuilder origin: currentItem target: targetNode);
					push: targetNode ] ].
		].
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
HiNodesAndLinksIterator>>linkBuilders: aCollection [
	linkBuilders := aCollection
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:27'
}
HiNodesAndLinksIterator>>nodeAt: aValue [

	^ nodeByValue at: aValue
]

{
	#category : #enumerating,
	#timestamp : ' 8/31/2017 05:26:27'
}
HiNodesAndLinksIterator>>prepareToIterate [
	
	nodeByValue := Dictionary new.	
	values withIndexDo: [ :aValue :index |
		nodeByValue
			at: aValue
			put: (HiNode contents: aValue rowIndex: index) ].

	alreadyIteratedItems := Set new.

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
HiNodesAndLinksIterator>>values: aCollection  [
	values := aCollection
]
