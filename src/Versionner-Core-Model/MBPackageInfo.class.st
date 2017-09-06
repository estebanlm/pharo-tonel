"
Infos about a package
"
Class {
	#name : #MBPackageInfo,
	#superclass : #MBAbstractPackageInfo,
	#category : #Versionner-Core-Model,
	#timestamp : 'TorstenBergmann 2/20/2014 14:12'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBPackageInfo class>>helpLabel [

	^'Package'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBPackageInfo>>basePackageName [
	^ self packageName copyUpToLast: #-
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBPackageInfo>>buildStringOrText [
	| string wc loadedPkgName attributes |
	string := super buildStringOrText.
	(wc := self workingCopy) isNil
		ifTrue: [ ^ string ].
	attributes := OrderedCollection new.
	wc ancestry ancestors notEmpty
		ifTrue: [ 
			loadedPkgName := wc ancestry ancestors first name.
			loadedPkgName = self name
				ifFalse: [ 
					(self compareWorkingCopyNamed: loadedPkgName using: #<=)
						ifTrue: [ attributes add: TextColor red ].
					attributes add: TextEmphasis bold ]].
	self isDirty
		ifTrue: [ attributes add: TextEmphasis underlined ].
	attributes notEmpty 
		ifTrue: [ ^ Text string: string attributes: attributes ].
	^ string
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBPackageInfo>>classForBrowsing [

	^self workingCopy packageInfo classes anyOne
]

{
	#category : #commands,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBPackageInfo>>cmdBrowsePackageHistory [
	<command>
	^ MBPackageHistoryCommand
	
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:38'
}
MBPackageInfo>>cmdLoad [
	<command>
	^ MBLoadPackageCommand.
]

{
	#category : #commands,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBPackageInfo>>cmdRevertPackage [
	<command>
	^ MBRevertPackageCommand
]

{
	#category : #commands,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBPackageInfo>>cmdSavePackage [
	<command>
	^ MBSavePackageCommand
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBPackageInfo>>compareWorkingCopyNamed: wcName using: comarisonOperator [
	| fileRef wcRef |
	fileRef := GoferResolvedReference name: self spec file.
	wcRef := GoferResolvedReference name: wcName.
	^ wcRef compare: fileRef using: comarisonOperator
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBPackageInfo>>currentVersionMismatch [
           | wc loadedPkgName |
           (wc := self workingCopy) isNil
                   ifTrue: [ ^ false ].
           wc ancestry ancestors isEmpty
                   ifTrue: [ ^ false ].
           loadedPkgName := wc ancestry ancestors first name.
           loadedPkgName = self name
                   ifTrue: [ ^false ].
            ^ true

]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBPackageInfo>>interestedInPackageNamed: aString [

	^aString beginsWith: self packageName
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:38'
}
MBPackageInfo>>mbPacakgeName [
	| string wc loadedPkgName attributes |
	string := ''.
	(wc := self workingCopy) isNil
		ifTrue: [ ^ string ].
	attributes := OrderedCollection new.
	wc ancestry ancestors notEmpty
		ifTrue: [ 
			loadedPkgName := wc ancestry ancestors first name.
			loadedPkgName = self name
				ifFalse: [ 
					(self compareWorkingCopyNamed: loadedPkgName using: #<=)
						ifTrue: [ attributes add: TextColor red ].
					attributes add: TextEmphasis bold ]].
	self isDirty
		ifTrue: [ attributes add: TextEmphasis underlined ].
	attributes notEmpty 
		ifTrue: [ ^ Text string: string attributes: attributes ].
	^ string
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBPackageInfo>>printOn: aStream [
	| wc |
	self isDirty
		ifTrue: [ aStream nextPutAll: '* ' ].
	(wc := self workingCopy) isNil
		ifTrue: [ 
			aStream
				nextPutAll: self packageName;
				nextPutAll: ' ---' ]
		ifFalse: [ 
			wc ancestry ancestors notEmpty
				ifTrue: [ 
					| loadedPkgName refString |
					loadedPkgName := wc ancestry ancestors first name.
					(refString := self extractPackageSignatureFrom: wc) notEmpty
						ifTrue: [ refString := '[' , refString , ']' ].
					loadedPkgName = self name
						ifTrue: [ aStream nextPutAll: self name ]
						ifFalse: [ 
							(self compareWorkingCopyNamed: loadedPkgName using: #<=)
								ifTrue: [ refString := Text string: refString attributes: TextColor red ].
							aStream
								nextPutAll: self name;
								nextPutAll: refString ] ] ]
]

{
	#category : #utils,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBPackageInfo>>repositories [
	"Return the repositories associated with the package."

	^self spec workingCopy repositoryGroup repositories
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBPackageInfo>>typeLabel [

	^'package'
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:38'
}
MBPackageInfo>>versions [
	""
	|wc v|
	(wc := self workingCopy) isNil
                   ifTrue: [ ^ #() ].
      ^ (wc ancestry breadthFirstAncestors) collect: [ : vi| vi].
]
