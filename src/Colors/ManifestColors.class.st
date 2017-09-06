"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestColors,
	#superclass : #PackageManifest,
	#category : #Colors,
	#timestamp : '<historical>'
}

{
	#category : #'meta-data - dependency analyser',
	#timestamp : ' 8/31/2017 07:16:56'
}
ManifestColors class>>manuallyResolvedDependencies [
	^ #(#'Collections-Streams' #'AST-Core')
]
