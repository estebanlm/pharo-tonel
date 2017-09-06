"
I'm a patch version.

"
Class {
	#name : #VSCommitPatchVersion,
	#superclass : #VSCommitVersion,
	#category : #Versionner-Commit,
	#timestamp : '<historical>'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:39'
}
VSCommitPatchVersion class>>label [
	^ 'Patch'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:39'
}
VSCommitPatchVersion>>nextVersionOf: aProject [
	| version |
	version := self semanticVersionFor: aProject.
	^ '{1}.{2}.{3}' format: {
		(version at: 1). 
		(version at: 2). 
		(version at: 3) + 1 }
]
