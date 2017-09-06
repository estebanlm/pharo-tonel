"
##MetacelloBaselineConstructor

**MetacelloBaselineConstructor** extracts the #baseline pragma from a **BaselineOfConfiguration** and produces a **MetacelloVersion**:.

```Smalltalk
MetacelloBaselineConstructor on: BaselineOfExample
```

"
Class {
	#name : #MetacelloBaselineConstructor,
	#superclass : #MetacelloAbstractVersionConstructor,
	#category : #Metacello-Core-Constructors,
	#timestamp : 'dkh 5/4/2012 17:05'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloBaselineConstructor class>>on: aConfig [
    ^ self new
        on: aConfig;
        yourself
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloBaselineConstructor class>>on: aConfig project: aProject [
    ^ self new
        on: aConfig project: aProject;
        yourself
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloBaselineConstructor>>calculate: aConfig project: aProject [
    | pragma versionMap versionSpec |
    self configuration: aConfig.
    pragma := self extractBaselinePragmaFor: aConfig class.
    self
        setProject:
            (aProject
                ifNil: [ 
                    [ aConfig class project ]
                        on: MessageNotUnderstood
                        do: [ :ex | ex return: nil ] ]).
    versionSpec := self project versionSpec.
    self root: versionSpec.
    self evaluatePragma: pragma.
    versionMap := Dictionary new.
    self project attributes
        do: [ :attribute | 
            | blockList |
            (blockList := self attributeMap at: attribute ifAbsent: [  ]) ~~ nil
                ifTrue: [ blockList do: [ :block | self with: versionSpec during: block ] ] ].
    versionSpec versionString: self project singletonVersionName.
    versionMap at: versionSpec versionString put: versionSpec createVersion.
    self project map: versionMap.
    self project configuration: aConfig
]

{
	#category : #'pragma extraction',
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloBaselineConstructor>>extractBaselinePragmaFor: aClass [
    | pragmas |
    pragmas := Pragma allNamed: #'baseline' in: aClass.
    pragmas isEmpty
        ifTrue: [ ^ self error: 'No #baseline pragma found' ].
    ^ pragmas first
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloBaselineConstructor>>on: aConfig [
    self calculate: aConfig project: nil
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloBaselineConstructor>>on: aConfig project: aProject [
    self calculate: aConfig project: aProject
]
