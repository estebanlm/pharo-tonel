"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestMonticello,
	#superclass : #PackageManifest,
	#category : #Monticello,
	#timestamp : '<historical>'
}

{
	#category : #'meta-data - dependency analyser',
	#timestamp : ' 8/31/2017 07:17:01'
}
ManifestMonticello class>>ignoredDependencies [
	^ #(#'Graphics-Primitives' #'FFI-Kernel' #'System-Settings')
]

{
	#category : #'meta-data - dependency analyser',
	#timestamp : ' 8/31/2017 07:17:01'
}
ManifestMonticello class>>manuallyResolvedDependencies [
	^ #(#'Graphics-Primitives' #'OpalCompiler-Core' #'System-Localization' #Jobs #'Random-Core' #'FFI-Kernel' #'Ring-Monticello' #'System-Settings' #'FileSystem-Disk')
]
