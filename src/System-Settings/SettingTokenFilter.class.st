"
A SettingTokenFilter is SettingFilter which makes use of a token (substring) in order to keep or not a SettingHandler.


Instance Variables
	token:		<String>


"
Class {
	#name : #SettingTokenFilter,
	#superclass : #SettingFilter,
	#instVars : [
		'token'
	],
	#category : #System-Settings-Filter,
	#timestamp : 'alain.plantec 4/8/2009 13:03'
}

{
	#category : #filtering,
	#timestamp : ' 8/31/2017 05:26:16'
}
SettingTokenFilter>>keepSettingDeclaration: aSettingDeclaration [
	| selector |
	selector := (aSettingDeclaration respondsTo: #getSelector) 
		ifTrue: [aSettingDeclaration getSelector] ifFalse: [''].
	^ (({aSettingDeclaration name.  
		aSettingDeclaration label. 
		selector asUppercase. 
		aSettingDeclaration description}
				collect: [:e | (e ifNil: ['']) asUppercase])
				includesSubstringAnywhere: self token asUppercase)

]

{
	#category : #filtering,
	#timestamp : ' 8/31/2017 05:26:16'
}
SettingTokenFilter>>keepSettingTreeNode: aSettingNode  [
	^ (({aSettingNode methodClass name asUppercase. aSettingNode selector asUppercase}
			collect: [:e | e ifNil: ['']])
			includesSubstringAnywhere: self token asUppercase)
		or: [self keepSettingDeclaration: aSettingNode settingDeclaration]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:16'
}
SettingTokenFilter>>token [
	"Answer the value of token"

	^ token
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:16'
}
SettingTokenFilter>>token: aString [
	"Set the value of token"

	token := aString
]
