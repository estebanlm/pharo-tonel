"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestSystemLocalization,
	#superclass : #PackageManifest,
	#category : #System-Localization,
	#timestamp : '<historical>'
}

{
	#category : #'meta-data - dependency analyser',
	#timestamp : ' 8/31/2017 05:26:31'
}
ManifestSystemLocalization class>>manuallyResolvedDependencies [
	^ #(#'Collections-Streams' #'System-Platforms' #'Collections-Abstract')
]
