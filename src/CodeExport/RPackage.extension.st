Extension {
	#name : #RPackage
}

{
	#category : #'*CodeExport',
	#timestamp : ' 8/31/2017 07:16:13'
}
RPackage>>fileOut [
	| internalStream |
	
	internalStream := (String new: 1000) writeStream.

	self classTags do: [ :each | 
		SystemOrganization 
			fileOutCategory: each categoryName 
			on: internalStream ].	
	
	classExtensionSelectors keysAndValuesDo: [ :className :selectors | 
		selectors do: [ :selector | | extendedClass |
			extendedClass := Smalltalk globals classNamed: className.
			extendedClass fileOutMethod: selector on: internalStream ] ].
	
	metaclassExtensionSelectors keysAndValuesDo: [ :className :selectors | 
		selectors do: [ :selector | | extendedClass |
			extendedClass := (Smalltalk globals classNamed: className).
			extendedClass theMetaClass fileOutMethod: selector on: internalStream ] ].
	
	^ FileStream writeSourceCodeFrom: internalStream baseName: self name isSt: true.
]
