"
Set the description on the selected development version
"
Class {
	#name : #VSSetDescriptionCommand,
	#superclass : #VSVersionCommand,
	#category : #Versionner-Core-Commands,
	#timestamp : '<historical>'
}

{
	#category : #execute,
	#timestamp : ' 8/31/2017 05:26:38'
}
VSSetDescriptionCommand>>execute [
	|  message |
	message := UIManager default 
					multilineRequest: 'Enter description' initialAnswer: ''.
	(message isNil or: [ message isEmpty ])
		ifTrue: [ ^ self ].
	self executeWithMessage: message
]

{
	#category : #execute,
	#timestamp : ' 8/31/2017 05:26:38'
}
VSSetDescriptionCommand>>executeWithMessage: message [
	| toolbox updatedSpecs |
	toolbox := MetacelloToolBox configurationNamed: target configurationBasename.
	toolbox
		updateVersionMethodForVersion: target version versionString
		updateProjects: false
		updatePackages: false
		versionSpecsDo: [ :attribute :versionSpec | 
			attribute == #common
				ifTrue: [ 
					"update the author, description and timeStamp"
					versionSpec
						author: MetacelloPlatform current authorName;
						timestamp: MetacelloPlatform current timestamp.
					MetacelloToolBox appendDescription: message to: versionSpec ].
			true ].
	toolbox commitMethod

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:38'
}
VSSetDescriptionCommand>>title [
	^ 'set description'
]
