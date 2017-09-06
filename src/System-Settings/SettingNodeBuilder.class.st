"
Used to build nodes from the settings framework
"
Class {
	#name : #SettingNodeBuilder,
	#superclass : #Object,
	#instVars : [
		'node',
		'builder'
	],
	#category : #System-Settings-Browser,
	#timestamp : 'TorstenBergmann 1/31/2014 10:35'
}

{
	#category : #'private tree building',
	#timestamp : ' 8/31/2017 05:26:16'
}
SettingNodeBuilder>>asParentWhile: aBlock [
	builder parent: self while: aBlock

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:16'
}
SettingNodeBuilder>>builder: aTreeBuilder [
	builder := aTreeBuilder
]

{
	#category : #'public declaration accessing',
	#timestamp : ' 8/31/2017 05:26:16'
}
SettingNodeBuilder>>default: anObject [
	node item  default: anObject

]

{
	#category : #'public declaration accessing',
	#timestamp : ' 8/31/2017 05:26:16'
}
SettingNodeBuilder>>description: aText [
	node item description: aText
]

{
	#category : #'public declaration accessing',
	#timestamp : ' 8/31/2017 05:26:16'
}
SettingNodeBuilder>>dialog: aSymbol [
	node item dialog: aSymbol

]

{
	#category : #'public declaration accessing',
	#timestamp : ' 8/31/2017 05:26:16'
}
SettingNodeBuilder>>domainValues: aCollection  [
	node item domainValues: aCollection 

]

{
	#category : #'public declaration accessing',
	#timestamp : ' 8/31/2017 05:26:16'
}
SettingNodeBuilder>>getSelector: aSymbol [
	node item getSelector: aSymbol

]

{
	#category : #'public declaration accessing',
	#timestamp : ' 8/31/2017 05:26:16'
}
SettingNodeBuilder>>ghostHelp: aString [
	node item ghostHelp: aString

]

{
	#category : #'public declaration accessing',
	#timestamp : ' 8/31/2017 05:26:16'
}
SettingNodeBuilder>>icon: aForm [
	node item icon: aForm
]

{
	#category : #'public declaration accessing',
	#timestamp : ' 8/31/2017 05:26:16'
}
SettingNodeBuilder>>iconName: aSymbol [
	self icon: (self iconNamed: aSymbol)
]

{
	#category : #'public declaration accessing',
	#timestamp : ' 8/31/2017 05:26:16'
}
SettingNodeBuilder>>label: aString [
	node item label: aString

]

{
	#category : #'public declaration accessing',
	#timestamp : ' 8/31/2017 05:26:16'
}
SettingNodeBuilder>>name [
	^ node item name

]

{
	#category : #'public declaration accessing',
	#timestamp : ' 8/31/2017 05:26:16'
}
SettingNodeBuilder>>name: aString [
	node item name: aString

]

{
	#category : #'public declaration accessing',
	#timestamp : ' 8/31/2017 05:26:16'
}
SettingNodeBuilder>>noOrdering [
	node item noOrdering

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:16'
}
SettingNodeBuilder>>node [
	^ node
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:16'
}
SettingNodeBuilder>>node: aSettingTreeNode [
	node := aSettingTreeNode
]

{
	#category : #'public declaration accessing',
	#timestamp : ' 8/31/2017 05:26:16'
}
SettingNodeBuilder>>notInStyle [
	node item notInStyle
]

{
	#category : #'public declaration accessing',
	#timestamp : ' 8/31/2017 05:26:16'
}
SettingNodeBuilder>>order: aNumber [
	node item order: aNumber

]

{
	#category : #'public declaration accessing',
	#timestamp : ' 8/31/2017 05:26:16'
}
SettingNodeBuilder>>parent: aSymbol [
	node parentName: aSymbol
]

{
	#category : #'public declaration accessing',
	#timestamp : ' 8/31/2017 05:26:16'
}
SettingNodeBuilder>>parentName [
	^ node parentName
	
]

{
	#category : #'public declaration accessing',
	#timestamp : ' 8/31/2017 05:26:16'
}
SettingNodeBuilder>>parentName: aSymbol [
	node parentName: aSymbol.
	
]

{
	#category : #'public declaration accessing',
	#timestamp : ' 8/31/2017 05:26:16'
}
SettingNodeBuilder>>precondition: aValuable [
	node item precondition: aValuable

]

{
	#category : #'public declaration accessing',
	#timestamp : ' 8/31/2017 05:26:16'
}
SettingNodeBuilder>>range: anInterval [
	node item range: anInterval

]

{
	#category : #'public declaration accessing',
	#timestamp : ' 8/31/2017 05:26:16'
}
SettingNodeBuilder>>script: aSymbol [
	node item script: aSymbol

]

{
	#category : #'public declaration accessing',
	#timestamp : ' 8/31/2017 05:26:16'
}
SettingNodeBuilder>>selector: aSymbol [
	node item selector: aSymbol

]

{
	#category : #'public declaration accessing',
	#timestamp : ' 8/31/2017 05:26:16'
}
SettingNodeBuilder>>setSelector: aSymbol [
	node item setSelector: aSymbol

]

{
	#category : #'public declaration accessing',
	#timestamp : ' 8/31/2017 05:26:16'
}
SettingNodeBuilder>>target: anObject [
	node item target: anObject

]

{
	#category : #'public declaration accessing',
	#timestamp : ' 8/31/2017 05:26:16'
}
SettingNodeBuilder>>targetSelector: aSelector [
	node item targetSelector: aSelector

]

{
	#category : #'public declaration accessing',
	#timestamp : ' 8/31/2017 05:26:16'
}
SettingNodeBuilder>>type: anObject [
	node item type: anObject

]

{
	#category : #'public tree building',
	#timestamp : ' 8/31/2017 05:26:16'
}
SettingNodeBuilder>>with: aBlock [
	self asParentWhile: aBlock
]
