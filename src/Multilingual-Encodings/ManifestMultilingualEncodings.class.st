"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestMultilingualEncodings,
	#superclass : #PackageManifest,
	#category : #Multilingual-Encodings,
	#timestamp : '<historical>'
}

{
	#category : #'meta-data - dependency analyser',
	#timestamp : ' 8/31/2017 07:16:56'
}
ManifestMultilingualEncodings class>>manuallyResolvedDependencies [
	^ #(#Traits #'Multilingual-TextConversion' #'AST-Core' #'Collections-Streams' #'Collections-Abstract')
]
