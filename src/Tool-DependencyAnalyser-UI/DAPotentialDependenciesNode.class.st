"
I'm a node allowing to compute and browse potential dependencies of a package, i.e. messages sent in the package but with no corresponding method in the package or in its dependencies.
"
Class {
	#name : #DAPotentialDependenciesNode,
	#superclass : #DADependentPackageNode,
	#instVars : [
		'messageSendAnalysis'
	],
	#category : #Tool-DependencyAnalyser-UI-Nodes,
	#timestamp : 'ChristopheDemarey 7/8/2015 09:56'
}

{
	#category : #browse-nautilus,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPotentialDependenciesNode>>browseInNautilus [
	self browseMethodInNautilus:
		([ self packageUnderAnalysis packageManifest class methodNamed: #manuallyResolvedDependencies ]
			on: KeyNotFound
			do: [ PackageManifest class>>#manuallyResolvedDependencies ])
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPotentialDependenciesNode>>buildChildren [
	^ (self messageSendAnalysis unimplementedCallsInAllDependencies
		collect: [ :selector | 
						(DAMissingMethodNode new
								content: selector;
								parentNode: self;
								yourself) ]
		as: Array) 
			sort: [ :a :b | a content < b content ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPotentialDependenciesNode>>content [
	^ 'Potential dependencies'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPotentialDependenciesNode>>extensionDependenciesSize [
	^ 0
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPotentialDependenciesNode>>hasChildren [
	^ true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPotentialDependenciesNode>>icon [
	^ self iconNamed: #smallHelpIcon
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPotentialDependenciesNode>>isPackageNode [
	^ false
]

{
	#category : #displaying,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPotentialDependenciesNode>>label [
	^ self content
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPotentialDependenciesNode>>messageSendAnalysis [
	[ messageSendAnalysis ifNil: [ messageSendAnalysis := DAMessageSendAnalyzer on: self parentNode content packageName ] ]
		on: PotentialOutDatedDependencyWarning 
		do: [ :ex | ex resume. "ignore. We already got an alert box" ].
	^ messageSendAnalysis
]

{
	#category : #compatibility,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPotentialDependenciesNode>>numberOfDependencies [
	^ 0
]
