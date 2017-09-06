"

"
Class {
	#name : #MCMczInstallerTest,
	#superclass : #MCTestCase,
	#instVars : [
		'expected',
		'diff'
	],
	#category : #Monticello-Tests,
	#timestamp : ''
}

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:31'
}
MCMczInstallerTest class>>isAbstract [
	^ (Smalltalk hasClassNamed: #MczInstaller) not
		
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:31'
}
MCMczInstallerTest class>>suite [
	^ (Smalltalk hasClassNamed: #MczInstaller)
		ifTrue: [ super suite ]
		ifFalse: [ self classForTestSuite new name: self name asString ]
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:31'
}
MCMczInstallerTest>>assertDict: dict matchesInfo: info [
	#(name id message date time author)
		do: [:sel |  (info perform: sel) ifNotNil: [:i | dict at: sel ifPresent: [:d | self assert: i = d]]].
	info ancestors 
			with: (dict at: #ancestors) 
			do: [:i :d | self assertDict: d matchesInfo: i]
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:31'
}
MCMczInstallerTest>>assertNoChange [
	| actual |
	actual := MCSnapshotResource takeSnapshot.
	diff := actual patchRelativeToBase: expected snapshot.
	self assert: diff isEmpty
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:31'
}
MCMczInstallerTest>>assertVersionInfoPresent [
	| dict info |
	dict := MczInstaller versionInfo at: self mockPackage name.
	info := expected info.
	self assertDict: dict matchesInfo: info.
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:31'
}
MCMczInstallerTest>>deleteFile [
	self fileName asFileReference ensureDelete
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:31'
}
MCMczInstallerTest>>fileName [
	^ 'InstallerTest.mcz'
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:31'
}
MCMczInstallerTest>>fileStream [
	^ FileStream forceNewFileNamed: self fileName.
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:31'
}
MCMczInstallerTest>>setUp [
	expected := self mockVersion.
	self change: #one toReturn: 2.
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:31'
}
MCMczInstallerTest>>tearDown [
	expected snapshot updatePackage: self mockPackage.
	self deleteFile.
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:31'
}
MCMczInstallerTest>>testInstallFromFile [
	MCMczWriter fileOut: expected on: self fileStream.
	MczInstaller installFileNamed: self fileName.
	self assertNoChange.
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:31'
}
MCMczInstallerTest>>testInstallFromStream [
	| stream |
	stream := RWBinaryOrTextStream on: String new.
	MCMczWriter fileOut: expected on: stream.
	MczInstaller installStream: stream reset.
	self assertNoChange.
	self assertVersionInfoPresent.
	
]
