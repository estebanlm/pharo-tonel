"
I'm a major version.
"
Class {
	#name : #VSCommitMajorVersion,
	#superclass : #VSCommitVersion,
	#category : #Versionner-Commit,
	#timestamp : '<historical>'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:39'
}
VSCommitMajorVersion class>>label [
	^ 'Major'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:39'
}
VSCommitMajorVersion>>nextVersionOf: aProject [
	| version |
	version := self semanticVersionFor: aProject.
	^ '{1}.0' format: { 
		(version at: 1) + 1 }
]
