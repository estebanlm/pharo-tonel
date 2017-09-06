"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestToolTranscript,
	#superclass : #PackageManifest,
	#category : #Tool-Transcript,
	#timestamp : '<historical>'
}

{
	#category : #'meta-data - dependency analyser',
	#timestamp : ' 8/31/2017 05:26:18'
}
ManifestToolTranscript class>>manuallyResolvedDependencies [
	^ #(#'System-Support')
]
