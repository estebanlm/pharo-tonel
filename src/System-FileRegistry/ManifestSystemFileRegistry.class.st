"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestSystemFileRegistry,
	#superclass : #PackageManifest,
	#category : #System-FileRegistry,
	#timestamp : '<historical>'
}

{
	#category : #'meta-data - dependency analyser',
	#timestamp : ' 8/31/2017 07:16:48'
}
ManifestSystemFileRegistry class>>manuallyResolvedDependencies [
	^ #(#'System-Localization' #'FileSystem-Core' #'Collections-Abstract')
]
