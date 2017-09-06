"
Window used to release a version.
You can specify the version number and ask for symbolic versions resolution.

self new openDialogWithSpec
"
Class {
	#name : #VersionnerReleasePanel,
	#superclass : #ComposableModel,
	#instVars : [
		'symbolicVersionResolutionCheckBox',
		'releaseNumber',
		'releaseNumberLabel',
		'developmentVersion'
	],
	#category : #Versionner-Spec-Browser,
	#timestamp : 'ChristopheDemarey 3/11/2014 17:32'
}

{
	#category : #spec,
	#timestamp : ' 8/31/2017 05:26:38'
}
VersionnerReleasePanel class>>defaultSpec [
	"Define the layout of the Release Panel"

	<spec>
	^ SpecLayout composed
		newColumn: [ :c | 
					c
						newRow: [ :r1 | 
									r1
										add: #releaseNumberLabel origin: 0@0 corner: 1@1;
										add: #releaseNumber origin: 0@40 corner: 1@100]
							height: self inputTextHeight;
						newRow: [ :r2 | 
									r2 add: #symbolicVersionResolutionCheckBox ]
							height: self inputTextHeight ];
		yourself
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:38'
}
VersionnerReleasePanel class>>openForVersion: developmentVersion [
	| releasePanel |
	
	releasePanel := self new.
	releasePanel developmentVersion: developmentVersion.
	^ releasePanel openDialogWithSpec
]

{
	#category : #confirmation,
	#timestamp : ' 8/31/2017 05:26:38'
}
VersionnerReleasePanel>>confirmSymbolicVersionResolutionDesactivation [
	(UIManager default confirm: 'Are you sure you do not want to resolve symbolic versions? It will lead to unreproductable loads.')
		ifFalse: [ symbolicVersionResolutionCheckBox state: true ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:38'
}
VersionnerReleasePanel>>developmentVersion: aVersion [
	developmentVersion := aVersion
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:38'
}
VersionnerReleasePanel>>initialExtent [
	^ 500 @ 140
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:38'
}
VersionnerReleasePanel>>initialVersion: aString [
	releaseNumber text: aString.
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:38'
}
VersionnerReleasePanel>>initializeWidgets [
	(releaseNumberLabel := self newLabel)
		label: 'Version number:'.
	(releaseNumber := self newTextInput)
		autoAccept: true.

	(symbolicVersionResolutionCheckBox := self newCheckBox)
		label: 'Resolve symbolic dependencies? (e.g. stable -> 3.0)';
		state: true;
		whenBuiltDo: [ symbolicVersionResolutionCheckBox labelOnLeft.
						releaseNumber accept: self nextVersionString ];
		whenDeactivatedDo: [ self confirmSymbolicVersionResolutionDesactivation ]
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:38'
}
VersionnerReleasePanel>>isSymbolicVersionResolutionChecked [
	^ symbolicVersionResolutionCheckBox state
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:38'
}
VersionnerReleasePanel>>latestVersionString [
	| latestVersion |
	
	latestVersion := (developmentVersion project versions 
		reject: [ :aVersion |  #(baseline broken) includes: aVersion blessing ])
		detectMax: [ :aVersion | aVersion ].
	^ latestVersion 
		ifNotNil:  [ latestVersion versionString ]
		ifNil: [ nil ] 
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:38'
}
VersionnerReleasePanel>>nextVersionString [
	^ self latestVersionString 
		ifNotNil:  [ :versionString | | lastPointIndex |
					lastPointIndex := versionString 
						lastIndexOf: $. 
						ifAbsent: [ nil ].
					lastPointIndex 
						ifNil: [ (versionString asInteger + 1) asString ]
						ifNotNil: [ | newMinorVersion |
								newMinorVersion := (versionString allButFirst: lastPointIndex) asInteger + 1.
								(versionString  copyFrom: 1 to: lastPointIndex) , (newMinorVersion asString) ] ]
		ifNil: [ '1.0' ] 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:38'
}
VersionnerReleasePanel>>releaseNumber [
	^ releaseNumber
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:38'
}
VersionnerReleasePanel>>releaseNumberLabel [
	^ releaseNumberLabel
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:38'
}
VersionnerReleasePanel>>releaseNumberText [
	^ releaseNumber text
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:38'
}
VersionnerReleasePanel>>symbolicVersionResolutionCheckBox [
	^ symbolicVersionResolutionCheckBox
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:38'
}
VersionnerReleasePanel>>title [
	^ 'Release a new version'
]
