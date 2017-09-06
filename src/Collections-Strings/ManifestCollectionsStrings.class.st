"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestCollectionsStrings,
	#superclass : #PackageManifest,
	#category : #Collections-Strings,
	#timestamp : '<historical>'
}

{
	#category : #meta-data,
	#timestamp : ' 8/31/2017 07:16:45'
}
ManifestCollectionsStrings class>>dependencies [
	^ #(#'Collections-Streams' #'Collections-Weak' #'Collections-Native' #'Collections-Support' #Kernel #'Collections-Sequenceable' #'Multilingual-Encodings' #'Collections-Abstract')
]

{
	#category : #meta-data,
	#timestamp : ' 8/31/2017 07:16:45'
}
ManifestCollectionsStrings class>>description [
	^ 'Contains String, ByteString, Symbol, ByteSymbol, WideSymbol and WideString'
]

{
	#category : #'meta-data - dependency analyser',
	#timestamp : ' 8/31/2017 07:16:45'
}
ManifestCollectionsStrings class>>manuallyResolvedDependencies [
	^ #(#Traits #'System-Support' #'AST-Core' #'Random-Core' #'OpalCompiler-Core')
]

{
	#category : #meta-data,
	#timestamp : ' 8/31/2017 07:16:45'
}
ManifestCollectionsStrings class>>packageName [
	^ #'Collections-Strings'
]
