Extension {
	#name : #CompiledMethod
}

{
	#category : #'*Nautilus',
	#timestamp : ' 8/31/2017 05:26:22'
}
CompiledMethod>>dropIn: aRPackage forNautilusUI: aNautilusUI [
	aNautilusUI moveMethod: self inPackage: aRPackage.
	aNautilusUI updateCategoryAndMethodList
]
