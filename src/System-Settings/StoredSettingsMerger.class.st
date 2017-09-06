"
I merge several stored settings together. If you ask me twice to store same stored settings, the last one wins. 

Collaborators: SystemSettingsPersistence

Public API and Key Messages

- addStoredSetting:
- addStoredSettings:
- storedSettings

   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.

    Instance Variables
	storedSettings:		<Collection of StoredSetting>

"
Class {
	#name : #StoredSettingsMerger,
	#superclass : #Object,
	#instVars : [
		'storedSettings'
	],
	#category : #System-Settings-Persistence-Ston-StoredSettings-Builder,
	#timestamp : 'JurajKubelka 10/1/2015 14:29'
}

{
	#category : #adding,
	#timestamp : ' 8/31/2017 05:26:16'
}
StoredSettingsMerger>>addStoredSetting: aSettingNode  [
	self storedSettings withIndexDo: [ :eachStoredNode :index | 
		eachStoredNode = aSettingNode ifTrue: [ ^ self storedSettings at: index put: aSettingNode ] ].
	^ self storedSettings add: aSettingNode
]

{
	#category : #adding,
	#timestamp : ' 8/31/2017 05:26:16'
}
StoredSettingsMerger>>addStoredSettings: aCollectionOfStoredSettings [
	aCollectionOfStoredSettings do: [ :eachStoredSetting |
		self addStoredSetting: eachStoredSetting ].
	^ aCollectionOfStoredSettings
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:16'
}
StoredSettingsMerger>>initialize [
	super initialize.
	storedSettings := OrderedCollection new.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:16'
}
StoredSettingsMerger>>storedSettings [
	^ storedSettings
]
