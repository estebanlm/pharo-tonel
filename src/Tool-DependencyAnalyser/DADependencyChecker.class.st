"
Utility class to easily check  dependencies of packages.


DADependencyChecker new dependenciesOf: #CargoPackageManager.

DADependencyChecker new transitiveDependenciesOf: #'CargoPackageManager-Minimal'.

DADependencyChecker new dependentsOf: #CargoPackageManager.
"
Class {
	#name : #DADependencyChecker,
	#superclass : #Object,
	#instVars : [
		'report'
	],
	#category : #Tool-DependencyAnalyser-Report,
	#timestamp : 'ChristopheDemarey 9/1/2015 11:48'
}

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:37'
}
DADependencyChecker>>buildPackageRelationGraphFor: aPackageName [
	^ [ (DAPackageRelationGraph onPackagesNamed: { aPackageName }) build ]
		on: PotentialOutDatedDependencyWarning 
		do: [ :ex | report addWarning: ex. ex resume ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:37'
}
DADependencyChecker>>computeDependenciesOf: aPackageName [
	| dependencies |
	dependencies := (self daPackageFor: aPackageName) dependentPackages collect: #packageName.
	^ ((dependencies
			addAll: (self manuallyResolvedDependenciesOf: aPackageName);
			yourself) 
		difference: (self ignoredDependenciesOf: aPackageName)) 
		sorted
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:37'
}
DADependencyChecker>>computeDependenciesOf: aPackageName visitedPackages: visited [
	| packageName |
	packageName := aPackageName asSymbol.
	report 
			add: packageName 
			dependencies: (self computeDependenciesOf: packageName).
	visited add: packageName
]

{
	#category : #'computing - dependencies',
	#timestamp : ' 8/31/2017 05:26:37'
}
DADependencyChecker>>computeImageDependencies [
	| visited |
	self newReport.
	report 
		analysisRunString: 'Pharo image dependencies';
		imageVersion: SystemVersion current.
	visited := Set new.
	RPackageOrganizer default packageNames 
		do: [ :packageName |
			self computeDependenciesOf: packageName visitedPackages: visited ].
	^ report
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:37'
}
DADependencyChecker>>computeTransitiveDependenciesOf: aPackageName visitedPackages: visited [
	(visited includes: aPackageName) ifTrue: [ ^ self ].
	self computeDependenciesOf: aPackageName visitedPackages: visited.
	(self dependenciesOf: aPackageName) 
		do: [ :each | self computeTransitiveDependenciesOf: each visitedPackages: visited ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:37'
}
DADependencyChecker>>daPackageFor: aPackageName [
	^ (((self buildPackageRelationGraphFor: aPackageName) packages)
			select: #isSeen) first
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DADependencyChecker>>dependenciesOf: aPackageName [
	^ report 
		dependenciesOf: aPackageName asSymbol
		ifAbsentPut: [ self computeDependenciesOf: aPackageName ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:37'
}
DADependencyChecker>>ignoredDependenciesOf: aPackageName [
	^ (RPackage organizer packageNamed: aPackageName) ignoredDependencies 
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:37'
}
DADependencyChecker>>initialize [
	super initialize.
	self newReport
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:37'
}
DADependencyChecker>>manuallyResolvedDependenciesOf: aPackageName [
	^ (RPackage organizer packageNamed: aPackageName) manuallyResolvedDependencies 
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:37'
}
DADependencyChecker>>newReport [
	^ report := DADependencyReport new
]

{
	#category : #'computing - dependencies',
	#timestamp : ' 8/31/2017 05:26:37'
}
DADependencyChecker>>shortestPathToPackageIntroducingDependency: dependencyPackageName startingFrom: aPackageName [
	"This method allows to easily spots a package dependency we want to avoid in the System.
	ex: DADependencyChecker new 
			computeImageDependencies;
			shortestPathToPackageIntroducingDependency: #'Athens-Core' startingFrom: 'Monticello'.
	The answer will be the shortest path (one, not all) going from #Monticello to #'Athens-Core',
	showing dependencies that leads to the introduction of the  #'Athens-Core' dependency.
		=> #(#Monticello #Kernel #'System-Settings' #'Morphic-Widgets-Windows' #'Rubric' #'Athens-Morphic' #'Athens-Core').
	Now, we know that System-Settings brings the whole graphical environment with him and that we should avoid the dependency 
	between #Kernel and #'System-Settings'."
	| dijkstra |
	report ifNil: [ ^ self ].
	dijkstra := MalDijkstra new.
	dijkstra nodes: report dependencies keys.
	report dependenciesDo: [ :packageName :dependencies |
		dependencies do: [ :dependency | 
			dijkstra edges: { packageName } from: [ :ignored | packageName ] to: [ :ignored | dependency ] ] ].
	dijkstra runFrom: aPackageName to: dependencyPackageName.
	^ dijkstra backtrack
]

{
	#category : #'computing - dependencies',
	#timestamp : ' 8/31/2017 05:26:37'
}
DADependencyChecker>>transitiveDependenciesOf: aPackageName [
	self newReport.
	report 
		analysisRunString: 'Transitive dependencies of ' , aPackageName;
		imageVersion: SystemVersion current.
	self computeTransitiveDependenciesOf: aPackageName visitedPackages: Set new.
	^ report
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DADependencyChecker>>unresolvedDependenciesOf: aPackageName  [
	^ [ (DAMessageSendAnalyzer on: aPackageName) missingMethodsWithPotentialMatchAfterManuallyResolvedDependenciesAddition
		reject: #isEmpty ]
		on: PotentialOutDatedDependencyWarning
		do: [ :ex | ex resume ]
]
