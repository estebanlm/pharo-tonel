"
I'm a fast list presentation who introduces FTTableMorph into Glamour. 

Description 
-------------------

I just know how to render myself and I manage some options that the user can use for the FastTable.

The user can use almost all the functionalities of my superclass and some more. I work with a GLMMorphicFastListRenderer to render the list.  

Public API and Key Messages
-------------------

You can use the public API of my super class. You also use the public API of TGLMFastTableFunctionsPresentation (See his class comment) and you can finally use:

- #withSeparators 		I the input I receive is a collection of collection I will dispaly a list with separators between the collections.

Example
-------------------

GLMWrapper new 
	show: [ :a | 
		a fastList
			display: [ :x | 1 to: x ]];
	openOn: 1000.
	
or

GLMWrapper new 
	show: [ :a | 
		a fastList
				title: 'Example with an Outline List';
				display: [ :x | (x allSubclasses sort: [ :a :b | a asString < b asString  ]) collect: #allSubclasses  ];
				enableSearch;
				withSeparators
			];
	openOn: ProtoObject.

 
Internal Representation and Key Implementation Points.
-------------------

    Instance Variables
	parameters:		This is a Dictionary use to store some parameters of the presentation.

"
Class {
	#name : #GLMFastListPresentation,
	#superclass : #GLMListPresentation,
	#traits : 'TGLMFastTableFunctionsPresentation',
	#classTraits : 'TGLMFastTableFunctionsPresentation classTrait',
	#instVars : [
		'parameters'
	],
	#category : #Glamour-FastTable-Presentations,
	#timestamp : 'CyrilFerlicot 11/10/2015 10:52'
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMFastListPresentation>>allowSeparators [
	^ self parameters at: 'withSeparators' ifAbsent: [ false ]
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMFastListPresentation>>initialize [
	super initialize.
	parameters := Dictionary new
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMFastListPresentation>>parameters [
	^ parameters
]

{
	#category : #rendering,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMFastListPresentation>>renderGlamorouslyOn: aRenderer  [
	self registerAnnouncements.
	^ aRenderer renderFastListPresentation: self
]

{
	#category : #'public api',
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMFastListPresentation>>withSeparators [
	self parameters at: 'withSeparators' put: true
]
