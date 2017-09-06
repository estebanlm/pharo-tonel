"

"
Class {
	#name : #MetacelloGoferPackage,
	#superclass : #GoferPackageReference,
	#instVars : [
		'packageFilename',
		'version',
		'workingCopy'
	],
	#category : #Metacello-MC-Gofer,
	#timestamp : ''
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloGoferPackage class>>name: aString packageFilename: packageFilename [
	^ self basicNew initializeName: aString packageFilename: packageFilename
]

{
	#category : #'package name matching',
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloGoferPackage class>>packageFileName: pkgFileName matchesPackageName: wcPkgName [
  ^ (pkgFileName beginsWith: wcPkgName)
    ifTrue: [ 
      pkgFileName size = wcPkgName size
        or: [ 
          (pkgFileName at: wcPkgName size + 1) = $-
            or: [ 
              (pkgFileName at: wcPkgName size + 1) = $.
                or: [ (pkgFileName at: wcPkgName size + 1) isDigit ] ] ] ]
    ifFalse: [ 
      pkgFileName size >= wcPkgName size
        ifTrue: [ ^ false ].
      (wcPkgName beginsWith: pkgFileName)
        ifFalse: [ ^ false ].
      ^ (wcPkgName at: pkgFileName size + 1) = $. ]
]

{
	#category : #querying,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloGoferPackage>>ancestors [

	| wc |
	(wc := self workingCopy) ~~ nil
		ifTrue: [ 
			wc ancestry ancestors isEmpty not
				ifTrue: [ ^wc ancestry ancestors ]].
	^nil
]

{
	#category : #querying,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloGoferPackage>>currentVersionInfo [

	| wc |
	(wc := self workingCopy) ~~ nil
		ifTrue: [ 
			wc ancestry ancestors isEmpty not
				ifTrue: [ ^wc ancestry ancestors first ]].
	^nil
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloGoferPackage>>findWorkingCopy [
	"Answer a working copy, or nil if the package is not loaded."

	| wcs |
	wcs := MCWorkingCopy allManagers select: [ :each | self matchesWorkingCopy: each ].
	wcs isEmpty ifTrue: [ ^nil ].
	^wcs detectMax: [:ea | ea package name size ]
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloGoferPackage>>initializeName: aString packageFilename: packagefilename [

	name := aString.
	packageFilename := packagefilename
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloGoferPackage>>matches: aLoadableReference [
  | pFilename |
  ((pFilename := self packageFilename) == nil
    or: [ self name = self packageFilename ])
    ifTrue: [ ^ super matches: aLoadableReference ].
  aLoadableReference name = pFilename
    ifTrue: [ ^ true ].
  (aLoadableReference name beginsWith: pFilename)
    ifFalse: [ ^ false ].
  ^ aLoadableReference matchesMetacelloGoferPackage: self
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloGoferPackage>>matchesMetacelloGoferPackage: aMetacelloGoferPackage [
  self
    error:
      'Should not be matching a MetacelloGoferPackage with another MetacelloGoferPackage'
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloGoferPackage>>matchesWorkingCopy: aWorkingCopy [
	"check that the working copy package name matches the package file name and that the first ancestor's package file name
	 matches the packageName"
	
	| pFilename |
	(pFilename := self packageFilename) == nil ifTrue: [ ^self error: 'cannot match working copy' ].
	(self class 
		packageFileName: pFilename 
		matchesPackageName: aWorkingCopy package name)
			ifTrue: [
				aWorkingCopy ancestry ancestors isEmpty ifTrue: [ ^true ].
				^self class 
					packageFileName: aWorkingCopy ancestry ancestors first name 
					matchesPackageName: self packageName ].
	^false
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloGoferPackage>>packageFilename [

	^packageFilename
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloGoferPackage>>workingCopy [
	
	workingCopy == nil ifTrue: [ workingCopy := self findWorkingCopy ].
	^workingCopy
]
