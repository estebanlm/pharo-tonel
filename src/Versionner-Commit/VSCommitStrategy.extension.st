Extension {
	#name : #VSCommitStrategy
}

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
