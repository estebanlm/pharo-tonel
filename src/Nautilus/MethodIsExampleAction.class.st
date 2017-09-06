"
Action when the method is an example
"
Class {
	#name : #MethodIsExampleAction,
	#superclass : #AbstractMethodIconAction,
	#category : #Nautilus-Widgets,
	#timestamp : 'TorstenBergmann 8/22/2014 23:40'
}

{
	#category : #order,
	#timestamp : ' 8/31/2017 05:26:22'
}
MethodIsExampleAction>>actionOrder [
	"Return the priority of this action"
	
	^0
]

{
	#category : #order,
	#timestamp : ' 8/31/2017 05:26:22'
}
MethodIsExampleAction>>isActionHandled [

	^  (method methodClass isMeta) and: [
			method numArgs isZero and: [   
				(method selector beginsWith: 'example') or: [ 
					method hasPragmaNamed: #example 
		]]]
	 
]

{
	#category : #order,
	#timestamp : ' 8/31/2017 05:26:22'
}
MethodIsExampleAction>>privateActionIcon [

	 ^IconicButton new 
			target: self browser;
			actionSelector: #runExampleMethod:;
		 	arguments: { method };
			labelGraphic: (self iconNamed: #smallDoItIcon) ;
			color: Color transparent;
			extent: self iconExtent;
			helpText: 'Run the example';
			borderWidth: 0 
]
