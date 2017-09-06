Extension {
	#name : #MCMethodDefinition
}

{
	#category : #'*Ring-Monticello',
	#timestamp : ' 8/31/2017 07:17:02'
}
MCMethodDefinition>>asRingDefinition [

	^RGMethodDefinition new
		name: self selector;
		parentName: self className;
		isMetaSide: self classIsMeta;
		protocol: self protocol;
		sourceCode: self source;    
		stamp: self timeStamp
]
