"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestCollectionsSequenceable,
	#superclass : #PackageManifest,
	#category : #Collections-Sequenceable,
	#timestamp : '<historical>'
}

{
	#category : #meta-data,
	#timestamp : ' 8/31/2017 07:16:17'
}
ManifestCollectionsSequenceable class>>dependencies [
	^ #(#'Collections-Strings' #'Collections-Streams' #'Collections-Unordered' #Kernel #'Collections-Abstract')
]

{
	#category : #meta-data,
	#timestamp : ' 8/31/2017 07:16:17'
}
ManifestCollectionsSequenceable class>>description [
	^ 'Sequenceable collections: arrays, intervals, ordered collections and dictionaries, etc.'
]

{
	#category : #'meta-data - dependency analyser',
	#timestamp : ' 8/31/2017 07:16:17'
}
ManifestCollectionsSequenceable class>>manuallyResolvedDependencies [
	^ #(#'System-Support' #'Collections-Support' #Traits)
]

{
	#category : #meta-data,
	#timestamp : ' 8/31/2017 07:16:17'
}
ManifestCollectionsSequenceable class>>packageName [
	^ #'Collections-Sequenceable'
]
