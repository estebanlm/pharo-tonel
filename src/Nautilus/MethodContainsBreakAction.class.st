"
I show an action for methods with breakpoints in the browser
"
Class {
	#name : #MethodContainsBreakAction,
	#superclass : #AbstractMethodIconAction,
	#category : #Nautilus-Widgets,
	#timestamp : 'MarcusDenker 11/15/2015 16:56'
}

{
	#category : #order,
	#timestamp : ' 8/31/2017 05:26:22'
}
MethodContainsBreakAction>>actionOrder [
	"Return the priority of this action"
	
	^ 90
]

{
	#category : #order,
	#timestamp : ' 8/31/2017 05:26:22'
}
MethodContainsBreakAction>>isActionHandled [

	^ method hasBreakpoint
]

{
	#category : #order,
	#timestamp : ' 8/31/2017 05:26:22'
}
MethodContainsBreakAction>>privateActionIcon [
	"Return the icon for this action"
	^ IconicButton new
		target: self browser;
		actionSelector: #toggleBreakpointIn:;
		arguments: { self method};
		labelGraphic: (self iconNamed: #haltIcon);
		color: Color transparent;
		helpText: 'remove breakpoint';
		extent: self iconExtent;
		borderWidth: 0
]
