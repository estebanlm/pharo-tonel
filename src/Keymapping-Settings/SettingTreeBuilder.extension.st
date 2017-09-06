Extension {
	#name : #SettingTreeBuilder
}

{
	#category : #'*Keymapping-Settings',
	#timestamp : ' 8/31/2017 05:26:19'
}
SettingTreeBuilder>>attachShortcutCategory: aByteSymbol to: aClass [
	KMFactory keymapContainer attachCategoryName: aByteSymbol to: aClass.
]

{
	#category : #'*Keymapping-Settings',
	#timestamp : ' 8/31/2017 05:26:19'
}
SettingTreeBuilder>>shortcut: aShortcutNameSymbol [
	^ self nodeClass: KMShortcutDeclaration name: aShortcutNameSymbol
]
