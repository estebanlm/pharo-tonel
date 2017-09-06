Extension {
	#name : #MCPatchOperation
}

{
	#category : #'*Tool-Diff',
	#timestamp : ' 8/31/2017 05:26:25'
}
MCPatchOperation>>diff [
	"Open a diff browser on the changes."

]

{
	#category : #'*Tool-Diff',
	#timestamp : ' 8/31/2017 05:26:25'
}
MCPatchOperation>>diffFromSource [
	"Answer fromSource of the operation for a diff tool."
	
	^self fromSource
]

{
	#category : #'*Tool-Diff',
	#timestamp : ' 8/31/2017 05:26:25'
}
MCPatchOperation>>diffToSource [
	"Answer toSource of the operation for a diff tool."
	
	^self toSource
]

{
	#category : #'*Tool-Diff',
	#timestamp : ' 8/31/2017 05:26:25'
}
MCPatchOperation>>patchWrapper [
	"Answer a wrapper for a patch tree for the receiver."

	^PSMCPatchOperationWrapper with: self
]

{
	#category : #'*Tool-Diff',
	#timestamp : ' 8/31/2017 05:26:25'
}
MCPatchOperation>>shortSummary [
	"Answer a short summary of the receiver."

	^self shortSummaryPrefix , self shortSummarySuffix
]

{
	#category : #'*Tool-Diff',
	#timestamp : ' 8/31/2017 05:26:25'
}
MCPatchOperation>>shortSummaryPrefix [
	"Answer a short summary prefix of the receiver."

	^ self definition summary
]

{
	#category : #'*Tool-Diff',
	#timestamp : ' 8/31/2017 05:26:25'
}
MCPatchOperation>>shortSummarySuffix [
	"Answer a short summary suffix of the receiver."

	^self fromSource = self toSource
		ifTrue: [' (revision changed)']
		ifFalse: ['']
]

{
	#category : #'*Tool-Diff',
	#timestamp : ' 8/31/2017 05:26:25'
}
MCPatchOperation>>targetClassName [
	"Answer the full class *name* of the target since the class may no longer exist."
	
	^self definition fullClassName
]
