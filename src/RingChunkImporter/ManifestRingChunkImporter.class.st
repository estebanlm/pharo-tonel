"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestRingChunkImporter,
	#superclass : #PackageManifest,
	#category : #RingChunkImporter,
	#timestamp : '<historical>'
}

{
	#category : #'meta-data - dependency analyser',
	#timestamp : ' 8/31/2017 07:17:01'
}
ManifestRingChunkImporter class>>manuallyResolvedDependencies [
	^ #(#'OpalCompiler-Core' #'FileSystem-Core' #'Collections-Abstract' #'Collections-Strings' #'System-Support')
]
