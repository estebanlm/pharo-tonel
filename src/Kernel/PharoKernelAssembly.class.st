"
I store metadata for this package assembly.
"
Class {
	#name : #PharoKernelAssembly,
	#superclass : #AssemblyManifest,
	#category : #Kernel,
	#timestamp : '<historical>'
}

{
	#category : #meta-data,
	#timestamp : ' 8/31/2017 07:16:33'
}
PharoKernelAssembly class>>description [
	^ 'I represent the minimal kernel, i.e. the minimum set of packages needed, to get a usable Pharo image.'
]

{
	#category : #meta-data,
	#timestamp : ' 8/31/2017 07:16:33'
}
PharoKernelAssembly class>>packageName [
	^ #'Pharo-Kernel'
]

{
	#category : #meta-data,
	#timestamp : ' 8/31/2017 07:16:33'
}
PharoKernelAssembly class>>parts [
	^ {
		(#Kernel -> #()) .
		(#Monticello -> #()) .
		(#'PharoBootstrap-Initialization' -> #()) .
		(#'NonInteractiveTranscript' -> #())
	}
]

{
	#category : #meta-data,
	#timestamp : ' 8/31/2017 07:16:33'
}
PharoKernelAssembly class>>version [
	^ '1.0-dev'
]
