"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestCompression,
	#superclass : #PackageManifest,
	#category : #Compression,
	#timestamp : '<historical>'
}

{
	#category : #'meta-data - dependency analyser',
	#timestamp : ' 8/31/2017 07:17:01'
}
ManifestCompression class>>manuallyResolvedDependencies [
	^ #(#Jobs #'System-Support' #'System-Localization' #'System-Changes' #'Collections-Abstract' #Transcript)
]
