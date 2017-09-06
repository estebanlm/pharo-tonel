"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestSystemSupport,
	#superclass : #PackageManifest,
	#category : #System-Support,
	#timestamp : '<historical>'
}

{
	#category : #'meta-data - dependency analyser',
	#timestamp : ' 8/31/2017 07:16:13'
}
ManifestSystemSupport class>>ignoredDependencies [
	^ #(#'System-Settings' #'Graphics-Primitives')
]

{
	#category : #'meta-data - dependency analyser',
	#timestamp : ' 8/31/2017 07:16:13'
}
ManifestSystemSupport class>>manuallyResolvedDependencies [
	^ #(#'Collections-Support' #'System-Localization' #'System-Settings' #'System-Platforms')
]
