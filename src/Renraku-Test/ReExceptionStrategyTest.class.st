"

"
Class {
	#name : #ReExceptionStrategyTest,
	#superclass : #TestCase,
	#category : #Renraku-Test,
	#timestamp : ''
}

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:45'
}
ReExceptionStrategyTest>>testSettingDescription [

	ReExceptionStrategy allSubclassesDo: [ :strategy |
		self assert: (
			ReExceptionStrategy settingDescription
				includesSubstring: strategy strategyDescription) ]
]
