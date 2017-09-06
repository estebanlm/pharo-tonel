"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestCodeImportCommandLineHandlers,
	#superclass : #PackageManifest,
	#category : #CodeImportCommandLineHandlers,
	#timestamp : '<historical>'
}

{
	#category : #'meta-data - dependency analyser',
	#timestamp : ' 8/31/2017 07:16:49'
}
ManifestCodeImportCommandLineHandlers class>>manuallyResolvedDependencies [
	^ #(#UIManager #'System-CommandLineHandler' #'Collections-Abstract' #'FileSystem-Disk' #'System-Support')
]
