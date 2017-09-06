Extension {
	#name : #Behavior
}

{
	#category : #'*ast-core',
	#timestamp : ' 8/31/2017 07:16:40'
}
Behavior>>parseTreeFor: aSymbol	 [
	^ RBParser parseMethod: (self sourceCodeAt: aSymbol) onError: [ :msg :pos | ^ nil ]
]
