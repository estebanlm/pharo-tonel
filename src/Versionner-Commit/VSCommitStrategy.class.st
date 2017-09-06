"
I define the collection strategy for the commit: 

- should I commit dirty packages?
- should I commit projects?
- should I include nested projects?

By default, strategy is complete (yes, yes and yes), but users can change if it convinces them.

I'm included in a commit unit and I should not  be accessed outside it. 
"
Class {
	#name : #VSCommitStrategy,
	#superclass : #Object,
	#instVars : [
		'shouldCommitProjects',
		'shouldCommitNestedProjects',
		'shouldNestProjects',
		'shouldCommitDirtyPackages'
	],
	#category : #Versionner-Commit,
	#timestamp : 'EstebanLorenzano 4/28/2015 16:31'
}

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:39'
}
VSCommitStrategy>>initialize  [
	super initialize.
	shouldCommitDirtyPackages := true.
	shouldCommitProjects := true.
	shouldCommitNestedProjects := false.
	shouldNestProjects := true.
]

{
	#category : #'*Versionner-Commit-UI',
	#timestamp : ' 8/31/2017 05:26:39'
}
VSCommitStrategy>>options [
	^ {  
	{ 'Nest projects?'. 				#shouldNestProjects}.
	{ 'Commit projects?'. 			#shouldCommitProjects}.
	{ 'Commit all projects (even those not dirty)?'. 	#shouldCommitNestedProjects }.
	{ 'Commit dirty packages?'. 	#shouldCommitDirtyPackages} 
	}
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:39'
}
VSCommitStrategy>>shouldCommitDirtyPackages [
	^ shouldCommitDirtyPackages
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:39'
}
VSCommitStrategy>>shouldCommitDirtyPackages: anObject [
	shouldCommitDirtyPackages := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:39'
}
VSCommitStrategy>>shouldCommitNestedProjects [
	^ shouldCommitNestedProjects
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:39'
}
VSCommitStrategy>>shouldCommitNestedProjects: anObject [
	shouldCommitNestedProjects := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:39'
}
VSCommitStrategy>>shouldCommitProjects [
	^ shouldCommitProjects
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:39'
}
VSCommitStrategy>>shouldCommitProjects: anObject [
	shouldCommitProjects := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:39'
}
VSCommitStrategy>>shouldNestProjects [
	^ shouldNestProjects
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:39'
}
VSCommitStrategy>>shouldNestProjects: anObject [
	shouldNestProjects := anObject
]
