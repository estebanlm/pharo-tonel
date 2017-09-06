"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestCollectionsStreams,
	#superclass : #PackageManifest,
	#category : #Collections-Streams,
	#timestamp : '<historical>'
}

{
	#category : #meta-data,
	#timestamp : ' 8/31/2017 07:16:48'
}
ManifestCollectionsStreams class>>dependencies [
	^ #(#'Collections-Strings' #'Multilingual-TextConversion' #'Collections-Support' #'Collections-Sequenceable' #Kernel #'Collections-Native')
]

{
	#category : #meta-data,
	#timestamp : ' 8/31/2017 07:16:48'
}
ManifestCollectionsStreams class>>description [
	^ 'All Stream hierarchy: read/write stream'
]

{
	#category : #'meta-data - dependency analyser',
	#timestamp : ' 8/31/2017 07:16:48'
}
ManifestCollectionsStreams class>>ignoredDependencies [
	^ #(#'Tool-Transcript')
]

{
	#category : #'meta-data - dependency analyser',
	#timestamp : ' 8/31/2017 07:16:48'
}
ManifestCollectionsStreams class>>manuallyResolvedDependencies [
	^ #(#UIManager #'Tool-Transcript' #Transcript #Traits #'Collections-Abstract' #Jobs)
]

{
	#category : #meta-data,
	#timestamp : ' 8/31/2017 07:16:48'
}
ManifestCollectionsStreams class>>packageName [
	^ #'Collections-Streams'
]
