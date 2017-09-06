"
I am a writer of system settings to a file (stream). I know how to write the settings into a stream.

Collaborators: SystemSettingsPersistence

Public API and Key Messages

- stream:
- store 

Internal Representation and Key Implementation Points.

    Instance Variables
	storedSettings:		<Array>
	stream:				<WriteStream>

"
Class {
	#name : #SettingsStonWriter,
	#superclass : #Object,
	#instVars : [
		'stream',
		'storedSettings'
	],
	#category : #System-Settings-Persistence-Ston-StoredSettings-Builder,
	#timestamp : 'JurajKubelka 10/1/2015 14:16'
}

{
	#category : #adding,
	#timestamp : ' 8/31/2017 05:26:16'
}
SettingsStonWriter>>addSetting: aStoredSetting [
	storedSettings add: aStoredSetting
]

{
	#category : #adding,
	#timestamp : ' 8/31/2017 05:26:16'
}
SettingsStonWriter>>addSettings: aCollectionOfStoredSettings [
	storedSettings addAll: aCollectionOfStoredSettings
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:16'
}
SettingsStonWriter>>initialize [
	super initialize.
	storedSettings := OrderedCollection new.
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:16'
}
SettingsStonWriter>>store [
	"Write the stored setting in the stream"

	stream ifNil: [ ^ self ].
	[ | writer |
	writer := STON writer
		on: stream;
		prettyPrint: true;
		asciiOnly: true;
		yourself.
	writer nextPut: storedSettings asArray ]
		ensure: [ stream close ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:16'
}
SettingsStonWriter>>stream [
	"Return the stream on which storedSettings are written in. 
	This method is useful for testing"
	^ stream
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:16'
}
SettingsStonWriter>>stream: aWriteStream  [
	stream := aWriteStream
]
