"
MetacelloScriptExecutor decodes script args and launches MetacelloScriptEngine to run for each projectSpec encounters...i,e., primarily here to handl array and block args to configuration:, baseline: or project:.
"
Class {
	#name : #MetacelloScriptExecutor,
	#superclass : #Object,
	#instVars : [
		'options',
		'roots',
		'singleRoot',
		'projectSpecGenerator',
		'actionArg',
		'configurationArg',
		'baselineArg',
		'projectArg',
		'classNameArg',
		'versionArg',
		'repositoryArg'
	],
	#category : #Metacello-Core-Scripts,
	#timestamp : 'dkh 7/12/2012 14:49'
}

{
	#category : #execution,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloScriptExecutor>>applyArgsToProjectSpec: aProjectSpec [
    classNameArg ifNotNil: [ aProjectSpec className: classNameArg ].
    versionArg ifNotNil: [ aProjectSpec versionString: versionArg ].
    repositoryArg ifNotNil: [ aProjectSpec repository: repositoryArg ].
    ^ aProjectSpec
]

{
	#category : #args,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloScriptExecutor>>baselineArg [
	^ baselineArg
]

{
	#category : #args,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloScriptExecutor>>baselineArg: anObject [
	baselineArg := anObject
]

{
	#category : #'options api',
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloScriptExecutor>>cacheRepository: aRepositoryDescription [
    self options at: #'cacheRepository' put: aRepositoryDescription
]

{
	#category : #args,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloScriptExecutor>>classNameArg [
    ^ classNameArg
]

{
	#category : #args,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloScriptExecutor>>classNameArg: anObject [
    classNameArg := anObject
]

{
	#category : #args,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloScriptExecutor>>configurationArg [
    ^ configurationArg
]

{
	#category : #args,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloScriptExecutor>>configurationArg: anObject [
    configurationArg := anObject
]

{
	#category : #execution,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloScriptExecutor>>execute: statements [
  statements
    do: [ :assoc | 
      assoc value
        ifNil: [ self perform: assoc key ]
        ifNotNil: [ self perform: assoc key withArguments: assoc value ] ].
  projectSpecGenerator := self projectSpecGenerator.
  projectSpecGenerator target
    execute: [ :projectSpec | 
      | engine |
      engine := MetacelloScriptEngine new
        options: self options copy;
        projectSpec: projectSpec;
        yourself.
      engine perform: actionArg key withArguments: actionArg value.
      engine root ifNotNil: [ :root | self roots add: root ] ]
    against: self.
  ^ (self singleRoot and: [ self roots size == 1 ])
    ifTrue: [ self roots first ]
    ifFalse: [ self roots ]
]

{
	#category : #'execution callback',
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloScriptExecutor>>executeBlock: selectBlock do: projectSpecBlock [
    ((projectSpecGenerator projectSpecListBlock value select: selectBlock) select: self projectSpecSelectBlock)
        do: [ :projectSpec | projectSpecBlock value: (self applyArgsToProjectSpec: projectSpec copy) ]
]

{
	#category : #'execution callback',
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloScriptExecutor>>executeCollection: aCollection do: projectSpecBlock [
    aCollection
        do: [ :projectName | 
            ((projectSpecGenerator projectSpecLookupBlock value: projectName) select: self projectSpecSelectBlock)
                do: [ :projectSpec | projectSpecBlock value: (self applyArgsToProjectSpec: projectSpec copy) ] ]
]

{
	#category : #'execution callback',
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloScriptExecutor>>executeString: aString do: projectSpecBlock [
  singleRoot ifNil: [ self singleRoot: true ].
  ((projectSpecGenerator projectSpecLookupBlock value: aString)
    select: self projectSpecSelectBlock)
    do: [ :projectSpec | projectSpecBlock value: (self applyArgsToProjectSpec: projectSpec copy) ]
]

{
	#category : #'actions api',
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloScriptExecutor>>fetch: required [
    actionArg := #'fetch:' -> {required}
]

{
	#category : #'actions api',
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloScriptExecutor>>get [
    actionArg := #'get' -> #()
]

{
	#category : #'options api',
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloScriptExecutor>>ignoreImage: aBool [
    self options at: #'ignoreImage' put: aBool
]

{
	#category : #'actions api',
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloScriptExecutor>>list [
  actionArg := #'list' -> #().
  self singleRoot: false
]

{
	#category : #'actions api',
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloScriptExecutor>>load: required [
    actionArg := #'load:' -> {required}
]

{
	#category : #'actions api',
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloScriptExecutor>>lock [
    actionArg := #'lock' -> #()
]

{
	#category : #'options api',
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloScriptExecutor>>onConflict: aBlock [
    self options at: #'onConflict' put: aBlock
]

{
	#category : #'options api',
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloScriptExecutor>>onDowngrade: aBlock [
    self options at: #'onDowngrade' put: aBlock
]

{
	#category : #'options api',
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloScriptExecutor>>onLock: aBlock [
  self options at: #'onLock' put: aBlock
]

{
	#category : #'options api',
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloScriptExecutor>>onUpgrade: aBlock [
    self options at: #'onUpgrade' put: aBlock
]

{
	#category : #'options api',
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloScriptExecutor>>onWarning: aBlock [
  self options at: #'onWarning' put: aBlock
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloScriptExecutor>>options [
    options ifNil: [ options := Dictionary new ].
    ^ options
]

{
	#category : #args,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloScriptExecutor>>projectArg [
    ^ projectArg
]

{
	#category : #args,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloScriptExecutor>>projectArg: anObject [
    projectArg := anObject
]

{
	#category : #execution,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloScriptExecutor>>projectSpecGenerator [
    baselineArg
        ifNotNil: [ 
            configurationArg ifNotNil: [ self error: ' baseline: and configuration: are both be specified' ].
            projectArg ifNotNil: [ self error: ' baseline: and project are both be specified' ].
            ^ MetacelloBaselineSpecGenerator new
                target: baselineArg;
                yourself ].
    configurationArg
        ifNotNil: [ 
            baselineArg ifNotNil: [ self error: ' baseline: and configuration: are both be specified' ].
            projectArg ifNotNil: [ self error: ' configuration and project are both be specified' ].
            ^ MetacelloConfigurationSpecGenerator new
                target: configurationArg;
                yourself ].
    projectArg
        ifNotNil: [ 
            configurationArg ifNotNil: [ self error: ' project and configuration: are both be specified' ].
            baselineArg ifNotNil: [ self error: ' baseline: and project are both be specified' ].
            ^ MetacelloProjectSpecGenerator new
                target: projectArg;
                yourself ].
    self error: 'project, baseline, or configuration not specified'
]

{
	#category : #'execution callback',
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloScriptExecutor>>projectSpecSelectBlock [
    ^ [ :projectSpec | true ]
]

{
	#category : #'actions api',
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloScriptExecutor>>record: required [
    actionArg := #'record:' -> {required}
]

{
	#category : #'actions api',
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloScriptExecutor>>register [
  actionArg := #'register' -> #()
]

{
	#category : #args,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloScriptExecutor>>repositoryArg [
    ^ repositoryArg
]

{
	#category : #args,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloScriptExecutor>>repositoryArg: anObject [
    repositoryArg := anObject
]

{
	#category : #'options api',
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloScriptExecutor>>repositoryOverrides: aRepositoryDescriptionList [
    self options at: #'repositoryOverrides' put: aRepositoryDescriptionList
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloScriptExecutor>>roots [
    roots ifNil: [ roots := OrderedCollection new ].
    ^ roots
]

{
	#category : #'options api',
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloScriptExecutor>>silently: aBool [
    self options at: #'silently' put: aBool
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloScriptExecutor>>singleRoot [
  singleRoot ifNil: [ singleRoot := false ].
  ^ singleRoot
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloScriptExecutor>>singleRoot: aBool [
  singleRoot := aBool
]

{
	#category : #'actions api',
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloScriptExecutor>>unlock [
    actionArg := #'unlock' -> #()
]

{
	#category : #'actions api',
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloScriptExecutor>>unregister [
  actionArg := #'unregister' -> #()
]

{
	#category : #'options api',
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloScriptExecutor>>useCurrentVersion: aBool [
    "private option used to implement the classic mode"

    self options at: #'useCurrentVersion' put: aBool
]

{
	#category : #args,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloScriptExecutor>>versionArg [
    ^ versionArg
]

{
	#category : #args,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloScriptExecutor>>versionArg: anObject [
    versionArg := anObject
]
