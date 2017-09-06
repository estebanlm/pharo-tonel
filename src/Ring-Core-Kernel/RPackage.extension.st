Extension {
	#name : #RPackage
}

{
	#category : #'*Ring-Core-Kernel',
	#timestamp : ' 8/31/2017 07:17:01'
}
RPackage>>asRingDefinition [
	^RGPackage named: self name asSymbol
]
