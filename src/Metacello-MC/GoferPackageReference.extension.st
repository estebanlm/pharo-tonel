Extension {
	#name : #GoferPackageReference
}

{
	#category : #'*metacello-mc',
	#timestamp : ' 8/31/2017 07:16:20'
}
GoferPackageReference>>metacelloPackageNameWithBranch [
    "answer array with package name and package name with branch name .. no branch name"

    ^ {(self packageName).
    (self packageName)}
]
