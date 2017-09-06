"
I am an eye element for instance variables.
"
Class {
	#name : #InstanceVariableEyeElement,
	#superclass : #AbstractEyeElement,
	#instVars : [
		'instVarName'
	],
	#category : #Spec-Inspector-Element,
	#timestamp : '<historical>'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:18'
}
InstanceVariableEyeElement class>>host: anObject instVarName: aString [
	^ (self host: anObject) instVarName: aString
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 05:26:18'
}
InstanceVariableEyeElement>>= anObject [
	^ super = anObject and: [ instVarName = anObject instVarName ]
]

{
	#category : #menu,
	#timestamp : ' 8/31/2017 05:26:18'
}
InstanceVariableEyeElement>>accessorCode [
	^ self instVarName
]

{
	#category : #menu,
	#timestamp : ' 8/31/2017 05:26:18'
}
InstanceVariableEyeElement>>customSubMenu: aMenu [
	
	aMenu addGroup: [ :aGroup | 
		aGroup 
			addItem: [:anItem | 
				anItem 
					name: 'List Methods Using "', self instVarName, '"';
					action: [ self referencesToInstanceVariable] ];
			addItem: [:anItem | 
				anItem 
					name: 'List Methods Storing into "', self instVarName, '"';
					action: [ self storingsIntoInstanceVariable].
			].
		]
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 05:26:18'
}
InstanceVariableEyeElement>>hash [
	^ super hash bitXor: instVarName hash
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
InstanceVariableEyeElement>>instVarName [
	^ instVarName
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
InstanceVariableEyeElement>>instVarName: aString [
	instVarName := aString
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
InstanceVariableEyeElement>>label [
	^ self instVarName
]

{
	#category : #action,
	#timestamp : ' 8/31/2017 05:26:18'
}
InstanceVariableEyeElement>>referencesToInstanceVariable [
	"Open a browser on all references to the selected instance variable, if that's what currently selected."

	^ self systemNavigation browseAllAccessesTo: self instVarName from: self hostClass
]

{
	#category : #action,
	#timestamp : ' 8/31/2017 05:26:18'
}
InstanceVariableEyeElement>>save: aValue [
	self host instVarNamed: self instVarName put: aValue
]

{
	#category : #action,
	#timestamp : ' 8/31/2017 05:26:18'
}
InstanceVariableEyeElement>>storingsIntoInstanceVariable [

	^ self systemNavigation browseAllStoresInto: self instVarName from: self hostClass
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
InstanceVariableEyeElement>>value [
	^ self host readSlotNamed: self instVarName
]
