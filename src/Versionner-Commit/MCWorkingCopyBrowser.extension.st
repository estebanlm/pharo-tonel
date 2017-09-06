Extension {
	#name : #MCWorkingCopyBrowser
}

{
	#category : #'*Versionner-Commit-UI',
	#timestamp : ' 8/31/2017 05:26:39'
}
MCWorkingCopyBrowser>>commitNewMajor [
	(VSCommitUnit major: self configurationClass) open
]

{
	#category : #'*Versionner-Commit-UI',
	#timestamp : ' 8/31/2017 05:26:39'
}
MCWorkingCopyBrowser>>commitNewMinor [
	(VSCommitUnit minor: self configurationClass) open
]

{
	#category : #'*Versionner-Commit-UI',
	#timestamp : ' 8/31/2017 05:26:39'
}
MCWorkingCopyBrowser>>commitNewPatch [
	(VSCommitUnit patch: self configurationClass) open
]

{
	#category : #'*Versionner-Commit-UI',
	#timestamp : ' 8/31/2017 05:26:39'
}
MCWorkingCopyBrowser>>configurationClass [
	^ Smalltalk globals at: workingCopy package name asSymbol 
]

{
	#category : #'*Versionner-Commit-UI',
	#timestamp : ' 8/31/2017 05:26:39'
}
MCWorkingCopyBrowser>>openWithVersionner [
	VersionnerProjectBrowser openOn: (MBConfigurationInfo  configurationClass: self configurationClass)
]

{
	#category : #'*Versionner-Commit-UI',
	#timestamp : ' 8/31/2017 05:26:39'
}
MCWorkingCopyBrowser>>versionCommitMenuSpec [
	<contextMenu: #configuration>
	
	^ #(#('Commit new PATCH version' #commitNewPatch) 
		#('Commit new MINOR version' #commitNewMinor) 
		#('Commit new MAJOR version' #commitNewMajor)
		#('Open with Versionner' #openWithVersionner))
]
