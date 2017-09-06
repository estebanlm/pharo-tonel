Extension {
	#name : #CompiledMethod
}

{
	#category : #'*Keymapping-Core',
	#timestamp : ' 8/31/2017 05:26:19'
}
CompiledMethod>>isShortcutDeclaration [

	^self pragmas anySatisfy: [ :p | p keyword = #shortcut ]
]
