"
Specialized version of inspector showing keys on left panel and values on description panel
"
Class {
	#name : #EyeDictionaryInspector,
	#superclass : #EyeCollectionInspector,
	#category : #Spec-Inspector,
	#timestamp : '<historical>'
}

{
	#category : #list,
	#timestamp : ' 8/31/2017 05:26:18'
}
EyeDictionaryInspector>>addVariableFields: elements [

	self sortedKeys do: [ :key |
		elements add: (IndexedEyeElement host: self object index: key)]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
EyeDictionaryInspector>>sortedKeys [

	^ [ [ self object keys sort ] 
		on: Error 
		do: [ "case of non sortable keys" self object keys ]
			] on: Error do: [ #() ]
]
