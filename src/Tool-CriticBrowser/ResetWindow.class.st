"
A ResetWindow is simple UI to reset the currently analysed model.
"
Class {
	#name : #ResetWindow,
	#superclass : #ComposableModel,
	#instVars : [
		'resetModel',
		'currentConfigurationModel'
	],
	#category : #Tool-CriticBrowser,
	#timestamp : '<historical>'
}

{
	#category : #specs,
	#timestamp : ' 8/31/2017 05:26:37'
}
ResetWindow class>>defaultSpec [
<spec>

	^SpecLayout composed
		newRow: [:r |
			r 
				add: #resetModel;
				add: #currentConfigurationModel
			]  height: 25
]

{
	#category : #specs,
	#timestamp : ' 8/31/2017 05:26:37'
}
ResetWindow class>>title [
	^ 'Critic Browser' 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
ResetWindow>>currentConfigurationModel [
	^ currentConfigurationModel
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:37'
}
ResetWindow>>initialExtent [

	^   450@30
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:37'
}
ResetWindow>>initializeWidgets [

	resetModel := self newButton.
	currentConfigurationModel := self newButton.

	self setFocusOrder.
	self setResetModel. 
	self setCurrentConfigurationModel. 
	
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
ResetWindow>>resetModel [
	^ resetModel
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:37'
}
ResetWindow>>setCurrentConfigurationModel [
	currentConfigurationModel  
		state: false;
		label: 'Uses Current Configuration';
		action: [ CriticBrowser openOnWorkingConfiguration: CriticWorkingConfiguration current. 
				self delete ]
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:37'
}
ResetWindow>>setFocusOrder [

	self focusOrder
		add: resetModel;
		add: currentConfigurationModel
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:37'
}
ResetWindow>>setResetModel [
	resetModel 
		state: false;
		label: 'Reset Current Configurartion';
		action: [ SelectPackageBrowser open. 
				self delete ]
]
