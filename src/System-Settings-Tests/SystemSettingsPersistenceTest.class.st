"
A SystemSettingsTest is a test class for testing the behavior of SystemSettings
"
Class {
	#name : #SystemSettingsPersistenceTest,
	#superclass : #TestCase,
	#instVars : [
		'systemSettings',
		'memory',
		'preferences'
	],
	#category : #System-Settings-Tests,
	#timestamp : '<historical>'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:47'
}
SystemSettingsPersistenceTest>>booleanSettingNode [
	^ systemSettings nodeNamed: #booleanSetting
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:47'
}
SystemSettingsPersistenceTest>>rangeSettingNode [
	^ systemSettings nodeNamed: #rangeSetting
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:47'
}
SystemSettingsPersistenceTest>>setUp [
	super setUp.
	MockSettings cleanUp.
	memory := FileSystem memory.
	preferences := memory root / 'pharo' / 'pharoX.Y' / 'preferences.ston.txt'.
	systemSettings := SystemSettingsPersistence new.
	systemSettings 
		fileReference: preferences;
		settingTree: MockSettings settingTree.
	
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:47'
}
SystemSettingsPersistenceTest>>systemSettingNodeList [
	^ SettingBrowser new treeHolder nodeList.
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:47'
}
SystemSettingsPersistenceTest>>tearDown [
	super tearDown.
	MockSettings cleanUp.

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:47'
}
SystemSettingsPersistenceTest>>testAccessRealValues [
	"Ensure we can access all setting real values."
	self systemSettingNodeList do: [ :eachSettingNode | 
				eachSettingNode item hasValue and: [ eachSettingNode item realValue ] ].
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:47'
}
SystemSettingsPersistenceTest>>testAccessibleRealValues [
	"Ensure we can access all setting real values."
	self systemSettingNodeList do: [ :eachSettingNode |
		eachSettingNode settingDeclaration hasValue and: [ eachSettingNode settingDeclaration realValue ] ]
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:47'
}
SystemSettingsPersistenceTest>>testAllStoredSettings [
	"There is no preference file. It should not generate an error."
	self assert: systemSettings allStoredSettings isEmpty.
	systemSettings writeStream nextPutAll: 'random string'; close.
	self assert: systemSettings fileReference contents equals: 'random string'.
	self assert: systemSettings allStoredSettings isEmpty.

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:47'
}
SystemSettingsPersistenceTest>>testRealValueModification [
	self booleanSettingNode realValue: false.
	self rangeSettingNode realValue: 55.
	self assert: self booleanSettingNode realValue equals: false.
	self assert: self rangeSettingNode realValue equals: 55.

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:47'
}
SystemSettingsPersistenceTest>>testRealValues [
	self assert: (systemSettings nodeNamed: #booleanSetting) realValue equals: true.
	self assert: (systemSettings nodeNamed: #rangeSetting) realValue equals: 10.
	
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:47'
}
SystemSettingsPersistenceTest>>testSettingNodeIdentifierForChildNode [
	self assert: MockSettings cacheDirectorySettingNode settingNodeIdentifier equals: '#monticello#cacheDirectory'.
	
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:47'
}
SystemSettingsPersistenceTest>>testSettingNodeIdentifierForRootNode [
	self assert: MockSettings rangeSettingNode settingNodeIdentifier equals: '#rangeSetting'.	
]

{
	#category : #'tests - loading',
	#timestamp : ' 8/31/2017 05:26:47'
}
SystemSettingsPersistenceTest>>testStoreAndLoadAllSystemSettings [
	| searchCompiledMethod |
	systemSettings settingTree: SettingBrowser new treeHolder.
	systemSettings storeSettingNodes.
	systemSettings allStoredSettings do: #realValue.
	searchCompiledMethod := [ :aClass :aBlock | aClass compiledMethodAt: #= ifAbsent: [ aBlock value: aClass superclass value: aBlock ] ].
	systemSettings allStoredSettings do: [ :eachStoredSetting | | settingNode compiledMethod |
		settingNode := systemSettings settingNodeForStoredSetting: eachStoredSetting.
		self assert: eachStoredSetting realValue class equals: settingNode realValue class.
		compiledMethod := searchCompiledMethod value: eachStoredSetting realValue class value: searchCompiledMethod.
		compiledMethod methodClass == Object ifFalse: [ 
			self assert: eachStoredSetting realValue equals: settingNode realValue ] ].
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:47'
}
SystemSettingsPersistenceTest>>testStoreBooleanToSton [
	| node stored string stored2 |
	node := MockSettings booleanSettingNode.
	stored := StoredSettingsFactory new from: node.
	self assert: stored notNil.
	string := String streamContents: [ :aStream | | writer |
		writer := STON writer on: aStream; prettyPrint: true; yourself.
		writer writeObject: stored.
	].
	self assert: string notNil.
	stored2 := STON fromString: string. 
	self assert: stored2 notNil.
	self assert: stored2 equals: stored.
]

{
	#category : #'tests - storing',
	#timestamp : ' 8/31/2017 05:26:47'
}
SystemSettingsPersistenceTest>>testStoreIdentifier [
	self deny: preferences exists.
	systemSettings storeIdentifier: MockSettings booleanSettingNode settingNodeIdentifier.
	self assert: preferences exists.
	self assert: preferences size > 0.
	
]

{
	#category : #'tests - storing',
	#timestamp : ' 8/31/2017 05:26:47'
}
SystemSettingsPersistenceTest>>testStoreSettingNode [
	self deny: preferences exists.
	systemSettings storeSettingNode: MockSettings booleanSettingNode.
	self assert: preferences exists.
	self assert: preferences size > 0.
	
]

{
	#category : #'tests - storing',
	#timestamp : ' 8/31/2017 05:26:47'
}
SystemSettingsPersistenceTest>>testStoreSettingNodeTwice [
	| fileSize fullPath |
	self deny: preferences exists.
	fullPath := preferences fullPath.
	systemSettings storeSettingNode: MockSettings booleanSettingNode.
	self assert: preferences fullPath equals: fullPath.
	self assert: preferences exists.
	fileSize := preferences size.
	self assert: fileSize > 0.
	systemSettings storeSettingNode: MockSettings booleanSettingNode.
	self assert: preferences fullPath equals: fullPath.
	self assert: preferences size equals: fileSize.
]

{
	#category : #'tests - storing',
	#timestamp : ' 8/31/2017 05:26:47'
}
SystemSettingsPersistenceTest>>testStoreSettingNodes [
	self deny: preferences exists.
	self testRealValueModification.
	systemSettings storeSettingNodes: { 
		MockSettings booleanSettingNode.
		MockSettings rangeSettingNode }.
	self assert: preferences exists.
	self assert: preferences size > 0.
	self assert: preferences contents equals: MockSettings twoStoredSettingsSTONString

]

{
	#category : #'tests - storing',
	#timestamp : ' 8/31/2017 05:26:47'
}
SystemSettingsPersistenceTest>>testStoreTwoSettingNodeSeparately [
	| fileSize |
	self deny: preferences exists.
	systemSettings storeSettingNode: MockSettings booleanSettingNode.
	self assert: preferences exists.
	fileSize := preferences size.
	self assert: fileSize > 0.
	systemSettings storeSettingNode: MockSettings rangeSettingNode.
	self assert: preferences size > fileSize.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:47'
}
SystemSettingsPersistenceTest>>testStoredValueForSetting [
	| value |
	self testStoreSettingNode.
	value := systemSettings storedValueForSettingNode: MockSettings booleanSettingNode.
	self assert: value.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:47'
}
SystemSettingsPersistenceTest>>testStoredValueForSettingNoStoredValue [
	| value |
	value := systemSettings storedValueForSettingNode: MockSettings booleanSettingNode.
	self assert: value equals: nil.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:47'
}
SystemSettingsPersistenceTest>>testUniqueIdentifiers [
	| names |
	names := self systemSettingNodeList collect: #settingNodeIdentifier.
	self assert: names size equals: names asSet size.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:47'
}
SystemSettingsPersistenceTest>>testUniqueNames [
	| names |
	names := self systemSettingNodeList collect: [ :eachNode | 
						eachNode parentName printString, eachNode item name ].
	self assert: names size equals: names asSet size.
]

{
	#category : #'tests - loading',
	#timestamp : ' 8/31/2017 05:26:47'
}
SystemSettingsPersistenceTest>>testUpdateAllSettings [
	self testRealValues.
	self testRealValueModification.
	systemSettings storeSettingNodes.
	MockSettings cleanUp.
	self testRealValues.
	systemSettings updateSettingNodes.
	self assert: self booleanSettingNode realValue equals: false.
	self assert: self rangeSettingNode realValue equals: 55
]

{
	#category : #'tests - loading',
	#timestamp : ' 8/31/2017 05:26:47'
}
SystemSettingsPersistenceTest>>testWriteAndReadBoolean [
	| node stored string stored2 |
	node := MockSettings booleanSettingNode.
	stored := StoredSettingsFactory new from: node.
	self assert: stored notNil.
	string := String streamContents: [ :aStream | | writer |
		writer := STON writer on: aStream; prettyPrint: true; yourself.
		writer writeObject: stored.
	].
	self assert: string notNil.
	stored2 := STON fromString: string. 
	self assert: stored2 notNil.
	self assert: stored2 equals: stored.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:47'
}
SystemSettingsPersistenceTest>>testWriteStream [
	| writeStream |
	self deny: preferences exists.
	self deny: preferences parent exists.
	writeStream := systemSettings writeStream.
	self assert: writeStream isStream.
	self assert: writeStream isEmpty.
	writeStream close.
]
