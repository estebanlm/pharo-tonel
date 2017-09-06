"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestCodeImport,
	#superclass : #PackageManifest,
	#category : #CodeImport,
	#timestamp : '<historical>'
}

{
	#category : #'meta-data - dependency analyser',
	#timestamp : ' 8/31/2017 07:16:32'
}
ManifestCodeImport class>>manuallyResolvedDependencies [
	^ #(#'RPackage-Core' #'System-Support' #'Collections-Abstract' #Traits)
]
