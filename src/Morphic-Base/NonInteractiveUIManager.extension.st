Extension {
	#name : #NonInteractiveUIManager
}

{
	#category : #'*Morphic-Base',
	#timestamp : ' 8/31/2017 05:26:13'
}
NonInteractiveUIManager>>currentWorld [

	" err.. we should probably prohibit this message.. but lets play nice"
	
	uiManager ifNotNil: [ ^ uiManager currentWorld ].
	
	ActiveWorld ifNotNil: [^ActiveWorld].
	^World
]
