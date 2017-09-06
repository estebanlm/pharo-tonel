"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestSystemVMEvents,
	#superclass : #PackageManifest,
	#category : #System-VMEvents,
	#timestamp : '<historical>'
}

{
	#category : #'meta-data - dependency analyser',
	#timestamp : ' 8/31/2017 05:26:10'
}
ManifestSystemVMEvents class>>manuallyResolvedDependencies [
	^ #(#'System-Support' #'Morphic-Core' #'Collections-Abstract' #'System-Platforms')
]
