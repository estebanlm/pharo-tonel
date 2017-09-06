"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestFileSystemDisk,
	#superclass : #PackageManifest,
	#category : #FileSystem-Disk,
	#timestamp : '<historical>'
}

{
	#category : #'meta-data - dependency analyser',
	#timestamp : ' 8/31/2017 07:16:32'
}
ManifestFileSystemDisk class>>manuallyResolvedDependencies [
	^ #(#'Collections-Abstract' #Traits #'System-Platforms' #'Collections-Strings' #'System-Support')
]
