"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestRPackageCore,
	#superclass : #PackageManifest,
	#category : #RPackage-Core,
	#timestamp : '<historical>'
}

{
	#category : #'meta-data - dependency analyser',
	#timestamp : ' 8/31/2017 07:16:47'
}
ManifestRPackageCore class>>manuallyResolvedDependencies [
	^ #(#'Ring-Core-Kernel' #UIManager #'System-Sources')
]
