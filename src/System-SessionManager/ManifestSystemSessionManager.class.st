"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestSystemSessionManager,
	#superclass : #PackageManifest,
	#category : #System-SessionManager,
	#timestamp : '<historical>'
}

{
	#category : #'meta-data - dependency analyser',
	#timestamp : ' 8/31/2017 07:16:58'
}
ManifestSystemSessionManager class>>manuallyResolvedDependencies [
	^ #(#'Collections-Streams' #Traits #'System-Support') 
]
