Extension {
	#name : #MCRepository
}

{
	#category : #'*monticellofiletree-core',
	#timestamp : ' 8/31/2017 07:16:43'
}
MCRepository>>retrieveVersionsWithPackageNames: packageNames [
    ^ self readableFileNames
        collect: [ :each | 
            | name |
            name := (each copyUpToLast: $.) copyUpTo: $(.
            name last isDigit
                ifFalse: [ 
                    Array
                        with: name
                        with: ''
                        with: ''
                        with: each ]
                ifTrue: [ 
                    Array
                        with: (packageNames add: (name copyUpToLast: $-))
                        with: ((name copyAfterLast: $-) copyUpTo: $.)
                        with: ((name copyAfterLast: $-) copyAfter: $.) asInteger
                        with: each	"pkg name"	"user"	"version" ] ]
]
