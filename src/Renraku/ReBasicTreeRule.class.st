"
I'm a basic root for all ast-based rules. My basicCheck: gets a method AST as the parameter
"
Class {
	#name : #ReBasicTreeRule,
	#superclass : #ReAbstractRule,
	#category : #Renraku-Deprecated,
	#timestamp : 'YuriyTymchuk 1/19/2016 11:26'
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:37'
}
ReBasicTreeRule class>>checksNode [

	^ self name ~= #ReBasicTreeRule
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:37'
}
ReBasicTreeRule>>basicCheck: anAST [
	self 
		deprecated: 'Please subclass from ReNodeBasedRule and treat the passed entity as in can be any AST node'
		on: 	'11 July 2016' 
		in: 'Pharo-6.0-60143-'.
	^ super basicCheck: anAST 
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:37'
}
ReBasicTreeRule>>checkMethod: aMethod [

	^ (self basicCheck: aMethod ast)
]
