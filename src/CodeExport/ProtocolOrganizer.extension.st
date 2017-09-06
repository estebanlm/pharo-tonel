Extension {
	#name : #ProtocolOrganizer
}

{
	#category : #'*CodeExport',
	#timestamp : ' 8/31/2017 07:16:13'
}
ProtocolOrganizer>>stringForFileOut [

	^ String streamContents: [:aStream | 
			self protocols do: [:p | 
				aStream << $( << p name printString.
				p methods do: [:m |
					aStream << ' ' << m asString ].
				aStream << $); cr ]]
]
