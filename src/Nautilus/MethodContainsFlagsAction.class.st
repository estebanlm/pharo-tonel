"
Action when the method contains a flag
"
Class {
	#name : #MethodContainsFlagsAction,
	#superclass : #AbstractMethodIconAction,
	#category : #Nautilus-Widgets,
	#timestamp : '<historical>'
}

{
	#category : #order,
	#timestamp : ' 8/31/2017 05:26:22'
}
MethodContainsFlagsAction>>actionOrder [
	"Return the priority of this action"

	^ 300
]

{
	#category : #order,
	#timestamp : ' 8/31/2017 05:26:22'
}
MethodContainsFlagsAction>>actionStateToCache [
	"Return the state of the icon for caching purpose"
	
	^ icon
]

{
	#category : #order,
	#timestamp : ' 8/31/2017 05:26:22'
}
MethodContainsFlagsAction>>isActionHandled  [

	^ method sendsAnySelectorOf: #(flag:)
]

{
	#category : #order,
	#timestamp : ' 8/31/2017 05:26:22'
}
MethodContainsFlagsAction>>privateActionIcon [
	"Return the icon for this action"

	^ self iconNamed: #flagIcon
]
