"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestCodeExport,
	#superclass : #PackageManifest,
	#category : #CodeExport,
	#timestamp : '<historical>'
}

{
	#category : #'meta-data - dependency analyser',
	#timestamp : ' 8/31/2017 07:16:13'
}
ManifestCodeExport class>>manuallyResolvedDependencies [
	^ #(#Slot #'System-Localization' #'Collections-Abstract' #UIManager #'FileSystem-Disk')
]
