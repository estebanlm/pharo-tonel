"
I open commit tool to create a MAJOR version of target configuration.
"
Class {
	#name : #VSCommitMajorCommand,
	#superclass : #VSCommand,
	#category : #Versionner-Core-Commands,
	#timestamp : '<historical>'
}

{
	#category : #execute,
	#timestamp : ' 8/31/2017 05:26:38'
}
VSCommitMajorCommand>>execute [
	(VSCommitUnit major: target configurationClass) open
]

{
	#category : #ordering,
	#timestamp : ' 8/31/2017 05:26:38'
}
VSCommitMajorCommand>>order [
	"I want them to appear at the beginning, and in certain order"
	^ '03'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:38'
}
VSCommitMajorCommand>>title [
	^ 'commit major version'
]
