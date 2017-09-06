"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestCollectionsWeak,
	#superclass : #PackageManifest,
	#category : #Collections-Weak,
	#timestamp : '<historical>'
}

{
	#category : #meta-data,
	#timestamp : ' 8/31/2017 07:16:18'
}
ManifestCollectionsWeak class>>dependencies [
	^ #(#'System-Finalization' #'Collections-Support' #'Collections-Sequenceable' #'Collections-Unordered' #'Collections-Abstract' #Kernel)
]

{
	#category : #meta-data,
	#timestamp : ' 8/31/2017 07:16:18'
}
ManifestCollectionsWeak class>>description [
	^ 'All weak collections'
]

{
	#category : #'meta-data - dependency analyser',
	#timestamp : ' 8/31/2017 07:16:18'
}
ManifestCollectionsWeak class>>manuallyResolvedDependencies [
	^ #(#'System-Support' #'Collections-Streams')
]

{
	#category : #meta-data,
	#timestamp : ' 8/31/2017 07:16:18'
}
ManifestCollectionsWeak class>>packageName [
	^ #'Collections-Weak'
]
