"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestGraphicsDisplayObjects,
	#superclass : #PackageManifest,
	#category : #'Graphics-Display Objects'
}

{ #category : #'meta-data - dependency analyser' }
ManifestGraphicsDisplayObjects class >> manuallyResolvedDependencies [
	^ #(#'Graphics-Canvas' #'Polymorph-Widgets' #'Graphics-Files' #Traits #'Collections-Streams')
]
