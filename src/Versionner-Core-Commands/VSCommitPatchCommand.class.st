"
I open commit tool to create a PATCH version of target configuration.
"
Class {
	#name : #VSCommitPatchCommand,
	#superclass : #VSCommand,
	#category : #Versionner-Core-Commands,
	#timestamp : '<historical>'
}

{
	#category : #execute,
	#timestamp : ' 8/31/2017 05:26:38'
}
VSCommitPatchCommand>>execute [
	(VSCommitUnit patch: target configurationClass) open
]

{
	#category : #ordering,
	#timestamp : ' 8/31/2017 05:26:38'
}
VSCommitPatchCommand>>order [
	"I want them to appear at the beginning, and in certain order"
	^ '01'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:38'
}
VSCommitPatchCommand>>title [
	^ 'commit patch version'
]
