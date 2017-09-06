"
A RangeSettingValue is a setting for which the value domain is an interval.  See SettingManager comment for more explanations.

Instance Variables
	range:		<Interval>

range
	- The interval which define the value domain

"
Class {
	#name : #RangeSettingDeclaration,
	#superclass : #SettingDeclaration,
	#instVars : [
		'range'
	],
	#category : #System-Settings-Core,
	#timestamp : 'alain.plantec 4/7/2009 23:03'
}

{
	#category : #'user interface',
	#timestamp : ' 8/31/2017 05:26:16'
}
RangeSettingDeclaration>>hasEditableList [
	^ false
]

{
	#category : #'user interface',
	#timestamp : ' 8/31/2017 05:26:16'
}
RangeSettingDeclaration>>inputWidget [
	^ (self theme newRowIn: World for: {(self theme 
							newTextEntryIn: World 
							for: self
							get: #realValue
							set: #realValue:
							class: (Smalltalk globals at: self type)
							getEnabled: #enabled
							help: nil) hResizing: #rigid;
							width: 80;
							wantsFrameAdornments: true;
							yourself. 
						(PluggableSliderMorph new max: self range last;
							 min: self range first;
							 quantum: self range increment;
							on: self
							getValue: #realValue
							setValue: #realValue:) hResizing: #spaceFill;
							 vResizing: #spaceFIll;
							 setBalloonText: self description;
							 minWidth: 300; height: 20;
							 yourself}) 
				cellInset: 10;
				yourself
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:16'
}
RangeSettingDeclaration>>range [
	^ range 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:16'
}
RangeSettingDeclaration>>range: anInterval [
	range := anInterval
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:16'
}
RangeSettingDeclaration>>realValue: aValue [
	aValue
		ifNil: [self settingReceiver perform: self setSelector with: nil]
		ifNotNil: [self settingReceiver perform: self setSelector with: ((aValue max: self range first) min: self range last)].
	self triggerEvent: self privateChangeEvent with: self
	
]
