"
I am builder class used to generate the tree nodes for a package or for all the dirty packages
"
Class {
	#name : #KomitTreeBuilder,
	#superclass : #Object,
	#category : #Komitter-UI,
	#timestamp : '<historical>'
}

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitTreeBuilder class>>buildRootForPackage: aKOPackage [

	^ self new
		buildRootForPackage: aKOPackage
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitTreeBuilder class>>rootsForStagingArea: aStagingArea [

	^ aStagingArea packages 
		collect: [ :each | self buildRootForPackage: each ]
		thenSelect: [:each | each isEmpty not ]
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitTreeBuilder>>buildRootForPackage: aPackage [

	^ KomitPackageNode new
		content: aPackage;
		yourself
]
