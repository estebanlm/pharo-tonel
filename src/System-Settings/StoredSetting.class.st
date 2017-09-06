"
I represent a part of SettingNode that can be stored to a preference file.

Responsibility: I keep SettingNode's stored value and I know to which SettingNode I belong.

Collaborators: 
 - SystemSettings manages all my instances, stores, load, and gives an appropriate stored value for any SettingNode.
 - StoredSettingBuilder creates instances of me.
 - I represent stored value of #realValue of a SettingNode object.

Public API and Key Messages
- realValue returns SettingNode's stored value.
- isForSettingNode: returns true if my instance belongs to a given SettingNode.
 
Internal Representation and Key Implementation Points.

    Instance Variables
	methodClass:		<Class>
	selector:			<Symbol>
	realValue:		<Object>

"
Class {
	#name : #StoredSetting,
	#superclass : #AbstractStoredSetting,
	#instVars : [
		'realValue'
	],
	#category : #System-Settings-Persistence-Ston-StoredSettings,
	#timestamp : 'JurajKubelka 6/20/2015 19:36'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:16'
}
StoredSetting>>realValue [
	^ realValue
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:16'
}
StoredSetting>>realValue: anObject [
	realValue := anObject
]
