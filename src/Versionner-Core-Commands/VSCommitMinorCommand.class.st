"
I open commit tool to create a MINOR version of target configuration.
"
Class {
	#name : #VSCommitMinorCommand,
	#superclass : #VSCommand,
	#category : #Versionner-Core-Commands,
	#timestamp : '<historical>'
}

{
	#category : #execute,
	#timestamp : ' 8/31/2017 05:26:38'
}
VSCommitMinorCommand>>execute [
	(VSCommitUnit minor: target configurationClass) open
]

{
	#category : #ordering,
	#timestamp : ' 8/31/2017 05:26:38'
}
VSCommitMinorCommand>>order [
	"I want them to appear at the beginning, and in certain order"
	^ '02'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:38'
}
VSCommitMinorCommand>>title [
	^ 'commit minor version'
]
