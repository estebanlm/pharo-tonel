Extension {
	#name : #MCMergeResolutionRequest
}

{
	#category : #'*Tool-Diff',
	#timestamp : ' 8/31/2017 05:26:25'
}
MCMergeResolutionRequest>>defaultAction [
	"Modally open a merge tool."
	
	^self viewMerger
]

{
	#category : #'*Tool-Diff',
	#timestamp : ' 8/31/2017 05:26:25'
}
MCMergeResolutionRequest>>viewMerger [
	"Open a model browser to perform the merge and answer wheter merged."

	^PSMCPatchMorph usedByDefault
		ifTrue: [self viewPatchMerger]
		ifFalse: [(MCMergeBrowser new
					merger: merger;
					label: messageText) showModally]
]

{
	#category : #'*Tool-Diff',
	#timestamp : ' 8/31/2017 05:26:25'
}
MCMergeResolutionRequest>>viewPatchMerger [
	"Open a modal diff tools browser to perform the merge."

	^ UIManager default merge: self merger informing: messageText.
]
