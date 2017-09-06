"
Used to launch a setting
"
Class {
	#name : #SystemSettingLauncher,
	#superclass : #PragmaSetting,
	#instVars : [
		'script'
	],
	#category : #System-Settings-Core,
	#timestamp : 'TorstenBergmann 1/31/2014 10:34'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:16'
}
SystemSettingLauncher>>defaultIcon [
	^ self iconNamed: #smallDoItIcon
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:16'
}
SystemSettingLauncher>>inputWidget [
	^ (self theme
		newButtonIn: World
		for: self
		getState: nil
		action: #launch
		arguments: {}
		getEnabled: nil
		getLabel: nil
		help: self description)
		label:
			(self theme
				newRowIn: World
				for:
					{(AlphaImageMorph new
						image: (self iconNamed: #smallRedoIcon)).
					(self theme buttonLabelForText: 'Launch' translated)});
		yourself
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:16'
}
SystemSettingLauncher>>launch [
	self script 
			ifNotNil: [:s | s isSymbol 
				ifTrue: [s numArgs = 0 
					ifTrue: [self settingReceiver perform: s]
					ifFalse: [self settingReceiver perform: s with: self]]
				ifFalse: [s numArgs = 0 
					ifTrue: [s value]
					ifFalse: [s value: self]]]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:16'
}
SystemSettingLauncher>>script [
	^ script ifNil: [script := []]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:16'
}
SystemSettingLauncher>>script: aValuableOrSymbol [
	script := aValuableOrSymbol
]
