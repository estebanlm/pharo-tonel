"
I am a singleton responsible for storing and loading settings on a disk. I can handle a collection of settings or one setting in particular. I know where settings are stored.

External Collaborators (those that use me): SettingNode, SettingBrowser.

Internal Collaborators (those I use): SettingsStonReader, SettingsStonWriter, StoredSettingsFactory, StoredSettingsMerger

Public API and Key Messages

- updateSettingNodes:
- storeSettingNodes:
- storedValueForSettingNode:
- accessing instance: SystemSettingsPersistence default

Internal Representation and Key Implementation Points.

    Instance Variables
	fileReference:		<FileReference>
	settingTree:		<SettingTree>

"
Class {
	#name : #SystemSettingsPersistence,
	#superclass : #Object,
	#instVars : [
		'fileReference',
		'settingTree'
	],
	#classInstVars : [
		'lastSettingsComputerID'
	],
	#category : #System-Settings-Persistence-Ston-Core,
	#timestamp : 'JurajKubelka 10/5/2015 22:02'
}

{
	#category : #cleanup,
	#timestamp : ' 8/31/2017 05:26:16'
}
SystemSettingsPersistence class>>cleanUp [
	lastSettingsComputerID := nil.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:16'
}
SystemSettingsPersistence class>>default [
	^ self new
		fileReference: self defaultPreferenceFileReference;
		settingTree: SettingBrowser new treeHolder;
		yourself
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:16'
}
SystemSettingsPersistence class>>defaultPreferenceFileReference [
	^ StartupPreferencesLoader preferencesVersionFolder / 'system-settings.ston'
]

{
	#category : #deleting,
	#timestamp : ' 8/31/2017 05:26:16'
}
SystemSettingsPersistence class>>deleteSettingNode: aSettingNode  [
	self default deleteSettingNode: aSettingNode 
]

{
	#category : #'class initialization',
	#timestamp : ' 8/31/2017 05:26:16'
}
SystemSettingsPersistence class>>initialize [
	"in order to update settings at startup.
	shoudl be register at the end of standard classes but before user classes"
	
	"IMPORTANT: do not uncomment the registration to the session manager!
	For now, SystemSettingsPersistence is handled directly by the command line handler startup.
	We should define a startup action parsing command line arguments and able to provide them to other startup actions. Then, SystemSettingsPersistence as well as StartupPreferencesLoader, could be independent startup actions."
	"SessionManager default
		registerBeforeUserClass: self"
]

{
	#category : #'system startup',
	#timestamp : ' 8/31/2017 05:26:16'
}
SystemSettingsPersistence class>>resumeSystemSettings [
	"Load persisted settings if the last settings were not loaded from this machine"
	| thisComputerID |
	
	thisComputerID := GlobalIdentifier uniqueInstance computerUUID.
	lastSettingsComputerID ~= thisComputerID ifTrue: [ 
		lastSettingsComputerID := thisComputerID.
		self updateSettingNodes ]
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:16'
}
SystemSettingsPersistence class>>settingTree: aSettingTree  [
	^ self new
		fileReference: self defaultPreferenceFileReference;
		settingTree: aSettingTree;
		yourself
]

{
	#category : #'system startup',
	#timestamp : ' 8/31/2017 05:26:16'
}
SystemSettingsPersistence class>>startUp: resuming [
	resuming ifTrue: [ self resumeSystemSettings ]
]

{
	#category : #storing,
	#timestamp : ' 8/31/2017 05:26:16'
}
SystemSettingsPersistence class>>storeIdentifier: settingNodeIdentifierString [
	self default storeIdentifier: settingNodeIdentifierString
]

{
	#category : #storing,
	#timestamp : ' 8/31/2017 05:26:16'
}
SystemSettingsPersistence class>>storeSettingNode: aSettingNode  [
	self default storeSettingNode: aSettingNode
]

{
	#category : #storing,
	#timestamp : ' 8/31/2017 05:26:16'
}
SystemSettingsPersistence class>>storeSettingNodes [
	self default storeSettingNodes
]

{
	#category : #storing,
	#timestamp : ' 8/31/2017 05:26:16'
}
SystemSettingsPersistence class>>storeSettingNodes: aCollectionOfSettingNodes  [
	self default storeSettingNodes: aCollectionOfSettingNodes
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:16'
}
SystemSettingsPersistence class>>storedValueForSettingNode: aSettingNode  [
	^ self default storedValueForSettingNode: aSettingNode
]

