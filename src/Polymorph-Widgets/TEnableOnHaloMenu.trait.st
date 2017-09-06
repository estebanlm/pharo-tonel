"
Trait providing an ""enabled"" option on the halo menu.
"
Trait {
	#name : #TEnableOnHaloMenu,
	#traits : '{}',
	#classTraits : '{}',
	#category : #Polymorph-Widgets,
	#timestamp : 'gvc 5/18/2007 11:56'
}

{
	#category : #'menu & halo',
	#timestamp : ' 8/31/2017 05:26:15'
}
TEnableOnHaloMenu>>addToggleItemsToHaloMenu: aCustomMenu  [
	"Add toggle-items to the halo menu"
	
	super addToggleItemsToHaloMenu: aCustomMenu.
	aCustomMenu
		addUpdating: #enabledString
		target: self
		selector: #toggleEnabled
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
TEnableOnHaloMenu>>enabled [
	"Answer the enabled state of the receiver."

	self requirement
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
TEnableOnHaloMenu>>enabled: aBoolean [
	"Set the enabled state of the receiver."

	self requirement
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:15'
}
TEnableOnHaloMenu>>enabledString [
	"Answer the string to be shown in a menu to represent the 'enabled' status"
	
	^ (self enabled) -> 'enabled' translated
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:15'
}
TEnableOnHaloMenu>>toggleEnabled [
	"Toggle the enabled state."

	self enabled: self enabled not
]
