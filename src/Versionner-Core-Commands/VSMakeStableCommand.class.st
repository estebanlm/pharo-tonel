"
I'm a command to declare versions as stable.
"
Class {
	#name : #VSMakeStableCommand,
	#superclass : #VSMakeVersionCommand,
	#category : #Versionner-Core-Commands,
	#timestamp : '<historical>'
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:38'
}
VSMakeStableCommand>>canBeApplied [
	^ target isStable not and: [ target isBaseline not ]
]

{
	#category : #execute,
	#timestamp : ' 8/31/2017 05:26:38'
}
VSMakeStableCommand>>execute [
	"I expect that target is an MCVersion"
	(MetacelloToolBox configurationNamed: self configurationClass name)
		symbolicVersionMethod: #stable;
		addSymbolicSection: #common version: target versionString;
		commitMethod.

	
	
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:38'
}
VSMakeStableCommand>>symbolicVersion  [
	^ #stable
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:38'
}
VSMakeStableCommand>>title [
	^ 'make stable version'
]
