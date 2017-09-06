"
A little line to show information....
"
Class {
	#name : #InformationLinePlugin,
	#superclass : #AbstractNautilusPlugin,
	#instVars : [
		'morph'
	],
	#category : #NautilusCommon-Plugin,
	#timestamp : 'Stef 7/8/2015 10:33'
}

{
	#category : #position,
	#timestamp : ' 8/31/2017 05:26:22'
}
InformationLinePlugin class>>defaultPosition [

	^ #middle
]

{
	#category : #information,
	#timestamp : ' 8/31/2017 05:26:22'
}
InformationLinePlugin class>>description [

	^ 'Display the URI of the selected element'
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:22'
}
InformationLinePlugin>>buildString [
	^ ''
]

{
	#category : #announcement,
	#timestamp : ' 8/31/2017 05:26:22'
}
InformationLinePlugin>>changed: ann [
	
	| string |
	string := self buildString.
	morph ifNotNil: [ morph contents: string ]
]

{
	#category : #display,
	#timestamp : ' 8/31/2017 05:26:22'
}
InformationLinePlugin>>display [

	morph :=  LabelMorph new 
					contents: '';
					enabled: false;
					vResizing: #shrinkWrap;
					hResizing: #spaceFill;
					yourself.
	^ morph
]

{
	#category : #registration,
	#timestamp : ' 8/31/2017 05:26:22'
}
InformationLinePlugin>>registerTo: aModel [

	aModel announcer
		when: NautilusPackageSelected send: #changed: to: self;
		when: NautilusClassSelected send: #changed: to: self;
		when: NautilusGroupSelected send: #changed: to: self;
		when: NautilusProtocolSelected send: #changed: to: self;
		when: NautilusMethodSelected send: #changed: to: self
]
