"
I store meta-data for a package. I'm the common superclass of all package Manifest.
"
Class {
	#name : #PackageManifest,
	#superclass : #Object,
	#category : #Kernel,
	#timestamp : 'ChristopheDemarey 11/20/2014 11:15'
}

{
	#category : #meta-data,
	#timestamp : ' 8/31/2017 07:16:33'
}
PackageManifest class>>description [
	^ 'No description for this package manifest available. Please add a description for this package here.'
]

{
	#category : #'meta-data - dependency analyser',
	#timestamp : ' 8/31/2017 07:16:33'
}
PackageManifest class>>ignoredDependencies [
	^ #(#'System-Settings')
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:33'
}
PackageManifest class>>isManifest [
	^ (self = PackageManifest) not
]

{
	#category : #System-Support,
	#timestamp : ' 8/31/2017 07:16:33'
}
PackageManifest class>>isUsed [
	^ true
]

{
	#category : #'meta-data - dependency analyser',
	#timestamp : ' 8/31/2017 07:16:33'
}
PackageManifest class>>manuallyResolvedDependencies [
	^ #()
]

{
	#category : #unloading,
	#timestamp : ' 8/31/2017 07:16:33'
}
PackageManifest class>>postUnloadAction [

	"override to return block that will be executed after the package unloading. Keep in mind that all package classes are already removed from the system including the manifest class"
	
	^ [ "do nothing" ]
]

{
	#category : #unloading,
	#timestamp : ' 8/31/2017 07:16:33'
}
PackageManifest class>>preUnload [

	"override this method to specify clean-up actions that should be done before package unloading."
]

{
	#category : #code-critics,
	#timestamp : ' 8/31/2017 07:16:33'
}
PackageManifest class>>rejectClasses [
	^ #()
]

{
	#category : #code-critics,
	#timestamp : ' 8/31/2017 07:16:33'
}
PackageManifest class>>rejectRules [
	^ #()
]
