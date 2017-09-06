"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestHermes,
	#superclass : #PackageManifest,
	#category : #Hermes,
	#timestamp : '<historical>'
}

{
	#category : #'meta-data - dependency analyser',
	#timestamp : ' 8/31/2017 07:16:17'
}
ManifestHermes class>>manuallyResolvedDependencies [
	^ #(#'RPackage-Core' #Files #'Collections-Abstract')
]
