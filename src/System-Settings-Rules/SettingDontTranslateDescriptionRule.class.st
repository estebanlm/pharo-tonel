"
When defining a description of a setting, you don't need to translate it, and this will be done by the setting itself.
"
Class {
	#name : #SettingDontTranslateDescriptionRule,
	#superclass : #ReNodeRewriteRule,
	#category : #System-Settings-Rules,
	#timestamp : 'YuriyTymchuk 11/3/2016 22:39'
}

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:47'
}
SettingDontTranslateDescriptionRule>>check: aNode forCritiquesDo: aBlock [

	aNode methodNode ifNotNil: [ :methNode |
		(self checkPreconditionOn: methNode) ifTrue: [
			super check: aNode forCritiquesDo: aBlock ] ]
]

{
	#category : #helpers,
	#timestamp : ' 8/31/2017 05:26:47'
}
SettingDontTranslateDescriptionRule>>checkPreconditionOn: aMethodNode [

	^ aMethodNode pragmas anySatisfy: [ :p |
		p selector = #systemsettings ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:47'
}
SettingDontTranslateDescriptionRule>>group [

	^ 'API Hints'
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:47'
}
SettingDontTranslateDescriptionRule>>initialize [
	super initialize.
	
	self
		replace: '`@recv description: `#str translated'
		with: '`@recv description: `#str'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:47'
}
SettingDontTranslateDescriptionRule>>name [

	^ 'Do not use #translated for setting''s description'
]
