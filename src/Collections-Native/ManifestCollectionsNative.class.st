"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestCollectionsNative,
	#superclass : #PackageManifest,
	#category : #Collections-Native,
	#timestamp : '<historical>'
}

{
	#category : #meta-data,
	#timestamp : ' 8/31/2017 07:16:28'
}
ManifestCollectionsNative class>>dependencies [
	^ #(#'Collections-Abstract' #Kernel #'Collections-Strings')
]

{
	#category : #meta-data,
	#timestamp : ' 8/31/2017 07:16:28'
}
ManifestCollectionsNative class>>description [
	^ 'Arrays of native types: byte, word, float and integer'
]

{
	#category : #'meta-data - dependency analyser',
	#timestamp : ' 8/31/2017 07:16:28'
}
ManifestCollectionsNative class>>manuallyResolvedDependencies [
	^ #(#'Collections-Streams')
]

{
	#category : #meta-data,
	#timestamp : ' 8/31/2017 07:16:28'
}
ManifestCollectionsNative class>>packageName [
	^ #'Collections-Native'
]
