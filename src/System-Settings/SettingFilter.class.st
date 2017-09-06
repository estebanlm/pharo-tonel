"
A SettingFilter is a filter wich is used by a SettingBrowser in order to select which nodes of the setting trees are to be shown. A SettingFilter subclass must redefine the #keepHandler: method which return true if the argument handler is to be kept.

Instance Variables

"
Class {
	#name : #SettingFilter,
	#superclass : #Object,
	#category : #System-Settings-Filter,
	#timestamp : 'alain.plantec 4/8/2009 12:51'
}

{
	#category : #filtering,
	#timestamp : ' 8/31/2017 05:26:16'
}
SettingFilter>>keepSettingTreeNode: aSettingNode  [
	^ false
]
