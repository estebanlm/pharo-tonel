"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestSystemPlatforms,
	#superclass : #PackageManifest,
	#category : #System-Platforms,
	#timestamp : '<historical>'
}

{
	#category : #'meta-data - dependency analyser',
	#timestamp : ' 8/31/2017 07:16:13'
}
ManifestSystemPlatforms class>>manuallyResolvedDependencies [
	^ #(#'Collections-Streams' #'Collections-Abstract' #Traits)
]
