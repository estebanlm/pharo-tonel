"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestUIManager,
	#superclass : #PackageManifest,
	#category : #UIManager,
	#timestamp : '<historical>'
}

{
	#category : #'meta-data - dependency analyser',
	#timestamp : ' 8/31/2017 07:16:16'
}
ManifestUIManager class>>ignoredDependencies [
	^ #(#CodeImport #'FileSystem-Core' #Files #'Graphics-Display Objects' #NonInteractiveTranscript #'System-Settings')
]

{
	#category : #'meta-data - dependency analyser',
	#timestamp : ' 8/31/2017 07:16:16'
}
ManifestUIManager class>>manuallyResolvedDependencies [
	^ #(#'Collections-Streams' #'System-Support' #'OpalCompiler-Core' #Jobs #'System-Localization' #Traits #Monticello #'System-Settings')
]
