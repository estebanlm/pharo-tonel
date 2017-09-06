"
Metalinks are used to annotate other AST nodes. An annotated AST is expanded, compiled and executed on the fly thanks to the ReflectiveMethod/CompiledMethod Twin. 

For a given node metalinks can be put at different positions:

- before: The metalink is executed before the execution of the node.  
- instead: The metalink is executed insted the node.
- after: The metalink is executed after the execution of the node.
(... later: onError,  Do we have an #around instead of #instead?)

Not all the nodes provide all the position. For example, literals don't provide onError and onSuccess positions.

metaObject: The target object to call
selector: send this selector
arguments

condition:  turn link on/off 
level: Meta Level at which the link is active
------ Examples -----

MetaLink new 
	metaObject: Halt;
	selector: #now.
	
MetaObject new 
	metaObject: [ self halt ];
	selector: #value.
"
Class {
	#name : #MetaLink,
	#superclass : #Object,
	#instVars : [
		'arguments',
		'condition',
		'conditionArguments',
		'control',
		'level',
		'metaObject',
		'nodes',
		'selector',
		'options'
	],
	#category : #Reflectivity-Links,
	#timestamp : 'MarcusDenker 3/1/2015 18:09'
}

{
	#category : #options,
	#timestamp : ' 8/31/2017 07:16:26'
}
MetaLink class>>defaultOptions [
	^ #(
	+ optionInlineMetaObject            "meta object is inlined by default."
	+ optionInlineCondition              "condition is inlined by default."
	- optionCompileOnLinkInstallation   "generate compiledMethod on link installation"
	- optionOneShot                     "remove link after first activation"
	- optionMetalevel                   "force level: 0 for the link"
	- optionDisabledLink                "links are active by default"
	)
]

{
	#category : #cleanup,
	#timestamp : ' 8/31/2017 07:16:26'
}
MetaLink class>>uninstallAll [
	<script>
	self allInstances do: #uninstall.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:26'
}
MetaLink>>allReifications [
	| reifications |
	"we only check reification, that is symbols."
	reifications := (self arguments select: [:each | each isSymbol]) asSet. 
	self metaObject isSymbol ifTrue: [reifications add: self metaObject].
	
	self conditionArguments ifNil: [  
		self condition ifNotNil: [reifications addAll: (self reificationsFor: self condition)]]
		ifNotNil: [reifications addAll: self conditionArguments ].
	
	^reifications
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:26'
}
MetaLink>>arguments [
	^arguments
]

{
	#category : #'link api',
	#timestamp : ' 8/31/2017 07:16:26'
}
MetaLink>>arguments: args [
	arguments := args.
	self invalidate.
]

{
	#category : #installing,
	#timestamp : ' 8/31/2017 07:16:26'
}
MetaLink>>checkForCompatibilityWith: aNode [
	| supported |
	
	supported := Set new.
	RFReification subclasses do: [:plugin |
		(plugin entities anySatisfy: [:class | aNode isKindOf: class]) ifTrue: [
		supported add: plugin key]].
	self allReifications do: [ :each | (supported includes: each) ifFalse: [^false  ]  ].
	^true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:26'
}
MetaLink>>condition [
	^condition
]

