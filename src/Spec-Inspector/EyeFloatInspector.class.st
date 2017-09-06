"
I am EyeFloatInspector.
I am an EyeInspector.

I am a specialized Inspector for Floats.
I add extra elements (sign, significand, exponent) of the Float object that I am inspecting.

Note that these should be interpreted as

sign * significand * (2 raisedToInteger: exponent)
"
Class {
	#name : #EyeFloatInspector,
	#superclass : #EyeInspector,
	#category : #Spec-Inspector,
	#timestamp : '<historical>'
}

{
	#category : #list,
	#timestamp : ' 8/31/2017 05:26:18'
}
EyeFloatInspector>>addSpecialFields: elements [

	elements add: (DynamicEyeElement 
		host: self object 
		label: 'sign' 
		value: [ self object sign ]).
			
	elements add: (DynamicEyeElement 
		host: self object 
		label: 'significand' 
		value: [ self object significand ]).
			
	elements add: (DynamicEyeElement 
		host: self object 
		label: 'exponent' 
		value: [ self object exponent ]).

	elements add: (DynamicEyeElement
		host: self object
		label: 'binary'
		value: [ self object binaryLiteralString ]).

]
