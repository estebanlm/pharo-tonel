"
I am an eye inspector specified for MethodContext
"
Class {
	#name : #EyeMethodContextInspector,
	#superclass : #EyeInspector,
	#category : #Spec-Inspector,
	#timestamp : '<historical>'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
EyeMethodContextInspector class>>label [
	^ 'Context Inspector'
]

{
	#category : #list,
	#timestamp : ' 8/31/2017 05:26:18'
}
EyeMethodContextInspector>>addVariableFields: elements [

	self tempNames withIndexDo: [ :name :index |
		elements add: (ContextTempEyeElement host: self object tempName: name tempIndex: index) ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
EyeMethodContextInspector>>doItContext [
	^ self object
]

{
	#category : #list,
	#timestamp : ' 8/31/2017 05:26:18'
}
EyeMethodContextInspector>>tempNames [

	^ [ self object tempNames ]
		on: Error
		do: [ #() ]
]
