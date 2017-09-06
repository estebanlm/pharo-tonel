"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestCollectionsStack,
	#superclass : #PackageManifest,
	#category : #Collections-Stack,
	#timestamp : '<historical>'
}

{
	#category : #meta-data,
	#timestamp : ' 8/31/2017 07:16:20'
}
ManifestCollectionsStack class>>dependencies [
	^ #(#'Collections-Sequenceable')
]

{
	#category : #meta-data,
	#timestamp : ' 8/31/2017 07:16:20'
}
ManifestCollectionsStack class>>description [
	^ 'I only contain a Stack implementation.'
]

{
	#category : #meta-data,
	#timestamp : ' 8/31/2017 07:16:20'
}
ManifestCollectionsStack class>>packageName [
	^ #'Collections-Stack'
]
