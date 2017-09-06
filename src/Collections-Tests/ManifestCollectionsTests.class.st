"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestCollectionsTests,
	#superclass : #PackageManifest,
	#category : #Collections-Tests,
	#timestamp : '<historical>'
}

{
	#category : #meta-data,
	#timestamp : ' 8/31/2017 05:26:28'
}
ManifestCollectionsTests class>>dependencies [
	^ #(#'Collections-Streams' #'System-Finalization' #'Collections-Native' #'Collections-Abstract' #'Collections-Weak' #'Collections-Stack' #'Collections-Strings' #Compiler #'Collections-Sequenceable' #'SUnit-Core' #Kernel #'Graphics-Primitives' #'Collections-Support' #'Collections-Unordered' #'System-Support' #'Collections-Atomic' #'Multilingual-Encodings')
]

{
	#category : #meta-data,
	#timestamp : ' 8/31/2017 05:26:28'
}
ManifestCollectionsTests class>>description [
	^ 'I contain tests for collections'
]

{
	#category : #'meta-data - dependency analyser',
	#timestamp : ' 8/31/2017 05:26:28'
}
ManifestCollectionsTests class>>manuallyResolvedDependencies [
	^ #(#Traits #'Collections-Arithmetic' #Transcript)
]

{
	#category : #meta-data,
	#timestamp : ' 8/31/2017 05:26:28'
}
ManifestCollectionsTests class>>packageName [
	^ #CollectionsTests
]
