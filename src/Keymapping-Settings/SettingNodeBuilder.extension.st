Extension {
	#name : #SettingNodeBuilder
}

{
	#category : #'*Keymapping-Settings',
	#timestamp : ' 8/31/2017 05:26:19'
}
SettingNodeBuilder>>category: aByteSymbol  [
	node item categoryName: aByteSymbol
]

{
	#category : #'*Keymapping-Settings',
	#timestamp : ' 8/31/2017 05:26:19'
}
SettingNodeBuilder>>do: aBlockClosure  [
	node item action: aBlockClosure 
]

{
	#category : #'*Keymapping-Settings',
	#timestamp : ' 8/31/2017 05:26:19'
}
SettingNodeBuilder>>shortcutName: aShortcutName [
	node item shortcutName: aShortcutName
]
