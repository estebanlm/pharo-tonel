"
I'm a generic command for declare versions as stable or development.
"
Class {
	#name : #VSMakeVersionCommand,
	#superclass : #VSVersionCommand,
	#category : #Versionner-Core-Commands,
	#timestamp : '<historical>'
}

{
	#category : #execute,
	#timestamp : ' 8/31/2017 05:26:38'
}
VSMakeVersionCommand>>execute [
	"I expect that target is an MCVersion"
	(MetacelloToolBox configurationNamed: self configurationClass name)
		symbolicVersionMethod: self symbolicVersion;
		addSymbolicSection: #common version: target versionString;
		commitMethod.

	
	
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:38'
}
VSMakeVersionCommand>>symbolicVersion [
	self subclassResponsibility

	
	
]
