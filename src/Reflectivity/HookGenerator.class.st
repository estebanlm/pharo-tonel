"
New version

-> takes all links and one node
-> returns the complete AST for the hook.
"
Class {
	#name : #HookGenerator,
	#superclass : #Object,
	#instVars : [
		'entity',
		'node',
		'links',
		'plugins'
	],
	#category : #Reflectivity-Core,
	#timestamp : 'MarcusDenker 7/2/2015 10:30'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:26'
}
HookGenerator class>>entity: anEntity node: aNode [
	^self new entity: anEntity node: aNode links: anEntity links 
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:26'
}
HookGenerator class>>node: aNode [
	^self entity: aNode node: aNode
]

{
	#category : #results,
	#timestamp : ' 8/31/2017 07:16:26'
}
HookGenerator>>afterHooks [
	| statements |
	statements := links 
			select: [ :each | each control = #after ] 
			thenCollect:  [ :link | (self hookFor: link) parent: node].
			
	^(RBBlockNode body: (RBSequenceNode statements: statements flattened)) parent: node.
]

{
	#category : #results,
	#timestamp : ' 8/31/2017 07:16:26'
}
HookGenerator>>beforeHooks [
	^links 
			select: [ :each | each control = #before ] 
			thenCollect:  [ :link | (self hookFor: link) parent: node] 
]

{
	#category : #'ast manipulation',
	#timestamp : ' 8/31/2017 07:16:26'
}
HookGenerator>>encloseInBlock: nodeOrCollection [
	"Creates a new block node from a node or a list of nodes"
	^ RBBlockNode body: nodeOrCollection asSequenceNode
]

{
	#category : #initialize,
	#timestamp : ' 8/31/2017 07:16:26'
}
HookGenerator>>entity: anEntity node: aNode links: aCollection [
	plugins := Dictionary new.
	node := aNode.
	entity := anEntity.
	links := aCollection.
	
	"register all the plugins that can reify information for this node"
	RFReification subclasses do: [:plugin |
		(plugin entities anySatisfy: [:class | entity isKindOf: class])	 ifTrue: [
			plugins at: plugin key put: plugin]
		].

]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:26'
}
HookGenerator>>genReification: aSymbolOrNode for: aLink [
	| plugin | 
	aSymbolOrNode isSymbol not ifTrue: [ ^ aSymbolOrNode]. 
	plugin := (plugins at: aSymbolOrNode ifAbsent: [self error: 'reification not supported for this entity']) entity: entity link: aLink.	
	 ^plugin perform: self selectorForNode
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:26'
}
HookGenerator>>generateArguments: aMetalink [
	| arguments |
	
	arguments := aMetalink arguments collect: [: each | self genReification: each for: aMetalink].
	(self hasOption: #argsAsArray for: aMetalink) ifTrue: 
		[ ^RBArrayNode statements: arguments ].
	^arguments
]

{
	#category : #options,
	#timestamp : ' 8/31/2017 07:16:26'
}
HookGenerator>>hasOption: aSymbol for: aLink [
	"take the class and method overrides to options into account"
	^(node methodNode optionsFor: aLink) includes: aSymbol.
]

{
	#category : #results,
	#timestamp : ' 8/31/2017 07:16:26'
}
HookGenerator>>hook [
	^RBSequenceNode statements: (links collect:  [ :link | self hookFor: link ]). 
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:26'
}
HookGenerator>>hookFor: aLink [
	| receiver hook arguments |
	
	(self hasOption: #optionDisabledLink for: aLink) ifTrue: [ ^RBSequenceNode new ].
	
	receiver := aLink metaObject isSymbol 
		ifTrue: [ self genReification: aLink metaObject for: aLink ]
		ifFalse: [  
			(self hasOption: #optionInlineMetaObject for: aLink)
				ifTrue: [RFLiteralVariableNode value: aLink metaObject]
				ifFalse: [RBMessageNode receiver: (RFLiteralVariableNode value: aLink)
											 selector: #metaObject ]].
	arguments := self generateArguments: aLink.
	
	hook := RFMessageNode 
		receiver: receiver
		selector: aLink selector 
		arguments: arguments.
	
	(self hasOption: #optionOneShot for: aLink) ifTrue: [
			hook := RBSequenceNode statements: {
				RBMessageNode
					receiver: (RFLiteralVariableNode value: aLink)
					selector: #uninstall.
				hook }].
	aLink hasCondition ifTrue: [hook := self wrapCondition: hook link: aLink].
	(aLink hasMetaLevel or: [self hasOption: #optionMetalevel for: aLink]) ifTrue: [hook := self wrapInContext: hook link: aLink].		
			
	^ hook
]

{
	#category : #results,
	#timestamp : ' 8/31/2017 07:16:26'
}
HookGenerator>>insteadHooks [
	| insteadLinks |
	insteadLinks := ((links select: [ :each | each control = #instead ])) asArray.
	insteadLinks isEmpty ifTrue: [ ^#()].
	^(self hookFor: insteadLinks last) parent: node 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:26'
}
HookGenerator>>links [
	^links
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:26'
}
HookGenerator>>plugins [
	^ plugins
]

{
	#category : #results,
	#timestamp : ' 8/31/2017 07:16:26'
}
HookGenerator>>preamble [
	| preamble |
	"Very simplistic now: needs to do some optimizatons"
	
	preamble := OrderedCollection new.
	links do: [:link |  
		plugins do: [ :plugin | (link allReifications includes: plugin key) ifTrue: [preamble addAll: ((plugin entity: entity link: link) preamble: entity)]].
		link control = #instead ifTrue: [
				"for instead links, the preamble needs to clean the stack. For now just implemented for message sends"
				entity isMessage ifTrue: [
					entity numArgs + 1 timesRepeat: [preamble add: (RFStorePopIntoTempNode named: #RFBalancestack)]]]].
	^preamble
]

{
	#category : #'ast manipulation',
	#timestamp : ' 8/31/2017 07:16:26'
}
HookGenerator>>selectorForNode [
	"The selector to be called on the Reification plugin"
	^('genFor' , entity class name) asSymbol.
]

{
	#category : #'ast manipulation',
	#timestamp : ' 8/31/2017 07:16:26'
}
HookGenerator>>wrapCondition: hook link: aLink [
	| linkBlock conditionExpression condSelector condArguments linkConditionArguments|
	
	condSelector := aLink condition valueSelector.
	linkConditionArguments  := aLink conditionArguments.
	condArguments := #().
	
	(condSelector numArgs > 0) ifTrue: [
			condArguments := OrderedCollection new.
			1 to: condSelector numArgs do: [:i |
				condArguments add: (self genReification: (linkConditionArguments at: i) for: aLink)]
	].
	
	linkBlock := self encloseInBlock: hook asSequenceNode.
	conditionExpression := RBMessageNode 
			receiver: ((self hasOption: #optionInlineCondition for: aLink)  
				ifTrue: [aLink condition asLiteralNode]
				ifFalse:[RBMessageNode receiver: (RBLiteralNode value: aLink)
											 selector: #condition ])
			selector: condSelector
			arguments: condArguments.
	^RFMessageNode
				receiver: conditionExpression
				selector: #ifTrue:
				arguments: {linkBlock}
]

{
	#category : #'ast manipulation',
	#timestamp : ' 8/31/2017 07:16:26'
}
HookGenerator>>wrapInContext: hook link: aLink [
	^RFMessageNode 
		receiver: aLink asLiteralNode
		selector: #valueInContext:
		arguments: {self encloseInBlock: hook}
				

	
]
