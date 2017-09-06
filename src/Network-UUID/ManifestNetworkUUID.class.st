"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestNetworkUUID,
	#superclass : #PackageManifest,
	#category : #Network-UUID,
	#timestamp : '<historical>'
}

{
	#category : #'meta-data - dependency analyser',
	#timestamp : ' 8/31/2017 07:16:17'
}
ManifestNetworkUUID class>>ignoredDependencies [
	^ #(#'Network-Kernel')
]

{
	#category : #'meta-data - dependency analyser',
	#timestamp : ' 8/31/2017 07:16:17'
}
ManifestNetworkUUID class>>manuallyResolvedDependencies [
	^ #(#'AST-Core' #'Collections-Abstract')
]
