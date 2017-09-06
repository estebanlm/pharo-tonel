"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestRandomCore,
	#superclass : #PackageManifest,
	#category : #Random-Core,
	#timestamp : '<historical>'
}

{
	#category : #'meta-data - dependency analyser',
	#timestamp : ' 8/31/2017 07:16:42'
}
ManifestRandomCore class>>ignoredDependencies [
	^ #(#Transcript)
]

{
	#category : #'meta-data - dependency analyser',
	#timestamp : ' 8/31/2017 07:16:42'
}
ManifestRandomCore class>>manuallyResolvedDependencies [
	^ #(#Transcript)
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 07:16:42'
}
ManifestRandomCore class>>packageName [
	^ 'Random-Core'
]
