"
A SettingRegexpFilter is SettingFilter which makes use of a regular expression in order to keep or not a SettingHandler.

Instance Variables
	regexp:		<String>

regexp
	- a regular expression string

"
Class {
	#name : #SettingRegexpFilter,
	#superclass : #SettingFilter,
	#instVars : [
		'regexp'
	],
	#category : #System-Settings-Filter,
	#timestamp : 'alain.plantec 4/8/2009 13:02'
}

{
	#category : #filtering,
	#timestamp : ' 8/31/2017 05:26:16'
}
SettingRegexpFilter>>keepSettingDeclaration: aSettingDeclaration [
	^ ({aSettingDeclaration name. aSettingDeclaration label. aSettingDeclaration description}
				collect: [:e | e ifNil: ['']])
				anySatisfy: [:token | token  matchesRegexIgnoringCase: self regexp]

]

{
	#category : #filtering,
	#timestamp : ' 8/31/2017 05:26:16'
}
SettingRegexpFilter>>keepSettingTreeNode: aSettingNode  [
	^ (({aSettingNode methodClass name. aSettingNode selector}
			collect: [:e | e ifNil: ['']])
			anySatisfy: [:token | token substrings anySatisfy: [:sub | sub matchesRegexIgnoringCase: self regexp]])
		or: [self keepSettingDeclaration: aSettingNode settingDeclaration] 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:16'
}
SettingRegexpFilter>>regexp [
	"Answer the value of regexp"

	^ regexp
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:16'
}
SettingRegexpFilter>>regexp: anObject [
	"Set the value of regexp"

	regexp := anObject
]
