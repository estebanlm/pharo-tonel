"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestMultilingualLanguages,
	#superclass : #PackageManifest,
	#category : #Multilingual-Languages,
	#timestamp : '<historical>'
}

{
	#category : #'meta-data - dependency analyser',
	#timestamp : ' 8/31/2017 07:16:12'
}
ManifestMultilingualLanguages class>>manuallyResolvedDependencies [
	^ #(#'Collections-Streams' #Traits #'System-Platforms')
]
