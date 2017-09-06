"
I'm a kind of cache for versions and filenames of packages.
"
Class {
	#name : #MCPackageCache,
	#superclass : #Object,
	#instVars : [
		'sorter',
		'fileNames'
	],
	#category : #Monticello-Repositories,
	#timestamp : 'LaurentLaffont 3/31/2011 21:06'
}

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCPackageCache>>initialize [
	super initialize.
	sorter := MCVersionSorter new.
	fileNames := Dictionary new.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCPackageCache>>recordVersionInfo: aVersionInfo forFileNamed: aString [
	fileNames at: aVersionInfo put: aString.
	sorter addVersionInfo: aVersionInfo
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCPackageCache>>versionInfos [
	^ sorter sortedVersionInfos 
]
