Extension {
	#name : #RPackageTag
}

{
	#category : #'*CodeExport',
	#timestamp : ' 8/31/2017 07:16:13'
}
RPackageTag>>fileOut [
	| internalStream |
	
	internalStream := (String new: 1000) writeStream.
	
	SystemOrganization 
		fileOutCategory: self categoryName 
		on: internalStream.
		
	^ FileStream writeSourceCodeFrom: internalStream baseName: self name isSt: true.
]
