Extension {
	#name : #MCVersionInspector
}

{
	#category : #'*Tool-Diff',
	#timestamp : ' 8/31/2017 05:26:25'
}
MCVersionInspector>>viewChanges: patch from: fromDescription to: toDescription [
	"Open a patch morph for the changes."
	
	|title|
	title := 'Changes from {1} to {2}' format: {fromDescription. toDescription}.
	PSMCPatchMorph usedByDefault
		ifTrue: [((PSMCPatchMorph forPatch: patch)
						fromDescription: fromDescription;
						toDescription: toDescription;
						newWindow)
					title: title;
					open]
		ifFalse: [(MCPatchBrowser forPatch: self version changes)
					showLabelled: title]
]
