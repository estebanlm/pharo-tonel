"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestRegexCore,
	#superclass : #PackageManifest,
	#category : #Regex-Core,
	#timestamp : '<historical>'
}

{
	#category : #'meta-data - dependency analyser',
	#timestamp : ' 8/31/2017 07:16:22'
}
ManifestRegexCore class>>manuallyResolvedDependencies [
	^ #(#'Collections-Abstract')
]
