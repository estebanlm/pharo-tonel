Extension {
	#name : #MCOrganizationDefinition
}

{
	#category : #'*Tool-Diff',
	#timestamp : ' 8/31/2017 05:26:25'
}
MCOrganizationDefinition>>patchWrapper [
	"Answer a wrapper for a patch tree for the receiver."

	^PSMCOrganizationChangeWrapper with: self
]
