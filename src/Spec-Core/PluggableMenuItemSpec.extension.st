Extension {
	#name : #PluggableMenuItemSpec
}

{
	#category : #'*Spec-Core',
	#timestamp : ' 8/31/2017 05:26:18'
}
PluggableMenuItemSpec>>addToMenuGroupModel: aMenuGroupModel [

	aMenuGroupModel addItem: [ :item | item fromSpec: self ]
]

{
	#category : #'*Spec-Core',
	#timestamp : ' 8/31/2017 05:26:18'
}
PluggableMenuItemSpec>>addToMenuItemModel: aMenuItemModel [
	| en newSubMenu |
	en := self enabledBlock ifNil: [ self enabled ].
	newSubMenu := self subMenu
		ifNotNil: [ :sub | MenuModel new fromSpec: sub ].
	aMenuItemModel
		name: self label;
		state: self checked;
		enabled: en;
		icon: self icon;
		shortcut: self keyText;
		subMenu: newSubMenu;
		action: self action
]
