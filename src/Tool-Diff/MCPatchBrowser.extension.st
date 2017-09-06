Extension {
	#name : #MCPatchBrowser
}

{
	#category : #'*Tool-Diff',
	#timestamp : ' 8/31/2017 05:26:25'
}
MCPatchBrowser>>diffSelection [
	"Open a diff browser on the selection."
	
	selection ifNotNil:
		[selection diff]
]

{
	#category : #'*Tool-Diff',
	#timestamp : ' 8/31/2017 05:26:25'
}
MCPatchBrowser>>methodListMenu: aMenu [

	selection 
		ifNotNil: [ 
			aMenu addList: #(
				('Install'	 installSelection)
				('Diff'	diffSelection)
				('Revert'	 revertSelection)
				-)].
	super methodListMenu: aMenu.
	^ aMenu

]
