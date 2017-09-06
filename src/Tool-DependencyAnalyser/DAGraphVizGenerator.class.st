"
A PDGraphVizGenerator is a class able to generate a dot file to represent a graph.
"
Class {
	#name : #DAGraphVizGenerator,
	#superclass : #Object,
	#instVars : [
		'builder',
		'graphviz',
		'nameOfGraph'
	],
	#category : #Tool-DependencyAnalyser-Core,
	#timestamp : 'BaptisteQuide 7/28/2014 14:59'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:37'
}
DAGraphVizGenerator class>>newWith: aContent named: aString [
	self subclassResponsibility
]

{
	#category : #'build items',
	#timestamp : ' 8/31/2017 05:26:37'
}
DAGraphVizGenerator>>buildGraphViz [
	graphviz := (self class environment at: #GVGraphViz) new.
	graphviz
		beDirected;
		name: self nameOfGraph.
	graphviz add: #node with: {(#shape -> #box)}.
	graphviz add: #graph with: { (#label -> self nameOfGraph). (#fontsize -> 20) }.	
	
	self
		buildNodes;
		buildEdges.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAGraphVizGenerator>>builder [
	^ builder
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAGraphVizGenerator>>graphviz [
	^ graphviz
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAGraphVizGenerator>>nameOfGraph [
	^ nameOfGraph ifNil: [ 'UnamedGraph' ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAGraphVizGenerator>>nameOfGraph: anObject [
	nameOfGraph := anObject
]

{
	#category : #saving,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAGraphVizGenerator>>openWith: extension [
	"make sure the .gv is generated and converted into a image format"
	graphviz openInWindowWith: extension
]

{
	#category : #saving,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAGraphVizGenerator>>saveDotFileAndGenerateForType: extension [
	^ graphviz generator makeNoWait: extension.
]
