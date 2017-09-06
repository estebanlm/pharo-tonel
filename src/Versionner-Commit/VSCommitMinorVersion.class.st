"
I'm a minor version.
"
Class {
	#name : #VSCommitMinorVersion,
	#superclass : #VSCommitVersion,
	#category : #Versionner-Commit,
	#timestamp : '<historical>'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:39'
}
VSCommitMinorVersion class>>label [
	^ 'Minor'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:39'
}
VSCommitMinorVersion>>nextVersionOf: aProject [
	| version |
	version := self semanticVersionFor: aProject.
	^ '{1}.{2}' format: {
		(version at: 1). 
		(version at: 2) + 1 }
]