{
	#category : #loading,
	#timestamp : ' 8/31/2017 05:26:16'
}
SystemSettingsPersistence class>>updateSettingNode: aSettingNode [
	self default updateSettingNode: aSettingNode
]

{
	#category : #loading,
	#timestamp : ' 8/31/2017 05:26:16'
}
SystemSettingsPersistence class>>updateSettingNodes [
	self default updateSettingNodes
]

{
	#category : #loading,
	#timestamp : ' 8/31/2017 05:26:16'
}
SystemSettingsPersistence class>>updateSettingNodes: aSettingNode [
	self default updateSettingNodes: aSettingNode
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:16'
}
SystemSettingsPersistence>>allStoredSettings [
	"Load all stored settings from the file preference."
	(self fileReference exists) 
		ifFalse: [ ^ #() ].
	^ SettingsStonReader new stream: self readStream; secureLoad.
]

{
	#category : #deleting,
	#timestamp : ' 8/31/2017 05:26:16'
}
SystemSettingsPersistence>>deleteSettingNode: aSettingNode  [
	self deleteSettingNodes: (Array with: aSettingNode)
]

{
	#category : #deleting,
	#timestamp : ' 8/31/2017 05:26:16'
}
SystemSettingsPersistence>>deleteSettingNodes: aCollection  [
	| storedSettings reducedStoredSettings |
	storedSettings := self storedSettingsForSettingNodes: aCollection.
	reducedStoredSettings := self allStoredSettings difference: storedSettings . 
	self storeExactStoredSettings: reducedStoredSettings
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:16'
}
SystemSettingsPersistence>>ensureFileReference [
	"It ensures that the parent directory exists."
	self fileReference parent ensureCreateDirectory.
	^ self fileReference
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:16'
}
SystemSettingsPersistence>>fileReference [
	"Reference to a file with preferences."
	^ fileReference
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:16'
}
SystemSettingsPersistence>>fileReference: aFileReference [
	"Reference to a file with preferences."
	fileReference := aFileReference
]

{
	#category : #storing,
	#timestamp : ' 8/31/2017 05:26:16'
}
SystemSettingsPersistence>>mergeStoredSettings: aCollectionOfStoredSettings [
	^ StoredSettingsMerger new
		addStoredSettings: self allStoredSettings;
		addStoredSettings: aCollectionOfStoredSettings;
		storedSettings
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:16'
}
SystemSettingsPersistence>>nodeNamed: aString  [
	^ self settingTree nodeNamed: aString
]

{
	#category : #streams,
	#timestamp : ' 8/31/2017 05:26:16'
}
SystemSettingsPersistence>>readStream [
	^ self fileReference readStream
]

{
	#category : #storing,
	#timestamp : ' 8/31/2017 05:26:16'
}
SystemSettingsPersistence>>removeFileReference [
	"We have to remove the file before writing new settings."
	| newFileReference |
	fileReference exists ifFalse: [ ^ self ].
	newFileReference := (fileReference withExtension: 'old.txt').
	newFileReference ensureDelete.
	fileReference copy renameTo: newFileReference basename.
]

{
	#category : #enumerating,
	#timestamp : ' 8/31/2017 05:26:16'
}
SystemSettingsPersistence>>settingNodeForStoredSetting: aStoredSetting [
	^ self settingTree nodeList detect: [ :eachSettingNode |
		aStoredSetting isForSettingNode: eachSettingNode ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:16'
}
SystemSettingsPersistence>>settingTree [
	^ settingTree
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:16'
}
SystemSettingsPersistence>>settingTree: aSettingTree  [
	settingTree := aSettingTree 
]

{
	#category : #enumerating,
	#timestamp : ' 8/31/2017 05:26:16'
}
SystemSettingsPersistence>>settingsNodesFromIdentifiers: aCollection  [
	^ aCollection 
			collect: [ :eachIdentifier |
				self settingTree deeplyDetect: [ :eachSettingNode |
					eachSettingNode settingNodeIdentifier = eachIdentifier ] ]
			thenReject: #isNil
]

{
	#category : #storing,
	#timestamp : ' 8/31/2017 05:26:16'
}
SystemSettingsPersistence>>storeExactStoredSettings: allStoredSettings [
	self removeFileReference.
	SettingsStonWriter new
		stream: self writeStream;
		addSettings: allStoredSettings;
		store
]

{
	#category : #storing,
	#timestamp : ' 8/31/2017 05:26:16'
}
SystemSettingsPersistence>>storeIdentifier: settingNodeIdentifierString [
	"It stores one setting, identifier by settingNodeIdentifierString, on the disk."
	self storeIdentifiers: (Array with: settingNodeIdentifierString)
]

{
	#category : #storing,
	#timestamp : ' 8/31/2017 05:26:16'
}
SystemSettingsPersistence>>storeIdentifiers: aCollectionOfSettingNodeIdentifiers [
	"It stores one setting, identifier by settingNodeIdentifierString, on the disk."
	| settingNodes |
	settingNodes := self settingsNodesFromIdentifiers: aCollectionOfSettingNodeIdentifiers.
	self storeSettingNodes: settingNodes
]

{
	#category : #storing,
	#timestamp : ' 8/31/2017 05:26:16'
}
SystemSettingsPersistence>>storeSettingNode: aSettingNode [
	"It stores one setting on the disk."
	self storeSettingNodes: (Array with: aSettingNode)
]

{
	#category : #storing,
	#timestamp : ' 8/31/2017 05:26:16'
}
SystemSettingsPersistence>>storeSettingNodes [
	self storeSettingNodes: self settingTree nodeList.
]

{
	#category : #storing,
	#timestamp : ' 8/31/2017 05:26:16'
}
SystemSettingsPersistence>>storeSettingNodes: aCollectionOfSettingNodes [
	"It stores a collection of settings on the disk."
	| storedNodes |
	storedNodes := StoredSettingsFactory new fromSettingNodes: aCollectionOfSettingNodes.
	self storeStoredSettings: storedNodes.
]

{
	#category : #storing,
	#timestamp : ' 8/31/2017 05:26:16'
}
SystemSettingsPersistence>>storeStoredSettings: aCollectionOfStoredSettings [
	"It stores a collection of settings on the disk."
	| allStoredSettings |
	allStoredSettings := self mergeStoredSettings: aCollectionOfStoredSettings.
	self storeExactStoredSettings: allStoredSettings
]

{
	#category : #enumerating,
	#timestamp : ' 8/31/2017 05:26:16'
}
SystemSettingsPersistence>>storedSettingForSettingNode: aSettingNode [
	"It returns a stored setting for the setting node."
	^ self allStoredSettings 
				detect: [ :eachStoredSetting | 
					eachStoredSetting isForSettingNode: aSettingNode ]
				ifNone: [ nil ]
]

{
	#category : #enumerating,
	#timestamp : ' 8/31/2017 05:26:16'
}
SystemSettingsPersistence>>storedSettingsForSettingNodes: aCollectionOfSettingNodes [
	"It returns stored settings for the setting nodes."
	^ self allStoredSettings 
				select: [ :eachStoredSetting | 
					aCollectionOfSettingNodes anySatisfy: [ :eachSettingNode |
						eachStoredSetting isForSettingNode: eachSettingNode ] ]
]

{
	#category : #loading,
	#timestamp : ' 8/31/2017 05:26:16'
}
SystemSettingsPersistence>>storedValueForSettingNode: aSettingNode [
	"It returns a stored value for the setting node.
	It returns nil value when there is no stored value."
	^ (self storedSettingForSettingNode: aSettingNode) ifNotNil: #realValue
]

{
	#category : #loading,
	#timestamp : ' 8/31/2017 05:26:16'
}
SystemSettingsPersistence>>updateSettingNode: aSettingNode [
	self updateSettingNodes: (Array with: aSettingNode)
]

{
	#category : #loading,
	#timestamp : ' 8/31/2017 05:26:16'
}
SystemSettingsPersistence>>updateSettingNodes [
	self updateSettingNodes: self settingTree nodeList
]

{
	#category : #loading,
	#timestamp : ' 8/31/2017 05:26:16'
}
SystemSettingsPersistence>>updateSettingNodes: aCollectionOfSettingNodes [
	| storedSettings |
	storedSettings := self allStoredSettings.
	aCollectionOfSettingNodes do: [ :eachSettingNode |
		storedSettings 
			detect: [ :eachStoredSetting | eachStoredSetting isForSettingNode: eachSettingNode ]
			ifFound: [ :storedSetting | storedSetting updateSettingNode: eachSettingNode ]
			ifNone: [ "ignore it" ] ]
]

{
	#category : #streams,
	#timestamp : ' 8/31/2017 05:26:16'
}
SystemSettingsPersistence>>writeStream [
	^ self ensureFileReference writeStream
]
