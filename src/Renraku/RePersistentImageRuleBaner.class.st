"
Same as the superclass but also saves the banned rule with a setting
"
Class {
	#name : #RePersistentImageRuleBaner,
	#superclass : #ReImageRuleBaner,
	#category : #Renraku-Utility,
	#timestamp : 'YuriyTymchuk 6/28/2017 13:08'
}

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:37'
}
RePersistentImageRuleBaner class>>ban: aCritique [

	super ban: aCritique.
	
	SystemSettingsPersistence storeIdentifier: 
		ReRuleManager ruleToggleGroupID printString,
		aCritique rule class enabledSettingID printString
		"printString to ensure symbol hash"
]

{
	#category : #properties,
	#timestamp : ' 8/31/2017 05:26:37'
}
RePersistentImageRuleBaner class>>reBanName [

	^ super reBanName, ' and future images'
]
