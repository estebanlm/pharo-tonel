"
I'm a tree node representing a specific message send in the package under analysis.
"
Class {
	#name : #DAMessageSendDependencyNode,
	#superclass : #DAMessageSendNode,
	#instVars : [
		'sentMessages'
	],
	#category : #Tool-DependencyAnalyser-UI-Nodes,
	#timestamp : 'ChristopheDemarey 8/17/2015 16:24'
}

{
	#category : #displaying,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAMessageSendDependencyNode>>label [
	^ String streamContents: [ :stream |
		stream
			nextPutAll: self content methodClass asString;
			nextPutAll: '>>';
			nextPutAll: self content selector;
			nextPutAll: ' sends #'.
		sentMessages do: [ :message |
			stream nextPutAll: message ] ]
]

{
	#category : #setting,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAMessageSendDependencyNode>>sentMessages: aListOfSelectors  [
	sentMessages := aListOfSelectors
]
