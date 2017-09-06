"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestTextCore,
	#superclass : #PackageManifest,
	#category : #Text-Core,
	#timestamp : '<historical>'
}

{
	#category : #'meta-data - dependency analyser',
	#timestamp : ' 8/31/2017 07:16:16'
}
ManifestTextCore class>>manuallyResolvedDependencies [
	^ #(#'Morphic-Core' #'Graphics-Fonts' #'System-VMEvents' #'OpalCompiler-Core' #'Morphic-Base' #FontInfrastructure #'Text-Edition')
]
