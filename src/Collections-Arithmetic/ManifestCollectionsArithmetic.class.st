"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestCollectionsArithmetic,
	#superclass : #PackageManifest,
	#category : #Collections-Arithmetic,
	#timestamp : '<historical>'
}

{
	#category : #meta-data,
	#timestamp : ' 8/31/2017 07:16:28'
}
ManifestCollectionsArithmetic class>>dependencies [
	^ #(#'Collections-Native' #'Collections-Unordered' #'Collections-Sequenceable' #Kernel #'Collections-Abstract')
]

{
	#category : #meta-data,
	#timestamp : ' 8/31/2017 07:16:28'
}
ManifestCollectionsArithmetic class>>description [
	^ 'This package only makes extensions to existing collection classes by adding the arithmetic protocols. 
Such protocols allow one to perform in particular vector-operations on collection'
]

{
	#category : #meta-data,
	#timestamp : ' 8/31/2017 07:16:28'
}
ManifestCollectionsArithmetic class>>packageName [
	^ #'Collections-Arithmetic'
]
