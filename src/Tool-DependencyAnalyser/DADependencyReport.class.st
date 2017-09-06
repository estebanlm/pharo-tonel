"
I'm reporting dependencies of packages previously analysed byt the dependnecy checker.
"
Class {
	#name : #DADependencyReport,
	#superclass : #Object,
	#instVars : [
		'dependencies',
		'warnings',
		'imageVersion',
		'analysisRunString'
	],
	#category : #Tool-DependencyAnalyser-Report,
	#timestamp : 'ChristopheDemarey 8/27/2015 09:13'
}

{
	#category : #example,
	#timestamp : ' 8/31/2017 05:26:37'
}
DADependencyReport class>>example [
	^ self new 
		add: #A dependencies: #();
		add: #B dependencies: #(#A);
		add: #C dependencies: #(#A #B);
		add: #D dependencies: #(#C #A #E);
		add: #E dependencies: #(#D);
		yourself
]

{
	#category : #adding,
	#timestamp : ' 8/31/2017 05:26:37'
}
DADependencyReport>>add: aPackageName dependencies: aListOfPackages [
	dependencies 
		at: aPackageName 
		put: aListOfPackages
]

{
	#category : #adding,
	#timestamp : ' 8/31/2017 05:26:37'
}
DADependencyReport>>addWarning: aWarning  [
	warnings add: aWarning
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DADependencyReport>>allPackages [
	^ Set new
		addAll: dependencies keys;
		addAll: dependencies values flattened;
		yourself
		
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DADependencyReport>>analysisRunString [
	^ analysisRunString
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DADependencyReport>>analysisRunString: aString [
	analysisRunString := aString
]

{
	#category : #iterating,
	#timestamp : ' 8/31/2017 05:26:37'
}
DADependencyReport>>dependenciesAndKnownDependantsDo: aBlockClosure  [
	dependencies keysAndValuesDo: [ :pkgName :deps |
		aBlockClosure 
			value: pkgName
			value: deps
			value: (self knownDependantsOf: pkgName) ]
]

{
	#category : #iterating,
	#timestamp : ' 8/31/2017 05:26:37'
}
DADependencyReport>>dependenciesDo: aBlockClosure  [
	dependencies keysAndValuesDo: aBlockClosure
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DADependencyReport>>dependenciesOf: aPackageName [
	^ dependencies at: aPackageName
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DADependencyReport>>dependenciesOf: aPackageName ifAbsentPut: aBlock [
	^ dependencies 
		at: aPackageName
		put: aBlock value
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DADependencyReport>>imageVersion [
	^ imageVersion
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DADependencyReport>>imageVersion: aSystemVersion  [
	imageVersion := aSystemVersion
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:37'
}
DADependencyReport>>initialize [
	super initialize.
	dependencies := Dictionary new.
	warnings := Set new
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DADependencyReport>>knownDependantsOf: aPackageName [
	^ dependencies associations 
		select: [ :association | association value includes: aPackageName ]
		thenCollect: #key
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 05:26:37'
}
DADependencyReport>>newReportScopedOn: aPackageName withoutDependencies: aListOfPackageNameToIgnore [
	"Generates a new dependency report discarding 
	- all packages that are not present in aPackageName transitive dependencies
	- all packages in aListOfPackageNameToIgnore"
	| report dependenciesToInclude |
	report := self class new.
	report
		imageVersion: imageVersion; 
		analysisRunString: analysisRunString , ' scoped on ' , aPackageName.
	dependenciesToInclude := self transitiveDependenciesOf: aPackageName withoutDependenciesOf: aListOfPackageNameToIgnore.
	warnings 
		select: [:warning | dependenciesToInclude includes: warning package ]
		thenDo: [:warning | report addWarning: warning ].
	dependencies associationsDo: [ :assoc |
		((dependenciesToInclude includes: assoc key) 
		and: [ (aListOfPackageNameToIgnore includes: assoc key) not ])
			ifTrue: [ report 
							add: assoc key 
							dependencies: assoc value ] ].
	^ report
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DADependencyReport>>transitiveDependenciesOf: aPackageName [
	^ self transitiveDependenciesOf: aPackageName visited: Set new
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:37'
}
DADependencyReport>>transitiveDependenciesOf: aPackageName visited: alreadyVisitedPackages [
	| deps |
	deps := Set new.
	alreadyVisitedPackages add: aPackageName.
	deps 
		addAll: (dependencies at: aPackageName).
	deps
		reject: [ :packageName | alreadyVisitedPackages includes: packageName ]
		thenDo: [ :packageName | deps addAll: (self transitiveDependenciesOf: packageName visited: alreadyVisitedPackages) ].
	^ deps
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DADependencyReport>>transitiveDependenciesOf: aPackageName withoutDependenciesOf: aListOfPackageNames [
	"Do not add noise to the analysis by adding transitive dependencies of dependencies we want to remove."
	^ self 
		transitiveDependenciesOf: aPackageName
		visited: (aListOfPackageNames collect: #asSymbol as: Set)
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DADependencyReport>>warnings [
	^ warnings
]
