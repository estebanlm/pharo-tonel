"
Action when the method is abstract
"
Class {
	#name : #MethodIsAbstractAction,
	#superclass : #AbstractMethodIconAction,
	#category : #Nautilus-Widgets,
	#timestamp : '<historical>'
}

{
	#category : #order,
	#timestamp : ' 8/31/2017 05:26:22'
}
MethodIsAbstractAction>>actionOrder [
	"Return the priority of this action"
	
	^ 700
]

{
	#category : #order,
	#timestamp : ' 8/31/2017 05:26:22'
}
MethodIsAbstractAction>>actionStateToCache [
	"Return the state of the icon for caching purpose"
	
	^ icon
]

{
	#category : #order,
	#timestamp : ' 8/31/2017 05:26:22'
}
MethodIsAbstractAction>>isActionHandled [

	^ method isAbstract
]

{
	#category : #order,
	#timestamp : ' 8/31/2017 05:26:22'
}
MethodIsAbstractAction>>privateActionIcon [
	"Return the icon for this action"
	
	^ self iconNamed: #abstractIcon
]
