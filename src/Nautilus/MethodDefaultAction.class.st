"
Action by default, empty icon
"
Class {
	#name : #MethodDefaultAction,
	#superclass : #AbstractMethodIconAction,
	#category : #Nautilus-Widgets,
	#timestamp : '<historical>'
}

{
	#category : #order,
	#timestamp : ' 8/31/2017 05:26:22'
}
MethodDefaultAction>>actionOrder [
	"Return the priority of this action"
	
	^ 9999999999999999999999999999
]

{
	#category : #order,
	#timestamp : ' 8/31/2017 05:26:22'
}
MethodDefaultAction>>actionStateToCache [
	"Return the state of the icon for caching purpose"
	
	^ icon
]

{
	#category : #order,
	#timestamp : ' 8/31/2017 05:26:22'
}
MethodDefaultAction>>isActionHandled [
	"Return true if the provided method fits this action requirement"

	^ true
]

{
	#category : #order,
	#timestamp : ' 8/31/2017 05:26:22'
}
MethodDefaultAction>>privateActionIcon [
	"Return the icon for this action"

	^ self iconNamed: #emptyIcon
]
