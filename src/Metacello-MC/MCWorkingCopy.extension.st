Extension {
	#name : #MCWorkingCopy
}

{
	#category : #'*metacello-mc',
	#timestamp : ' 8/31/2017 07:16:20'
}
MCWorkingCopy>>metacelloPackageNameWithBranch [
	"answer array with package name and package name with branch name"
	ancestry ancestors isEmpty
		ifTrue: [ 
			^ {(package name).
			(package name)} ].
	^ (GoferVersionReference name: self ancestors first name) metacelloPackageNameWithBranch
]
