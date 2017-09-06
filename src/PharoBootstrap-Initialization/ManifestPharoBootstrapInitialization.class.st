"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestPharoBootstrapInitialization,
	#superclass : #PackageManifest,
	#category : #PharoBootstrap-Initialization,
	#timestamp : '<historical>'
}

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 07:16:27'
}
ManifestPharoBootstrapInitialization class>>ignoredDependencies [
	^ #(#'SUnit-Core')
]

{
	#category : #'meta-data - dependency analyser',
	#timestamp : ' 8/31/2017 07:16:27'
}
ManifestPharoBootstrapInitialization class>>manuallyResolvedDependencies [
	^ #(#'System-Finalization' #'SUnit-Core')
]

{
	#category : #'meta-data - dependency analyser',
	#timestamp : ' 8/31/2017 07:16:27'
}
ManifestPharoBootstrapInitialization class>>packageName [
	^ #'PharoBootstrap-Initialization'
]
