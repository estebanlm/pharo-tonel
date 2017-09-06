Extension {
	#name : #RGMethodDefinition
}

{
	#category : #'*Manifest-Core',
	#timestamp : ' 8/31/2017 05:26:30'
}
RGMethodDefinition>>arrayStringForManifest [
	| array |
	array := Array new:2.
	array at: 1 put:  (self class asString asSymbol).
	array at: 2 put: {self parentName asSymbol.  self selector asSymbol. self isMetaSide asString  asSymbol}.
	^ array 
	 
]

{
	#category : #'*manifest-core',
	#timestamp : ' 8/31/2017 05:26:30'
}
RGMethodDefinition class>>manifestReadOn: aArray [

 	^ self className:  (aArray at: 1) 
		selector: (aArray at: 2)
		isMetaSide: ((aArray at: 3) = #true)   
		
]

{
	#category : #'*Manifest-Core',
	#timestamp : ' 8/31/2017 05:26:30'
}
RGMethodDefinition>>storeOn: aStream [
	aStream nextPut: $(.
	aStream nextPutAll: self class asString.
	aStream nextPutAll: ' className: '''.
	aStream nextPutAll: self parentName.
	aStream nextPutAll: ''' selector: '.
	aStream nextPutAll: self selector printString.
	aStream nextPutAll: ' isMetaSide: '.
	aStream nextPutAll: self isMetaSide printString.
	aStream nextPut: $)
]
