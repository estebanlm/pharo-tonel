"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestFileSystemPath,
	#superclass : #PackageManifest,
	#category : #FileSystem-Path,
	#timestamp : '<historical>'
}

{
	#category : #'meta-data - dependency analyser',
	#timestamp : ' 8/31/2017 07:16:38'
}
ManifestFileSystemPath class>>manuallyResolvedDependencies [
	^ #(#'Collections-Streams' #'Collections-Abstract')
]
