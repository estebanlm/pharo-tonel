Extension {
	#name : #MetacelloMCVersion
}

{
	#category : #'*NautilusGroupAutoBuilder',
	#timestamp : ' 8/31/2017 05:26:39'
}
MetacelloMCVersion>>loadAndCreateGroupInNautilus [
	self doLoadRequiredFromArray: self spec defaultPackageNames.
	LoadedPackagesGroupCreatingCodeProvider
		configurationName: spec project configuration class asString
		versionString: self spec versionString
		projectName: (spec project configuration class asString withoutPrefix: 'ConfigurationOf')
]
