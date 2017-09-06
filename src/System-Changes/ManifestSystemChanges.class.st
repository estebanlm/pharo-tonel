"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestSystemChanges,
	#superclass : #PackageManifest,
	#category : #System-Changes,
	#timestamp : '<historical>'
}

{
	#category : #'meta-data - dependency analyser',
	#timestamp : ' 8/31/2017 07:17:01'
}
ManifestSystemChanges class>>manuallyResolvedDependencies [
	^ #(#'System-Localization' #CodeExport #'OpalCompiler-Core' #'FileSystem-Disk' #'Collections-Abstract')
]
