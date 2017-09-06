Extension {
	#name : #Object
}

{
	#category : #'*renraku',
	#timestamp : ' 8/31/2017 05:26:37'
}
Object>>externalProperties [

	| pragmas  externalProperties |
	pragmas := Pragma allNamed: #eProperty from: self class to: ProtoObject.
	externalProperties := OrderedCollection new.

	pragmas do: [ :pragma |
		[ externalProperties addAll:
			(pragma method
				valueWithReceiver:
				self arguments: #())
		]
			on: Exception
			do: [ :ex |
				ReExceptionStrategy current
					handle: ex
					about: self
					forProppertiesDo: [ :prop |
						externalProperties add: prop ]  ] ].
			
	^ externalProperties

]

{
	#category : #'*renraku',
	#timestamp : ' 8/31/2017 05:26:37'
}
Object>>glmCritiqueSourceIn: composite [

	"display nothing for now"
]

{
	#category : #'*renraku',
	#timestamp : ' 8/31/2017 05:26:37'
}
Object>>gtInspectorEProportiesIn: composite [
	"This provides a list of all external properties"

	<gtInspectorPresentationOrder: 20>
	| eProperties ePropLazy |
	
	ReSettings inspectorPluggin ifFalse: [ ^ self ].
	
	ePropLazy := [
		eProperties ifNil: [ eProperties := self externalProperties ] ].
	
	composite list
		when: [ ePropLazy value notEmpty ];
		title: [ ePropLazy value size asString, (' property' asPluralBasedOn: ePropLazy value) ];
		titleIcon: [ CircleMorph new
				extent: 16 @ 16;
				borderWidth: 0;
				color: Color red darker darker;
				addMorphCentered:
					(ePropLazy value size asStringMorph
						color: Color white;
						emphasis: 1;
						yourself);
				iconOrThumbnail ];
		display: [ ePropLazy value ];
		icon: #icon;
		format: #title
]

{
	#category : #'*renraku',
	#timestamp : ' 8/31/2017 05:26:37'
}
Object>>spotterRePropertiesFor: aStep [
	<spotterOrder: 0>
	
	ReSettings spotterPlugin ifFalse: [ ^ self ].
	
	aStep listProcessor
		title: 'Renraku Properties';
		items: [ self externalProperties asArray ];
		itemName: #title;
		itemIcon: #icon;
		filter: GTFilterSubstring
]
