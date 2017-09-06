"
I'm a tree node representing a specific message send in the package under analysis.
"
Class {
	#name : #DAMessageSendNode,
	#superclass : #DAMethodDependencyNode,
	#category : #Tool-DependencyAnalyser-UI-Nodes,
	#timestamp : 'ChristopheDemarey 7/2/2015 14:07'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAMessageSendNode>>icon [
	^ self iconNamed: #smallLanguageIcon
]

{
	#category : #displaying,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAMessageSendNode>>label [
	^ String streamContents: [ :stream |
		stream
			nextPutAll: 'Sent in ';
			nextPutAll: self content methodClass asString;
			nextPutAll: '>>';
			nextPutAll: self content selector ]
]
