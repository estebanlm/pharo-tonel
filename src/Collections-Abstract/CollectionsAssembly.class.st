"
I contain all basic collections.
"
Class {
	#name : #CollectionsAssembly,
	#superclass : #AssemblyManifest,
	#category : #Collections-Abstract,
	#timestamp : 'ChristopheDemarey 6/23/2015 10:52'
}

{
	#category : #meta-data,
	#timestamp : ' 8/31/2017 07:16:43'
}
CollectionsAssembly class>>description [
	^ 'I contain all basic collections.'
]

{
	#category : #meta-data,
	#timestamp : ' 8/31/2017 07:16:43'
}
CollectionsAssembly class>>packageName [
	^ #Collections
]

{
	#category : #meta-data,
	#timestamp : ' 8/31/2017 07:16:43'
}
CollectionsAssembly class>>parts [
	^ {#'Collections-Abstract' -> #().
	#'Collections-Arithmetic' -> #().
	#'Collections-Atomic' -> #().
	#'Collections-Native' -> #().
	#'Collections-Sequenceable' -> #().
	#'Collections-Stack' -> #().
	#'Collections-Streams' -> #().
	#'Collections-Strings' -> #().
	#'Collections-Support' -> #().
	#'Collections-Unordered' -> #().
	#'Collections-Weak' -> #()}
]

{
	#category : #meta-data,
	#timestamp : ' 8/31/2017 07:16:43'
}
CollectionsAssembly class>>version [
	^ '1.0-dev'
]
