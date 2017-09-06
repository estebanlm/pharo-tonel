"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestUnicodeInitialization,
	#superclass : #PackageManifest,
	#category : #Unicode-Initialization,
	#timestamp : '<historical>'
}

{
	#category : #'meta-data - dependency analyser',
	#timestamp : ' 8/31/2017 05:26:17'
}
ManifestUnicodeInitialization class>>manuallyResolvedDependencies [
	^ #(#'Zinc-HTTP' #'Zinc-Resource-Meta-Core' #'AST-Core' #'Collections-Streams' #'Collections-Abstract')
]
