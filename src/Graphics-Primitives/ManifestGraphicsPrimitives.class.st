"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestGraphicsPrimitives,
	#superclass : #PackageManifest,
	#category : #Graphics-Primitives,
	#timestamp : '<historical>'
}

{
	#category : #'meta-data - dependency analyser',
	#timestamp : ' 8/31/2017 05:26:09'
}
ManifestGraphicsPrimitives class>>manuallyResolvedDependencies [
	^ #(#'Graphics-Fonts' #'AST-Core' #Traits #'Graphics-Canvas')
]
