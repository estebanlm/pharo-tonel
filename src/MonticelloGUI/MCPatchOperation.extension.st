Extension {
	#name : #MCPatchOperation
}

{
	#category : #'*MonticelloGUI',
	#timestamp : ' 8/31/2017 05:26:23'
}
MCPatchOperation>>source [
	"I am call on the changes/merge tools of Monticello if you disable the 'Use Polymorph difference tool' on your setting."

	^ self localChosen
		ifTrue: [ self fromSource ]
		ifFalse: [ self sourceText ]
]

{
	#category : #'*MonticelloGUI',
	#timestamp : ' 8/31/2017 05:26:23'
}
MCPatchOperation>>sourceText [
	^ self isClassPatch 
		ifTrue: [(TextDiffBuilder from: self fromSource to: self toSource) buildDisplayPatch]
		ifFalse: [TextDiffBuilder buildDisplayPatchFrom:  self fromSource to: self toSource inClass: self targetClass]

]

{
	#category : #'*MonticelloGUI',
	#timestamp : ' 8/31/2017 05:26:23'
}
MCPatchOperation>>summary [
	| attribute |
	attribute := 
		self isResolved
			ifTrue: [self remoteChosen ifTrue: [#underlined] ifFalse: [#struckOut]]
			ifFalse: [#bold].
	^ Text string:( self definition summary, self summarySuffix) attribute: (TextEmphasis perform: attribute)
]
