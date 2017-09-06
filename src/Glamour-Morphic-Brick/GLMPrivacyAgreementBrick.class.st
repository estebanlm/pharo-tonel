"

"
Class {
	#name : #GLMPrivacyAgreementBrick,
	#superclass : #GLMBrick,
	#instVars : [
		'messageBrick',
		'settingsButtonBrick'
	],
	#category : #Glamour-Morphic-Brick-Widgets-UI,
	#timestamp : ''
}

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMPrivacyAgreementBrick class>>exampleOpen [

	(GLMBrick new
		hSpaceFill;
		vSpaceFill;
		addBrickBack: (
			self gtExample
				padding: 2;
				borderColor: Color lightGray;
				borderWidth: 2;
				margin: 10;
				hSpaceFill;
				vShrinkWrap;
				yourself);
		yourself)
			openInBrickWindow
			extent: 600@400
]

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMPrivacyAgreementBrick class>>gtExample [
	<gtExample>
	<label: 'Simple agreement'>
	
	^ self new
]

{
	#category : #utils,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMPrivacyAgreementBrick class>>openSettingsBrowser [
	| settingsBrowser window node nodePath |
	settingsBrowser := SettingBrowser new 
		changePackageSet: (RPackage organizer packageNamed: 'GT-EventRecorder') asOrderedCollection;
		yourself.
	window := settingsBrowser open.
	window position: Display extent - window extent // 2.
	settingsBrowser expandAll.
	node := settingsBrowser treeHolder nodeNamed: #sendDiagnosticsAndUsageData.
	nodePath := Array 
		with: (settingsBrowser treeHolder nodeNamed: node parentName)
		with: node.
	settingsBrowser selection: (MorphTreeMorphSingleSelection new selectedNodePath: nodePath).
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMPrivacyAgreementBrick>>initialize [
	super initialize.
	
	self useHorizontalLinearLayout.
	self hSpaceFill.
	self vShrinkWrap.
	self messageBrick: self newTitleBrick.
	self settingsButtonBrick: self newButtonBrick.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMPrivacyAgreementBrick>>messageBrick [
	^ messageBrick
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMPrivacyAgreementBrick>>messageBrick: anObject [

	messageBrick := anObject.
	self messageBrick
		hSpaceFill;
		vAlign: #center;
		margin:10;
		text: self privacyMessage.

	self addBrickBack: self messageBrick.
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMPrivacyAgreementBrick>>newButtonBrick [

	^ GLMButtonBrick new
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMPrivacyAgreementBrick>>newTitleBrick [

	^ GLMRubTextAreaBrick new
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMPrivacyAgreementBrick>>openSettingsBrowser [
	self class openSettingsBrowser
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMPrivacyAgreementBrick>>privacyMessage [

	^ self sendUsageData 
		ifTrue: [ 'You are sending diagnostic and usage data to help us improve Pharo. Thanks!' ]
		ifFalse: 	['No diagnostic and usage data is being sent. Would you like to send diagnostic and usage data to help us improve Pharo?']
]

{
	#category : #preferences,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMPrivacyAgreementBrick>>sendUsageData	 [
	^ self class environment at: #Privacy 
		ifPresent: [ :privacy | privacy sendDiagnosticsAndUsageData ]
		ifAbsent: [ false ].
		
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMPrivacyAgreementBrick>>settingsButtonBrick [
	^ settingsButtonBrick
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMPrivacyAgreementBrick>>settingsButtonBrick: anObject [
	settingsButtonBrick := anObject.
	
	self settingsButtonBrick
		text: self settingsButtonLabel;
		hShrinkWrap;
		vAlign: #center;
		margin:10;
		when: #onClicked do: [ self openSettingsBrowser ].
	
	self addBrickBack: self settingsButtonBrick
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMPrivacyAgreementBrick>>settingsButtonLabel [
	
	^ self sendUsageData 
		ifTrue: [ 'Change preferences' ]
		ifFalse: [  'Go to settings' ]
]
