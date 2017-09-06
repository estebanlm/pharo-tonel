"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestRingMonticello,
	#superclass : #PackageManifest,
	#category : #Ring-Monticello,
	#timestamp : '<historical>'
}

{
	#category : #'meta-data - dependency analyser',
	#timestamp : ' 8/31/2017 07:17:02'
}
ManifestRingMonticello class>>manuallyResolvedDependencies [
	^ #(#'Collections-Streams' #'Collections-Abstract')
]
