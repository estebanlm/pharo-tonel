"
Load into your image the selected version or baseline. If you already have a version installed, then it will be simply overriden.
After loading, it creates a group in Nautilus with all the loaded packages.
"
Class {
	#name : #VSLoadAndCreateNautilusGroupCommand,
	#superclass : #VSLoadCommand,
	#category : #Versionner-Nautilus,
	#timestamp : 'FranckWarlouzet 8/13/2015 12:55'
}

{
	#category : #execute,
	#timestamp : ' 8/31/2017 05:26:41'
}
VSLoadAndCreateNautilusGroupCommand>>createGroupWithLoadedPackages [
	LoadedPackagesGroupCreatingCodeProvider
		configurationName: workflow project configurationClass asString
		versionString: workflow project version versionString
		projectName: workflow project name
]

{
	#category : #execute,
	#timestamp : ' 8/31/2017 05:26:41'
}
VSLoadAndCreateNautilusGroupCommand>>execute [
	super execute.
	self createGroupWithLoadedPackages
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:41'
}
VSLoadAndCreateNautilusGroupCommand>>title [
	^ 'load version and create a group in Nautilus'
]
