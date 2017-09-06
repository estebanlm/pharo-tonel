"
A slice info
"
Class {
	#name : #MCSliceInfo,
	#superclass : #Model,
	#instVars : [
		'includedPackages',
		'issue',
		'title'
	],
	#category : #MonticelloGUI,
	#timestamp : 'TorstenBergmann 2/20/2014 15:52'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCSliceInfo class>>namePrefix [
	^ 'SLICE-Issue-'
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCSliceInfo>>canMakePackage [

	^ self issueNumber isNotNil
		and: [title isEmptyOrNil not
		and: [self includedPackages isEmptyOrNil not]]
]

{
	#category : #'issue tracker',
	#timestamp : ' 8/31/2017 05:26:23'
}
MCSliceInfo>>downloadIssueTitle [
	^ self issue downloadTitle
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCSliceInfo>>includedPackages [

	^ includedPackages ifNil: [#()]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCSliceInfo>>includedPackages: aCollection [

	includedPackages := aCollection.
	self changed: #includedPackages.
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCSliceInfo>>initialize [
	super initialize.
	issue := NullPharoIssue new
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCSliceInfo>>issue [
	^ issue
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCSliceInfo>>issueNumber [
	^ self issue number
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCSliceInfo>>issueNumber: anInteger [
	issue := PharoIssue number: anInteger.
	self changed: #issueNumber
]

{
	#category : #slice-making,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCSliceInfo>>makeSlice [
	| workingCopy package |
	self canMakePackage ifFalse: [ ^ nil ].
	package := RPackageOrganizer default registerPackageNamed: self mcPackageName.
	workingCopy := package mcWorkingCopy.
	self includedPackages
		do: [:required | workingCopy requirePackage: required package].
	^ workingCopy
]

{
	#category : #accessing-MC,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCSliceInfo>>mcPackageName [
	^ self class namePrefix, self issueNumber asString, '-', self title.
]

{
	#category : #'input sanitizing',
	#timestamp : ' 8/31/2017 05:26:23'
}
MCSliceInfo>>sanitizeIssueNumberFromString: aString [
	^ aString select: [ :c | c isDigit ].
]

{
	#category : #'input sanitizing',
	#timestamp : ' 8/31/2017 05:26:23'
}
MCSliceInfo>>sanitizeIssueTitle: aString [
	| separators safeSeparator |
	safeSeparator := $-.
	separators := { Character space. Character tab. $_. safeSeparator }.
	^ String streamContents: [ :str | 
		aString do: [ :c |
			(separators includes: c) ifTrue: [ str nextPut: safeSeparator ].
			c isAlphaNumeric ifTrue: [ str nextPut: c ] ] ]
]

{
	#category : #'issue tracker',
	#timestamp : ' 8/31/2017 05:26:23'
}
MCSliceInfo>>setTitleFromIssue [
	| sanitizedIssueTitle |
	sanitizedIssueTitle := self sanitizeIssueTitle: self issue title.
	self title: sanitizedIssueTitle
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCSliceInfo>>title [
	^ title
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCSliceInfo>>title: aString [
	title := self sanitizeIssueTitle: aString.
	self changed: #title
]

{
	#category : #accessing-MC,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCSliceInfo>>workingCopy [
	^ (RPackage named: self mcPackageName) mcWorkingCopy
]
