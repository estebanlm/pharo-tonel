"
I'm a tree node representing a message send, at least one time, in the package under analysis having no implementor in this package and its dependencies. 
"
Class {
	#name : #DAMissingMethodNode,
	#superclass : #DAMethodDependencyNode,
	#category : #Tool-DependencyAnalyser-UI-Nodes,
	#timestamp : 'ChristopheDemarey 7/2/2015 14:07'
}

{
	#category : #browse-nautilus,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAMissingMethodNode>>browseInNautilus [
	"Nothing to browse"
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAMissingMethodNode>>buildChildren [
	^ self messageSendNodes 
		addAll: self methodImplementationNodes;
		yourself
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAMissingMethodNode>>hasChildren [
	^ true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAMissingMethodNode>>icon [
	^ self iconNamed: #testNotRunIcon
]

{
	#category : #displaying,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAMissingMethodNode>>label [
	^ 'Missing method: #', self content
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAMissingMethodNode>>messageSendAnalysis [
	^ self parentNode messageSendAnalysis
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAMissingMethodNode>>messageSendNodes [
	^ self messageSendAnalysis rPackage methods
		select: [ :method | method sendsSelector: self content ]
		thenCollect: [ :method | 
			DAMessageSendNode new
				content: method;
				parentNode: self;
				yourself ]
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAMissingMethodNode>>methodImplementationNodes [
	^ (self content implementors collect: 
		[ :method | 
		DAMethodImplementationNode new
			content: method;
			parentNode: self;
			yourself ])
		sorted: [ :a :b | a content package name < b content package name ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAMissingMethodNode>>packageMethods [
	^ self messageSendAnalysis rPackage methods
]