{
	#category : #'link api',
	#timestamp : ' 8/31/2017 07:16:26'
}
MetaLink>>condition: aCondition [
	condition:= aCondition.
	self optionInlineCondition ifTrue: [^self invalidate].
	nodes do: [ :node |  | methodNode |
		methodNode := node methodNode.
		(methodNode metaLinkOptionsFromClassAndMethod includes: #optionInlineCondition)
			 ifTrue: [ methodNode method invalidate ] ].
	

	

]

{
	#category : #'link api',
	#timestamp : ' 8/31/2017 07:16:26'
}
MetaLink>>condition: aCondition arguments: anArray [
	self condition: aCondition.
	conditionArguments := anArray.

	

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:26'
}
MetaLink>>conditionArguments [
	^conditionArguments
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:26'
}
MetaLink>>control [
	^control
	
]

{
	#category : #'link api',
	#timestamp : ' 8/31/2017 07:16:26'
}
MetaLink>>control: aRFLinkControl [
	control:= aRFLinkControl.
	self invalidate.
]

{
	#category : #'reflecive api',
	#timestamp : ' 8/31/2017 07:16:26'
}
MetaLink>>disable [
	"turn off link reflectively while keeping the condition"
	self hasReifiedCondition
		ifFalse: [self condition: (RFCondition for: condition)].
	self condition disable.
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:26'
}
MetaLink>>doesNotUnderstand: message [

	(message selector isUnary and: [ message selector beginsWith: 'option'] )
		ifTrue: [ ^ options includes: message selector ].
		
	^ super doesNotUnderstand: message
]

{
	#category : #'reflecive api',
	#timestamp : ' 8/31/2017 07:16:26'
}
MetaLink>>enable [
	"turn on link reflectively if it has been turned off"
	self hasReifiedCondition
		ifTrue: [self condition enable].
	

]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:26'
}
MetaLink>>hasCondition	 [
	^condition notNil
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:26'
}
MetaLink>>hasMetaLevel [
	^level notNil
]

{
	#category : #options,
	#timestamp : ' 8/31/2017 07:16:26'
}
MetaLink>>hasOption: aSymbol [
	^options includes: aSymbol
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:26'
}
MetaLink>>hasReifiedCondition [
	self hasCondition ifFalse: [ ^false ].
	^self condition isKindOf: RFCondition
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:16:26'
}
MetaLink>>initialize [
	nodes := IdentitySet new.
	control := #before.
	selector := #value.
	arguments := #().
	options := Set new.
	self parseOptions: self class defaultOptions.
]

{
	#category : #installing,
	#timestamp : ' 8/31/2017 07:16:26'
}
MetaLink>>installOn: aNode  [
	nodes add: aNode
	
]

{
	#category : #installing,
	#timestamp : ' 8/31/2017 07:16:26'
}
MetaLink>>installOnVariable: aVariable [
	nodes add: aVariable
]

