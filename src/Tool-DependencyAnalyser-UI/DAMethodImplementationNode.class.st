"
I'm a tree node representing a method implementation
"
Class {
	#name : #DAMethodImplementationNode,
	#superclass : #DAMethodDependencyNode,
	#category : #Tool-DependencyAnalyser-UI-Nodes,
	#timestamp : 'ChristopheDemarey 7/2/2015 15:20'
}

{
	#category : #building-menu,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAMethodImplementationNode>>addMenuEntriesOn: aMenuGroup [
	| method |
	method := self content.
	aMenuGroup
		addMenuItem:
			(MenuItemModel new
				name: 'Select this package as the right dependency';
				action:
					[(TheManifestBuilder of: self packageUnderAnalysis packageManifest)
						addManuallyResolvedDependency: method package name.
					"TODO: run the analysis again" ])
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAMethodImplementationNode>>icon [
	^ self iconNamed: #packageIcon
]

{
	#category : #displaying,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAMethodImplementationNode>>label [
	^ String streamContents: [ :stream |
		stream
			nextPutAll: 'Implemented in ';
			nextPutAll: self content package name;
			nextPutAll: ': #';
			nextPutAll: self content methodClass name ]
]
