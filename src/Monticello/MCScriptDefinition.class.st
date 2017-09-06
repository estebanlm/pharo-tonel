"
Common superclass for script definitions
"
Class {
	#name : #MCScriptDefinition,
	#superclass : #MCDefinition,
	#instVars : [
		'script',
		'packageName'
	],
	#category : #Monticello-Modeling,
	#timestamp : 'TorstenBergmann 2/5/2014 13:46'
}

{
	#category : #instance-creation,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCScriptDefinition class>>from: aPackageInfo [
	^ self script: (aPackageInfo perform: self scriptSelector) contents asString packageName: aPackageInfo name
]

{
	#category : #instance-creation,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCScriptDefinition class>>script: aString packageName: packageString [
	^ self instanceLike: (self new initializeWithScript: aString packageName: packageString)
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCScriptDefinition class>>scriptSelector [
	self subclassResponsibility
]

{
	#category : #instance-creation,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCScriptDefinition class>>scriptSelector: selectorString script: aString packageName: packageString [
	^ (self subclassForScriptSelector: selectorString)
		script: aString packageName: packageString
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCScriptDefinition class>>subclassForScriptSelector: selectorString [
	^self allSubclasses detect: [:ea | ea scriptSelector = selectorString]
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCScriptDefinition>>= aDefinition [
	^ (super = aDefinition)
		and: [script = aDefinition script]
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCScriptDefinition>>accept: aVisitor [
	aVisitor visitScriptDefinition: self
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCScriptDefinition>>description [
	^ Array with: packageName with: self scriptSelector
]

{
	#category : #installing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCScriptDefinition>>evaluate [
	self class compiler evaluate: script
]

{
	#category : #initializing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCScriptDefinition>>initializeWithScript: aString packageName: packageString [
	script := aString.
	packageName := packageString
]

{
	#category : #installing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCScriptDefinition>>installScript [
	self installScript: script
]

{
	#category : #installing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCScriptDefinition>>installScript: aString [
	| sel pi |
	sel := (self scriptSelector, ':') asSymbol.
	pi := self packageSet.
	(pi respondsTo: sel)
		ifTrue: [pi perform: sel with: aString]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCScriptDefinition>>isScriptDefinition [
	^true
]

{
	#category : #installing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCScriptDefinition>>load [
	self installScript
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCScriptDefinition>>packageName [
	^ packageName
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCScriptDefinition>>packageSet [
	^ RPackageSet named: packageName
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCScriptDefinition>>script [
	^ script
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCScriptDefinition>>scriptSelector [
	^ self class scriptSelector
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCScriptDefinition>>sortKey [
	^ '!', self scriptSelector "force to the front so it gets loaded first"
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCScriptDefinition>>source [
	^ script
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCScriptDefinition>>summary [
	^ packageName, ' ', self scriptSelector
]

{
	#category : #installing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCScriptDefinition>>unload [
	self installScript: nil
]
