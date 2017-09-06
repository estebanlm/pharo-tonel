"
An instance of FLHeader is serialized together with the orignal object graph to serialize. This header is useful to:

1) Attach additional state or metadata associated to the graph being serialized.
2) Attach pre and post materialization actions
"
Class {
	#name : #FLHeader,
	#superclass : #Object,
	#instVars : [
		'preMaterializationActions',
		'additionalObjects',
		'postMaterializationActions',
		'materialization'
	],
	#category : #Fuel-Core,
	#timestamp : '<historical>'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLHeader>>addPostMaterializationAction: aCleanBlockClosure [
	"The closure may (or not) have one parameter and it will be the materialization."
	aCleanBlockClosure isClean ifFalse: [ self error: 'Post materializaton actions have to be clean closures. For more details see method BlocKClosure >> #isClean' ].
	postMaterializationActions add: aCleanBlockClosure 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLHeader>>addPreMaterializationAction: aCleanBlockClosure [
	aCleanBlockClosure isClean ifFalse: [ self error: 'Pre materializaton actions have to be clean closures. For more details see method BlocKClosure >> #isClean' ].
	preMaterializationActions add: aCleanBlockClosure 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLHeader>>additionalObjectAt: key [
	^ additionalObjects at: key
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLHeader>>at: key putAdditionalObject: anObject  [
	"This is useful if we want to attach objects to a package that will also be serialized. The way they are stored is key-value."
	additionalObjects at: key put: anObject
]

{
	#category : #executing,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLHeader>>executePostMaterializationActions [
	postMaterializationActions do: [:each | each cull: materialization]
]

{
	#category : #executing,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLHeader>>executePreMaterializationActions [
	preMaterializationActions do: [:each | each value]
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLHeader>>initialize [
	additionalObjects := IdentityDictionary new.
	preMaterializationActions := OrderedCollection new.
	postMaterializationActions := OrderedCollection new.
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLHeader>>isEmpty [
	^ preMaterializationActions isEmpty 
		and: [ postMaterializationActions isEmpty
		and: [ additionalObjects isEmpty ] ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLHeader>>materialization: aMaterialization [
	"This is just set once the materialization had happened"
	materialization := aMaterialization 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLHeader>>postMaterializationActions: listOfPostMaterializationActions [
	postMaterializationActions := listOfPostMaterializationActions.
	
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLHeader>>preMaterializationActions: listOfPreMaterializationActions [
	preMaterializationActions := listOfPreMaterializationActions.
	
]
