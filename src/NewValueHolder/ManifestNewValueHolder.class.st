"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestNewValueHolder,
	#superclass : #PackageManifest,
	#category : #NewValueHolder,
	#timestamp : '<historical>'
}

{
	#category : #'meta-data - dependency analyser',
	#timestamp : ' 8/31/2017 05:26:15'
}
ManifestNewValueHolder class>>manuallyResolvedDependencies [
	^ #(#'Collections-Streams')
]
