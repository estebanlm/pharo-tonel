"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestCollectionsAtomic,
	#superclass : #PackageManifest,
	#category : #Collections-Atomic,
	#timestamp : '<historical>'
}

{
	#category : #meta-data,
	#timestamp : ' 8/31/2017 07:16:43'
}
ManifestCollectionsAtomic class>>dependencies [
	^ #(#Kernel)
]

{
	#category : #'meta-data - dependency analyser',
	#timestamp : ' 8/31/2017 07:16:43'
}
ManifestCollectionsAtomic class>>manuallyResolvedDependencies [
	^ #(#'Collections-Streams')
]

{
	#category : #meta-data,
	#timestamp : ' 8/31/2017 07:16:43'
}
ManifestCollectionsAtomic class>>packageName [
	^ #'Collections-Atomic'
]
