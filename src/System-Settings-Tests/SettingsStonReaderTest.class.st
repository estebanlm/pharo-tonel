"
A SettingsStonReaderTest is a test class for testing the behavior of SettingsStonReader
"
Class {
	#name : #SettingsStonReaderTest,
	#superclass : #TestCase,
	#instVars : [
		'reader'
	],
	#category : #System-Settings-Tests,
	#timestamp : '<historical>'
}

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:47'
}
SettingsStonReaderTest>>setUp [
	super setUp.
	reader := SettingsStonReader new.
	reader stream: (ReadStream on: String new)

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:47'
}
SettingsStonReaderTest>>testBasic [
	"Checking that no error occur"
	SettingsStonReader new load
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:47'
}
SettingsStonReaderTest>>testEmptyStream [
	self assert: reader stream contents isEmpty
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:47'
}
SettingsStonReaderTest>>testLoad [
	reader stream: MockSettings oneStoredSettingSTONString readStream.
	reader load.
	self assert: reader storedSettings notNil.
	self assert: reader storedSettings size equals: 1.
	self assert: reader storedSettings first realValue equals: true.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:47'
}
SettingsStonReaderTest>>testLoadNotExistingClassNameForRealValue [
	reader stream: MockSettings notExistingClassStoredSettingSTONString readStream.
	reader load.
	self assert: reader storedSettings notNil.
	self assert: reader storedSettings size equals: 1.
	self should: [  reader storedSettings first realValue ] raise: NotFound.
	reader storedSettings first updateSettingNode: nil.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:47'
}
SettingsStonReaderTest>>testLoadTwoObjects [
	reader stream: MockSettings twoStoredSettingsSTONString readStream.
	reader load.
	self assert: reader storedSettings notNil.
	self assert: reader storedSettings size equals: 2.
	self assert: reader storedSettings first realValue equals: false.
	self assert: reader storedSettings second realValue equals: 55.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:47'
}
SettingsStonReaderTest>>testNonExistingStoredSettingVariable [
	<expectedFailure>
	reader stream: MockSettings changedClassStoredSettingVariable readStream.
	reader load.
	self assert: SettingsStonReader new storedSettings isNil
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:47'
}
SettingsStonReaderTest>>testStoredSettingsIsNil [
	self assert: SettingsStonReader new storedSettings isNil
]
