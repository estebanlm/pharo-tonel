"
Action when the method contains a halt
"
Class {
	#name : #MethodContainsHaltAction,
	#superclass : #AbstractMethodIconAction,
	#category : #Nautilus-Widgets,
	#timestamp : '<historical>'
}

{
	#category : #order,
	#timestamp : ' 8/31/2017 05:26:22'
}
MethodContainsHaltAction>>actionOrder [
	"Return the priority of this action"
	
	^ 100
]

{
	#category : #order,
	#timestamp : ' 8/31/2017 05:26:22'
}
MethodContainsHaltAction>>actionStateToCache [
	"Return the state of the icon for caching purpose"
	
	^ icon
]

{
	#category : #order,
	#timestamp : ' 8/31/2017 05:26:22'
}
MethodContainsHaltAction>>isActionHandled [

	^ method containsHalt
]

{
	#category : #order,
	#timestamp : ' 8/31/2017 05:26:22'
}
MethodContainsHaltAction>>privateActionIcon [
	"Return the icon for this action"

	^ self iconNamed: #haltIcon
]
