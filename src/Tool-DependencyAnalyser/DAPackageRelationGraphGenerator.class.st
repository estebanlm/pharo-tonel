"
A PDGraphVizGenerator is a class able to generate a dot file from a relationGraph (PDPackageRelationGraph)
"
Class {
	#name : #DAPackageRelationGraphGenerator,
	#superclass : #DAGraphVizGenerator,
	#instVars : [
		'relationGraph'
	],
	#category : #Tool-DependencyAnalyser-Core,
	#timestamp : 'BaptisteQuide 7/28/2014 15:00'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageRelationGraphGenerator class>>newWith: aRelationGraph named: aString [

	| generator |
	generator := self new.
	generator relationGraph: aRelationGraph.
	generator nameOfGraph: aString.
	generator buildGraphViz.
	^ generator
]

{
	#category : #'build items',
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageRelationGraphGenerator>>buildEdges [
	relationGraph packages
		do: [ :package | 
			package dependencies
				do: [ :dependency | 
					graphviz
						add: dependency source packageName -> dependency target packageName
						with: {(#label -> dependency numberOfDependencies)} ] ]
		displayingProgress: 'Building edges'
]

{
	#category : #'build items',
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageRelationGraphGenerator>>buildNodes [
	relationGraph seenPackages do: [ :package | graphviz add: package packageName ] displayingProgress: 'Building nodes'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageRelationGraphGenerator>>relationGraph [
	^ relationGraph
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageRelationGraphGenerator>>relationGraph: anObject [
	relationGraph := anObject
]