{
	#category : #installing,
	#timestamp : ' 8/31/2017 07:16:26'
}
MetaLink>>invalidate [
	nodes do: [ :node | node invalidate ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:26'
}
MetaLink>>level [
	^ level
]

{
	#category : #'link api',
	#timestamp : ' 8/31/2017 07:16:26'
}
MetaLink>>level: anObject [
	level := anObject.
	self invalidate.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:26'
}
MetaLink>>metaLinkOptions: anArray [
	self options: anArray
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:26'
}
MetaLink>>metaObject [
	^ metaObject
]

{
	#category : #'link api',
	#timestamp : ' 8/31/2017 07:16:26'
}
MetaLink>>metaObject: anObject [
	metaObject := anObject.
	self optionInlineMetaObject ifTrue: [^self invalidate].
	nodes do: [ :node | | methodNode |
		methodNode := node methodNode.
		(methodNode metaLinkOptionsFromClassAndMethod includes: #optionInlineMetaObject)
			 ifTrue: [ methodNode method invalidate ] ].
	
	
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:26'
}
MetaLink>>methods [
	^nodes flatCollect: [ :entity |
		(entity isKindOf: RBProgramNode) 
			ifTrue: [ {entity methodNode compiledMethod}  ]
			ifFalse: [ entity usingMethods ] ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:26'
}
MetaLink>>option: anArray  [
	self parseOptions: anArray
]

{
	#category : #options,
	#timestamp : ' 8/31/2017 07:16:26'
}
MetaLink>>optionCompileOnLinkInstallation [
	^ options includes: #optionCompileOnLinkInstallation
]

{
	#category : #options,
	#timestamp : ' 8/31/2017 07:16:26'
}
MetaLink>>optionCompileOnLinkInstallation: aBoolean [
	aBoolean
		ifTrue: [ options add: #optionCompileOnLinkInstallation ] 
		ifFalse: [ options remove: #optionCompileOnLinkInstallation ifAbsent:[] ]
]

{
	#category : #options,
	#timestamp : ' 8/31/2017 07:16:26'
}
MetaLink>>optionDisabledLink [
	^ options includes: #optionDisabledLink
]

{
	#category : #options,
	#timestamp : ' 8/31/2017 07:16:26'
}
MetaLink>>optionDisabledLink: aBoolean [
	aBoolean
		ifTrue: [ options add: #optionDisabledLink ] 
		ifFalse: [ options remove: #optionDisabledLink ifAbsent:[] ]
]

{
	#category : #options,
	#timestamp : ' 8/31/2017 07:16:26'
}
MetaLink>>optionInlineCondition [
	^ options includes: #optionInlineCondition
]

{
	#category : #options,
	#timestamp : ' 8/31/2017 07:16:26'
}
MetaLink>>optionInlineCondition: aBoolean [
	aBoolean
		ifTrue: [ options add: #optionInlineCondition ] 
		ifFalse: [ options remove: #optionInlineCondition ifAbsent:[] ]
]

{
	#category : #options,
	#timestamp : ' 8/31/2017 07:16:26'
}
MetaLink>>optionInlineMetaObject [
	^ options includes: #optionInlineMetaObject
]

{
	#category : #options,
	#timestamp : ' 8/31/2017 07:16:26'
}
MetaLink>>optionInlineMetaObject: aBoolean [
	aBoolean
		ifTrue: [ options add: #optionInlineMetaObject ] 
		ifFalse: [ options remove: #optionInlineMetaObject ifAbsent:[] ]
]

{
	#category : #options,
	#timestamp : ' 8/31/2017 07:16:26'
}
MetaLink>>optionMetalevel [
	^ options includes: #optionMetalevel
]

{
	#category : #options,
	#timestamp : ' 8/31/2017 07:16:26'
}
MetaLink>>optionMetalevel: aBoolean [
	aBoolean
		ifTrue: [ options add: #optionMetalevel ] 
		ifFalse: [ options remove: #optionMetalevel ifAbsent:[] ]
]

{
	#category : #options,
	#timestamp : ' 8/31/2017 07:16:26'
}
MetaLink>>optionOneShot [
	^ options includes: #optionOneShot
]

{
	#category : #options,
	#timestamp : ' 8/31/2017 07:16:26'
}
MetaLink>>optionOneShot: aBoolean [
	aBoolean
		ifTrue: [ options add: #optionOneShot ] 
		ifFalse: [ options remove: #optionOneShot ifAbsent:[] ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:26'
}
MetaLink>>options [
	^options
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:26'
}
MetaLink>>options: anArray  [
	self parseOptions: anArray
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:26'
}
MetaLink>>parseOptions: optionsArray [

	options parseOptions: optionsArray
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:26'
}
MetaLink>>reificationsFor: aBlockOrBoolean [
	(aBlockOrBoolean isKindOf: Boolean) ifTrue: [ ^#() ].
	(aBlockOrBoolean isKindOf: RFCondition) ifTrue: [^aBlockOrBoolean reifications].
	^aBlockOrBoolean argumentNames.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:26'
}
MetaLink>>selector [
	^selector
	
]

{
	#category : #'link api',
	#timestamp : ' 8/31/2017 07:16:26'
}
MetaLink>>selector: aSymbol [
	selector := aSymbol.
	self invalidate.
]

{
	#category : #installing,
	#timestamp : ' 8/31/2017 07:16:26'
}
MetaLink>>uninstall [
	nodes do: [:node | node removeLink: self].
	nodes removeAll.
]

{
	#category : #ast,
	#timestamp : ' 8/31/2017 07:16:26'
}
MetaLink>>valueInContext: aBlock [
	(RFMetaContext current isActive: (self level ifNil: [0]))
		ifFalse: [ ^ self ].
	RFMetaContext current shiftLevelUp.
	^ aBlock ctxtEnsure: [ RFMetaContext current shiftLevelDown ]
]
