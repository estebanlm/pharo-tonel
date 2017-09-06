"
I'm a callout for testing the method builder. 
Basically, I do not introspect any variable :P
"
Class {
	#name : #FFICalloutMethodBuilderTestRecuestor,
	#superclass : #FFICallout,
	#category : #UnifiedFFI-Tests,
	#timestamp : '<historical>'
}

{
	#category : #'argument loaders',
	#timestamp : ' 8/31/2017 05:26:10'
}
FFICalloutMethodBuilderTestRecuestor>>loaderFromMethodArgsNamed: argName [
	(argName beginsWith: 'var')
		ifTrue: [ ^ 
			FFIMethodArgument new  
				argName: argName;
				index: (argName allButFirst: 3) asInteger ].
	^ nil
]
