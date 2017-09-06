"
I am responsible for creating new StoredSetting objects from existing SettingNodes. I know how to create a StoredSetting from a SettingNode.

Collaborators: SystemSettingsPersistence

Public API and Key Messages

- from:
- fromSettingNodes:
 
Internal Representation and Key Implementation Points.

    Instance Variables
	storedSetting:		<StoredSettings>
	storedSettings:		<Collection of StoredSettings>

"
Class {
	#name : #StoredSettingsFactory,
	#superclass : #Object,
	#instVars : [
		'storedSetting',
		'storedSettings'
	],
	#category : #System-Settings-Persistence-Ston-StoredSettings-Builder,
	#timestamp : 'JurajKubelka 10/1/2015 14:23'
}

{
	#category : #building,
	#timestamp : ' 8/31/2017 05:26:16'
}
StoredSettingsFactory>>from: aSettingNode  [
	storedSetting := nil.
	aSettingNode item acceptSettings: self. 
	storedSetting ifNotNil: [ 
		storedSetting settingNodeIdentifier: aSettingNode settingNodeIdentifier ].
	^ storedSetting
]

{
	#category : #building,
	#timestamp : ' 8/31/2017 05:26:16'
}
StoredSettingsFactory>>fromSettingNodes: aCollectionOfSettingNodes  [
	storedSettings := OrderedCollection new.
	aCollectionOfSettingNodes do: [ :eachSettingNode |
		(self from: eachSettingNode) ifNotNil: [ :aStoredNode | storedSettings add: aStoredNode ] ].
	^ storedSettings
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:16'
}
StoredSettingsFactory>>newAbsolutePathStoredSetting [
	^ storedSetting := AbsolutePathStoredSetting new
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:16'
}
StoredSettingsFactory>>newClassStoredSetting [
	^ storedSetting := ClassStoredSetting new.
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:16'
}
StoredSettingsFactory>>newFileLocatorStoreSetting [
	^ storedSetting := FileLocatorStoredSetting new
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:16'
}
StoredSettingsFactory>>newFileReferenceStoredSetting [
	^ storedSetting := AbsolutePathStoredSetting new
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:16'
}
StoredSettingsFactory>>newLogicalFontStoredSetting [
	^ storedSetting := LogicalFontStoredSetting new
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:16'
}
StoredSettingsFactory>>newRelativePathStoredSetting [
	^ storedSetting := RelativePathStoredSetting new
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:16'
}
StoredSettingsFactory>>newStoredSetting [
	^ storedSetting := StoredSetting new.
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:16'
}
StoredSettingsFactory>>newStrikeFontStoredSetting [
	^ storedSetting := StrikeFontStoredSetting new
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:16'
}
StoredSettingsFactory>>newThemeIconsStoredSetting [
	^ storedSetting := ThemeIconsStoredSetting new
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:16'
}
StoredSettingsFactory>>visitAbsolutePath: anAbsolutePath  [
	self newAbsolutePathStoredSetting realValue: anAbsolutePath segments
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:16'
}
StoredSettingsFactory>>visitAbstractFileReference: aFileReference  [
	aFileReference path acceptSettings: self.
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:16'
}
StoredSettingsFactory>>visitClass: aClass  [
	self newClassStoredSetting realValue: aClass name.
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:16'
}
StoredSettingsFactory>>visitFileLocator: aFileLocator  [
	self newFileLocatorStoreSetting 
			origin: aFileLocator origin;
			pathSegments: aFileLocator path segments 
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:16'
}
StoredSettingsFactory>>visitLogicalFont: aLogicalFont  [
	self newLogicalFontStoredSetting
		fontClassName: aLogicalFont class name;
		familyName: aLogicalFont familyName;
		fallbackFamilyNames: aLogicalFont fallbackFamilyNames;
		pointSize: aLogicalFont pointSize;
		stretchValue: aLogicalFont stretchValue;
		weightValue: aLogicalFont weightValue;
		slantValue: aLogicalFont slantValue.
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:16'
}
StoredSettingsFactory>>visitObject: anObject  [
	self newStoredSetting realValue: anObject
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:16'
}
StoredSettingsFactory>>visitPragmaSetting: aPragmaSetting  [
	"do nothing"
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:16'
}
StoredSettingsFactory>>visitRelativePath: aRelativePath  [
	self newRelativePathStoredSetting realValue: aRelativePath segments
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:16'
}
StoredSettingsFactory>>visitSettingDeclaration: aSettingDeclaration  [
	aSettingDeclaration realValue acceptSettings: self.
	
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:16'
}
StoredSettingsFactory>>visitStrikeFont: aStrikeFont  [
	self newStrikeFontStoredSetting 
			fontClassName: aStrikeFont class name;
			familyName: aStrikeFont familyName;
			pointSize: aStrikeFont pointSize;
			emphasized: aStrikeFont emphasis
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:16'
}
StoredSettingsFactory>>visitThemeIcons: aThemeIcons  [
	self newThemeIconsStoredSetting 
			name: aThemeIcons name;
			url: aThemeIcons url
]
