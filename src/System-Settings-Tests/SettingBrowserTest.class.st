"
A SettingBrowserTest is a test class for testing the behavior of SettingBrowser
"
Class {
	#name : #SettingBrowserTest,
	#superclass : #TestCase,
	#instVars : [
		'settingBrowser'
	],
	#category : #System-Settings-Tests,
	#timestamp : '<historical>'
}

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:47'
}
SettingBrowserTest>>testOpening [
	"Non-Regression Test related to https://pharo.fogbugz.com/f/cases/16138/WorldMenu-System-Settings-throws-DNU-Image-50217"
	settingBrowser := SettingBrowser open.
	settingBrowser close
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:47'
}
SettingBrowserTest>>testOpeningOnPackage [

	settingBrowser := SettingBrowser new changePackageSet: { (RPackageOrganizer default packageNamed: 'GT-Playground') }; open.
	settingBrowser close
]
