Extension {
	#name : #RPackage
}

{
	#category : #'*Monticello-RPackage',
	#timestamp : ' 8/31/2017 07:17:01'
}
RPackage>>isDirty [
	
	| mcp |
	
	mcp := MCPackage named: self name.

	^(MCWorkingCopy registry 
		at: mcp
		ifPresent: [ :item | item modified ]
		ifAbsent: [ false ])
]

{
	#category : #'*Monticello-RPackage',
	#timestamp : ' 8/31/2017 07:17:01'
}
RPackage>>mcPackage [
	"Normally the corresponding MCPackage should exist, but in certain cases it could happen that it does not"
	
	^ self mcWorkingCopy ifNotNil: [ :workingCopy | workingCopy package ].
	
]

{
	#category : #'*Monticello-RPackage',
	#timestamp : ' 8/31/2017 07:17:01'
}
RPackage>>mcWorkingCopy [
	
	^ MCWorkingCopy allManagers 
		detect: [ :each | each package name = name ]
		ifNone: [ nil ].
	
]
