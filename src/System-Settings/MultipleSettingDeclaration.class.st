"
A declaration for multiple settings
"
Class {
	#name : #MultipleSettingDeclaration,
	#superclass : #SettingDeclaration,
	#instVars : [
		'domainValues'
	],
	#category : #System-Settings-Core,
	#timestamp : 'TorstenBergmann 1/31/2014 10:30'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:16'
}
MultipleSettingDeclaration>>domainValues [
	^ domainValues ifNil: [domainValues := OrderedCollection new]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:16'
}
MultipleSettingDeclaration>>domainValues: aCollection  [
	domainValues := aCollection asArray collect: [ :v | v settingFixedDomainValueNodeFrom: self]
]

{
	#category : #'user interface',
	#timestamp : ' 8/31/2017 05:26:16'
}
MultipleSettingDeclaration>>domainValuesLabels [
	^ self domainValues
		collect: [:f | f name]
]

{
	#category : #'user interface',
	#timestamp : ' 8/31/2017 05:26:16'
}
MultipleSettingDeclaration>>fixedDomainValueNodeForAssociation: anAssociation  [
	| s |
	^ (s := (SettingDeclaration new name: anAssociation key translated))
		target: s;
		selector: #default;
		default: anAssociation value
]

{
	#category : #'user interface',
	#timestamp : ' 8/31/2017 05:26:16'
}
MultipleSettingDeclaration>>fixedDomainValueNodeForObject: anObject  [
	| s |
	^ (s := (SettingDeclaration new name: anObject asString))
		target: s;
		selector: #default;
		default: anObject
]

{
	#category : #'user interface',
	#timestamp : ' 8/31/2017 05:26:16'
}
MultipleSettingDeclaration>>hasEditableList [
	^ false
]
