"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestCollectionsAbstract,
	#superclass : #PackageManifest,
	#category : #Collections-Abstract,
	#timestamp : '<historical>'
}

{
	#category : #meta-data,
	#timestamp : ' 8/31/2017 07:16:43'
}
ManifestCollectionsAbstract class>>dependencies [
	^ #(#'Regex-Core' #'Collections-Strings' #'Collections-Streams' #'Collections-Support' #'Collections-Unordered' #Kernel #'Collections-Sequenceable' #'Collections-Native')
]

{
	#category : #'meta-data - dependency analyser',
	#timestamp : ' 8/31/2017 07:16:43'
}
ManifestCollectionsAbstract class>>manuallyResolvedDependencies [
	^ #(#'Collections-Arithmetic' #Traits #'System-Localization')
]

{
	#category : #meta-data,
	#timestamp : ' 8/31/2017 07:16:43'
}
ManifestCollectionsAbstract class>>packageName [
	^ #'Collections-Abstract'
]
