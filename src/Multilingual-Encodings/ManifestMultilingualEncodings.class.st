"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestMultilingualEncodings,
	#superclass : #PackageManifest,
	#category : #Multilingual-Encodings
}

{ #category : #'meta-data - dependency analyser' }
ManifestMultilingualEncodings class >> manuallyResolvedDependencies [
	^ #(#Traits #'Multilingual-TextConversion' #'AST-Core' #'Collections-Streams' #'Collections-Abstract')
]
