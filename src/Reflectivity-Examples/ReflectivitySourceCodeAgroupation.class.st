"
I'm an agroupation of ReflectivityCodeMorph
"
Class {
	#name : #ReflectivitySourceCodeAgroupation,
	#superclass : #Morph,
	#category : #Reflectivity-Examples,
	#timestamp : 'mcamp 10/1/2015 11:44'
}

{
	#category : #initialize,
	#timestamp : ' 8/31/2017 05:26:45'
}
ReflectivitySourceCodeAgroupation>>defaultColor [
	^UITheme current class baseColor
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:45'
}
ReflectivitySourceCodeAgroupation>>initialize [
	super initialize.
	self
 		layoutPolicy: TableLayout new;
		hResizing: #spaceFill; 
		vResizing: #spaceFill;
		cellInset: 10.
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:45'
}
ReflectivitySourceCodeAgroupation>>newSourceCodeFor: aCompiledMethod [
	self addMorph: (ReflectivityCodeMorph compiledMethod: aCompiledMethod)
]
