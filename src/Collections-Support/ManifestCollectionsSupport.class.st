"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestCollectionsSupport,
	#superclass : #PackageManifest,
	#category : #Collections-Support,
	#timestamp : '<historical>'
}

{
	#category : #meta-data,
	#timestamp : ' 8/31/2017 07:16:56'
}
ManifestCollectionsSupport class>>dependencies [
	^ #(#'Collections-Strings' #'Collections-Native' #'Collections-Unordered' #Kernel #'Collections-Abstract')
]

{
	#category : #meta-data,
	#timestamp : ' 8/31/2017 07:16:56'
}
ManifestCollectionsSupport class>>description [
	^ 'Some basic classes used in collections: Link, Associtation, Weak*, CharacterSet, SetElement, etc.'
]

{
	#category : #'meta-data - dependency analyser',
	#timestamp : ' 8/31/2017 07:16:56'
}
ManifestCollectionsSupport class>>manuallyResolvedDependencies [
	^ #(#'Collections-Streams')
]

{
	#category : #meta-data,
	#timestamp : ' 8/31/2017 07:16:56'
}
ManifestCollectionsSupport class>>packageName [
	^ #'Collections-Support'
]
