"

"
Class {
	#name : #MenuModelTest,
	#superclass : #SpecTestCase,
	#category : #Spec-Tests-Core-Widgets,
	#timestamp : ''
}

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:46'
}
MenuModelTest>>classToTest [
	^ MenuModel
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
MenuModelTest>>testFromSpecSingle [
	| menuDescription |
	menuDescription := PluggableMenuSpec withModel: nil.
	menuDescription add: 'item'.
	testedInstance fromSpec: menuDescription.
	self assert: testedInstance menuGroups size equals: 1.
	self assert: testedInstance menuGroups first menuItems size equals: 1.
	self assert: testedInstance menuGroups first menuItems first name equals: 'item'.
	self openInstance
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
MenuModelTest>>testFromSpecSubMenu [
	| root subMenuRoot parent child subMenu |
	root := PluggableMenuSpec withModel: nil.
	parent := root add: 'parent'.
	subMenuRoot := PluggableMenuSpec withModel: nil.
	child := subMenuRoot add: 'child'.
	parent subMenu: subMenuRoot.
	testedInstance fromSpec: root.
	subMenu := testedInstance menuGroups first menuItems first subMenu.
	self assert: subMenu menuGroups size equals: 1.
	self assert: subMenu menuGroups first menuItems size equals: 1.
	self assert: subMenu menuGroups first menuItems first name equals: 'child'.
	self openInstance
]
