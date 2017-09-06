"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestGraphicsDisplayObjects,
	#superclass : #PackageManifest,
	#category : #'Graphics-Display Objects',
	#timestamp : '<historical>'
}

{
	#category : #'meta-data - dependency analyser',
	#timestamp : ' 8/31/2017 05:26:09'
}
ManifestGraphicsDisplayObjects class>>manuallyResolvedDependencies [
	^ #(#'Graphics-Canvas' #'Polymorph-Widgets' #'Graphics-Files' #Traits #'Collections-Streams')
]
