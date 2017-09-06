Extension {
	#name : #Categorizer
}

{
	#category : #'*CodeExport',
	#timestamp : ' 8/31/2017 07:16:13'
}
Categorizer>>stringForFileOut [

	^ String streamContents: [:aStream || elementIndex |
			elementIndex := 1.
			1 to: categoryArray size do: 
				[:i | 
				aStream nextPut: $(.
				(categoryArray at: i) asString printOn: aStream.
				[elementIndex <= (categoryStops at: i)]
					whileTrue: 
						[aStream space; nextPutAll: (elementArray at: elementIndex).
						elementIndex := elementIndex + 1].
				aStream nextPut: $); cr ]]
]
