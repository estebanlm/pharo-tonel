"
A SettingPackageFilter is a SettingFilter used to select settings from a given list of packages: a setting is kept only if the package in which it is defined is present in the given package list

Instance Variables
	packages:		<Collection>

packages
	- The collection of PackageInfo the filter is currently using
"
Class {
	#name : #SettingPackageFilter,
	#superclass : #SettingFilter,
	#instVars : [
		'packages'
	],
	#category : #System-Settings-Filter,
	#timestamp : 'AlainPlantec 12/31/2010 11:38'
}

{
	#category : #filtering,
	#timestamp : ' 8/31/2017 05:26:16'
}
SettingPackageFilter>>keepSettingTreeNode: aSettingNode  [
	| rp |
	^ (rp := aSettingNode receiverPackage) notNil and: [self packages includes: rp]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:16'
}
SettingPackageFilter>>packages [
	"Answer the value of packages"

	^ packages
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:16'
}
SettingPackageFilter>>packages: aCollectionOfPackageInfo [
	"Set the value of packages"

	packages := aCollectionOfPackageInfo

]
