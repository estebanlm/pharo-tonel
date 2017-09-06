"
A PDGraphVizGenerator is a class able to generate a dot file from a package cycle (PDPackageCycle)
"
Class {
	#name : #DAPackageCycleGenerator,
	#superclass : #DAGraphVizGenerator,
	#instVars : [
		'packageCycle'
	],
	#category : #Tool-DependencyAnalyser-Core,
	#timestamp : 'BaptisteQuide 7/28/2014 15:12'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageCycleGenerator class>>newWith: aPackageCycle named: aString [
	
	| generator |
	generator := self new.
	generator packageCycle: aPackageCycle.
	generator nameOfGraph: aString.
	generator buildGraphViz.
	^ generator
	
]

{
	#category : #'build items',
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageCycleGenerator>>buildEdges [
	packageCycle packages
		do: [ :package | 
			(packageCycle dependentPackagesFrom: package)
				do: [ :dependentPackage | graphviz add: package packageName -> dependentPackage packageName with: { #label -> (package dependenciesSizeTo: dependentPackage) } ] ]
		displayingProgress: 'Building edges'
]

{
	#category : #'build items',
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageCycleGenerator>>buildNodes [
	
	packageCycle packages 	
		do: [ :package |
			graphviz add: package packageName.
			 ] displayingProgress: 'Building nodes'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageCycleGenerator>>packageCycle [
	^ packageCycle
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageCycleGenerator>>packageCycle: anObject [
	packageCycle := anObject
]
