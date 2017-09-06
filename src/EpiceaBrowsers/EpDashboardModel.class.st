"
I'm a Spec model to manage the global state of Epicea.

Open with:
self open
"
Class {
	#name : #EpDashboardModel,
	#superclass : #ComposableModel,
	#instVars : [
		'enableMonitorButtonModel',
		'createLogButtonModel',
		'monitor',
		'openSettingsButtonModel',
		'currentSessionInfoModel'
	],
	#category : #EpiceaBrowsers-UI-Dashboard,
	#timestamp : 'MartinDias 3/30/2017 20:54'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:27'
}
EpDashboardModel class>>open [

	^ self new
		refresh;
		openWithSpec;
		yourself
]

{
	#category : #specs,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpDashboardModel class>>spec [
	<spec: #default>

	^SpecLayout composed newColumn: [:column |
		column add: #currentSessionInfoModel.
		
		column
			newRow: [ :row |
				row
					add: #enableMonitorButtonModel;
					add: #createLogButtonModel;
					add: #openSettingsButtonModel;
					yourself ]
			height: self buttonHeight. 
		]
]

{
	#category : #icons,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpDashboardModel class>>taskbarIconName [

	^ #config

]

{
	#category : #specs,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpDashboardModel class>>title [

	^ 'Epicea - Dashboard'
]

{
	#category : #'accessing widgets',
	#timestamp : ' 8/31/2017 05:26:27'
}
EpDashboardModel>>createLogButtonModel [
	^ createLogButtonModel
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpDashboardModel>>createNewSessionLog [
	
	| fileNameOrNil sessionStore |
	sessionStore := self monitor sessionStore.

	fileNameOrNil := UIManager default
		request: 'Enter a file name (without extension) for the new log.'
		initialAnswer: sessionStore nextStoreName.
	fileNameOrNil ifNil: [ ^ self ].

	(self monitor sessionStore existsStoreNamed: fileNameOrNil)
		ifTrue: [ 
			self inform: 'Invalid name: Already used' ]
		ifFalse: [
			self monitor sessionStore resetWithStoreNamed: fileNameOrNil.
			self refresh ]
]

{
	#category : #'accessing widgets',
	#timestamp : ' 8/31/2017 05:26:27'
}
EpDashboardModel>>currentSessionInfoModel [
	^ currentSessionInfoModel
]

{
	#category : #'accessing widgets',
	#timestamp : ' 8/31/2017 05:26:27'
}
EpDashboardModel>>enableMonitorButtonModel [
	^ enableMonitorButtonModel
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpDashboardModel>>initialExtent  [

	^ 450 @ 200
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpDashboardModel>>initializeCreateLogButtonModel [

	createLogButtonModel
		icon: (self iconNamed: #addIcon);
		help: 'Start recording into new Log';
		label: 'New session';
		action: [ self createNewSessionLog ].
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpDashboardModel>>"protocol: initialization"
initializeEnableMonitorButtonModel [

	enableMonitorButtonModel
		help: 'Enable/disable the Epicea Monitor. When enabled, it logs code changes (and some IDE events such as MC load/save and refactorings) performed in this Pharo session.';
		action: [ 
			self monitor enabled: enableMonitorButtonModel state not.
		].

]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpDashboardModel>>initializeOpenSettingsButtonModel [

	openSettingsButtonModel
		help: 'Open Epicea''s system settings';
		icon: (self iconNamed: #config);
		label: 'More settings...';
		action: [ self openSettingsBrowser ]
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpDashboardModel>>initializePresenter  [
	super initializePresenter.
	
	self initializeCreateLogButtonModel.
	self initializeEnableMonitorButtonModel.
	self initializeOpenSettingsButtonModel.

	"Listen announcers"
	self initializeRefreshEnableMonitorButtonModelOnMonitorUpdate.
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpDashboardModel>>"protocol: initialization"
initializeRefreshEnableMonitorButtonModelOnMonitorUpdate [

	| monitorAnnouncer |
	monitorAnnouncer := self monitor announcer.

	monitorAnnouncer weak
		when: EpMonitorStateUpdated 
		send: #refreshEnableMonitorButtonModel
		to: self.

	self whenWindowChanged: [ :windowModel | 
		windowModel whenClosedDo: [ 
			monitorAnnouncer unsubscribe: self ] ].

]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpDashboardModel>>initializeWidgets [

	self instantiateModels: {
		#currentSessionInfoModel -> #TextModel.
		#enableMonitorButtonModel -> #ButtonModel.
		#openSettingsButtonModel -> #ButtonModel.
		#createLogButtonModel -> #ButtonModel.
		}
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpDashboardModel>>monitor [
	
	^ monitor ifNil: [ EpMonitor current ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpDashboardModel>>monitor: anEpMonitor [

	monitor := anEpMonitor.
	self refreshEnableMonitorButtonModel.
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpDashboardModel>>openSettingsBrowser [
	"Inspired on Glamour's code"

	| settingsBrowser settingsWindow |
	settingsBrowser := SettingBrowser new 
		changePackageSet: (RPackage organizer packageNamed: 'EpiceaBrowsers') asOrderedCollection;
		yourself.
	settingsWindow := settingsBrowser open.
	settingsWindow position: Display extent - settingsWindow extent // 2.
	settingsBrowser expandAll.
]

{
	#category : #'accessing widgets',
	#timestamp : ' 8/31/2017 05:26:27'
}
EpDashboardModel>>openSettingsButtonModel [

	^ openSettingsButtonModel
]

{
	#category : #refreshing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpDashboardModel>>refresh [

	self refreshEnableMonitorButtonModel.
	self refreshCurrentSessionInfoModel.
]

{
	#category : #refreshing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpDashboardModel>>refreshCurrentSessionInfoModel [

	| sessionStore text |
	sessionStore := self monitor sessionStore.

	text := String streamContents: [:stream |
		stream
			nextPutAll: 'Current Log: '; cr;
			nextPutAll: sessionStore writingFileReference basename;
			cr; cr;
			nextPutAll: 'Directory: '; cr;
			nextPutAll: sessionStore writingFileReference parent fullName.
		].

	currentSessionInfoModel enabled: false; text: text.
]

{
	#category : #refreshing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpDashboardModel>>refreshEnableMonitorButtonModel [
		
	| theState theIconSelector |
	self monitor isEnabled 
		ifTrue: [ 
			theState := 'enabled'.
			theIconSelector := #testGreen ] 
		ifFalse: [ 
			theState := 'disabled'.
			theIconSelector := #testNotRun ].
	
	enableMonitorButtonModel
		state: self monitor isEnabled;
		label: 'Monitor ', theState;
		icon: (self iconNamed: theIconSelector).

]
