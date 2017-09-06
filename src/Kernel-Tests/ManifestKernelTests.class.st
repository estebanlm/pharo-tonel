"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestKernelTests,
	#superclass : #PackageManifest,
	#category : #Kernel-Tests,
	#timestamp : '<historical>'
}

{
	#category : #meta-data,
	#timestamp : ' 8/31/2017 05:26:30'
}
ManifestKernelTests class>>dependencies [
	^ #(#'Graphics-Primitives' #'RPackage-Core' #'System-Announcements' #'Morphic-Core' #'Morphic-Base' #'System-Changes' #'Collections-Strings' #'Collections-Unordered' #Slot #Jobs #'Collections-Streams' #'FileSystem-Disk' #'System-Support' #'Text-Core' #'Collections-Abstract' #CollectionsTests #'Collections-Support' #'Collections-Sequenceable' #'SUnit-Core' #Tests #'OpalCompiler-Core' #Traits #Kernel #'Collections-Weak' #UIManager)
]

{
	#category : #meta-data,
	#timestamp : ' 8/31/2017 05:26:30'
}
ManifestKernelTests class>>description [
	^ 'I contain tests for the Kernel package.'
]

{
	#category : #meta-data,
	#timestamp : ' 8/31/2017 05:26:30'
}
ManifestKernelTests class>>packageName [
	^ #KernelTests
]
