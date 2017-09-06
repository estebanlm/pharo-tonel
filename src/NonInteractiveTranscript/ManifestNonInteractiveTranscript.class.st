"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestNonInteractiveTranscript,
	#superclass : #PackageManifest,
	#category : #NonInteractiveTranscript,
	#timestamp : '<historical>'
}

{
	#category : #'meta-data - dependency analyser',
	#timestamp : ' 8/31/2017 07:16:57'
}
ManifestNonInteractiveTranscript class>>manuallyResolvedDependencies [
	^ #(#'Collections-Strings' #'System-Support')
]
