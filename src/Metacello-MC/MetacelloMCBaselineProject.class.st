"
The **MetacelloMCBaselineProject**  is a wrapper for the **BaselineOf** version specification for file-based repositories.

There is a single version in a **MetacelloMCBaselineProject**, named *'baseline'*.

A typical **BaselineOf** is specification:

```Smalltalk
baseline: spec
    <baseline>
    spec
        package: 'External-Core';
        package: 'External-Tests' with: [ spec requires: 'External-Core' ];
        yourself.
    spec
        group: 'Core' with: #('External-Core');
        group: 'default' with: #('Core');
        group: 'Tests' with: #('External-Tests');
        yourself
```

The `<baseline>` pragma marks the method containing the baseline specification.
"
Class {
	#name : #MetacelloMCBaselineProject,
	#superclass : #MetacelloMCProject,
	#category : #Metacello-MC-Model,
	#timestamp : 'dkh 5/5/2012 08:47'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloMCBaselineProject class>>singletonVersionName [
    ^ 'baseline'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloMCBaselineProject class>>versionConstructorClass [
    ^ MetacelloBaselineConstructor
]

{
	#category : #scripting,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloMCBaselineProject>>asBaselineProject [
    ^ self
]

{
	#category : #scripting,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloMCBaselineProject>>asConfigurationProject [
    ^ MetacelloMCProject new
]

{
	#category : #versions,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloMCBaselineProject>>bleedingEdge [
    ^ nil
]

{
	#category : #versions,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloMCBaselineProject>>currentVersion [
    ^ self version isSomethingLoaded
        ifTrue: [ self version ]
        ifFalse: [ nil ]
]

{
	#category : #versions,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloMCBaselineProject>>currentVersionAgainst: resolvedPackageAndProjectNames [
    ^ nil
]

{
	#category : #versions,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloMCBaselineProject>>development [
    ^ nil
]

{
	#category : #versions,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloMCBaselineProject>>hasVersion: versionString [
    ^ versionString = 'baseline'
]

{
	#category : #versions,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloMCBaselineProject>>lastVersion [
    ^ self version
]

{
	#category : #versions,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloMCBaselineProject>>latestVersion [
    ^ self version
]

{
	#category : #versions,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloMCBaselineProject>>latestVersion: blessing [
    ^ nil
]

{
	#category : #versions,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloMCBaselineProject>>latestVersionMatching: versionPatternString [
    ^ nil
]

{
	#category : #versions,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloMCBaselineProject>>latestVersionMatching: versionPatternString excludedBlessings: excluded [
    ^ nil
]

{
	#category : #versions,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloMCBaselineProject>>latestVersionMatching: versionPatternString includedBlessings: included [
    ^ nil
]

{
	#category : #versions,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloMCBaselineProject>>latestVersionMatching: versionPatternString includedBlessings: included excludedBlessings: excludedBlessings [
    ^ nil
]

{
	#category : #scripting,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloMCBaselineProject>>projectForScriptEngine: aMetacelloScriptEngine unconditionalLoad: aBool [
  "see https://github.com/dalehenrich/metacello-work/issues/244 ... uncoditionally load
   baseline"

  ^ aMetacelloScriptEngine getBaselineProjectUnconditionalLoad: true
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloMCBaselineProject>>setBaselineRepositoryDescription: aListOrRepositoryDescriptions [
    "set #version repositories to < aListOrRepositoryDescriptions>. Should be the directory where the BaselineOf is located."

    aListOrRepositoryDescriptions do: [:desc | self version spec repository: desc]
]

{
	#category : #versions,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloMCBaselineProject>>singletonVersionName [
    ^ self class singletonVersionName
]

{
	#category : #versions,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloMCBaselineProject>>stableVersion [
    ^ nil
]

{
	#category : #versions,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloMCBaselineProject>>symbolicVersionSymbols [
    ^ nil
]

{
	#category : #versions,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloMCBaselineProject>>version [
    ^ self version: self singletonVersionName
]

{
	#category : #versions,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloMCBaselineProject>>versions [
  ^ [ {(self version)} ]
    on: MetacelloVersionDoesNotExistError
    do: [ :ex | ^ #() ]
]
