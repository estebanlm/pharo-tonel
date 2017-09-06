"

"
Class {
	#name : #MetacelloAbstractConstructor,
	#superclass : #Object,
	#category : #Metacello-Core-Constructors,
	#timestamp : ''
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloAbstractConstructor>>configurationClass [

	^ self subclassResponsibility
]

{
	#category : #'pragma extraction',
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloAbstractConstructor>>extractAllVersionPragmas [

	| aDict |
	aDict := Dictionary new.
	self extractPragmas: #version: into: aDict.
	self extractPragmas: #version:imports: into: aDict.
	^aDict
]

{
	#category : #'pragma extraction',
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloAbstractConstructor>>extractCommonDefaultSymbolicVersionPragmas [

	| aDict |
	aDict := Dictionary new.
	self extractPragmas: #defaultSymbolicVersion: for: ConfigurationOf into: aDict.
	^aDict
]

{
	#category : #'pragma extraction',
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloAbstractConstructor>>extractDefaultSymbolicVersionPragmas [

	| aDict |
	aDict := Dictionary new.
	self extractPragmas: #defaultSymbolicVersion: into: aDict.
	^aDict
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloAbstractConstructor>>extractPragmas: pragmaKeyword for: aClass into: versionDict [

	| versionString  pragmas |
	(Pragma 
		allNamed: pragmaKeyword
		in: aClass) do: [:pragma |
			versionString := pragma argumentAt: 1.
			pragmas := versionDict 
				at: versionString 
				ifAbsent: [ | list |
					list := OrderedCollection new.
					versionDict at: versionString put: list.
					list ].
			pragmas add: pragma ].
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloAbstractConstructor>>extractPragmas: pragmaKeyword into: versionDict [

	^self extractPragmas: pragmaKeyword for: self configurationClass into: versionDict
]

{
	#category : #'pragma extraction',
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloAbstractConstructor>>extractSymbolicVersionPragmas [

	| aDict |
	aDict := Dictionary new.
	self extractPragmas: #symbolicVersion: into: aDict.
	^aDict
]

{
	#category : #'pragma extraction',
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloAbstractConstructor>>extractVersionImportPragmas [

	| aDict |
	aDict := Dictionary new.
	self extractPragmas: #version:imports: into: aDict.
	^aDict
]

{
	#category : #'pragma extraction',
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloAbstractConstructor>>extractVersionPragmas [

	| aDict |
	aDict := Dictionary new.
	self extractPragmas: #version: into: aDict.
	^aDict
]
