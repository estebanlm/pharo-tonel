"
Browser the current image:

	ExternalBrowser openOn: CurrentImage new.

Browse a FileOut

	| internalStream |
	internalStream := (String new: 1000) writeStream.
	SystemOrganization 
		fileOutCategory: 'Tool-ExternalBrowser'
		on: internalStream.
	ExternalBrowser browseStream: internalStream contents readStream.
"
Class {
	#name : #ExternalBrowser,
	#superclass : #ComposableModel,
	#instVars : [
		'classes',
		'packages',
		'protocols',
		'selectors',
		'method',
		'showClassSide',
		'model'
	],
	#category : #Tool-ExternalBrowser,
	#timestamp : 'GuillermoPolito 5/29/2015 13:37'
}

{
	#category : #'public access',
	#timestamp : ' 8/31/2017 05:26:21'
}
ExternalBrowser class>>browseStream: aStream [

	self openOn: (RingChunkImporter fromStream: aStream)
]

{
	#category : #specs,
	#timestamp : ' 8/31/2017 05:26:21'
}
ExternalBrowser class>>defaultSpec [
	<spec: #default>
	
	^ SpecLayout composed 
		newColumn: [ :col | 
			col newRow: [ :row | 
					row newColumn: [ :subcolumn |
						subcolumn add: #packages.
						subcolumn add: #showClassSide height: 16  ].
					row 
						add: #classes;
						add: #protocols;
						add: #selectors ] ;
			newRow: [ :row | 
					row add: #method ]]; 
		yourself
]

{
	#category : #System-FileRegistry,
	#timestamp : ' 8/31/2017 05:26:21'
}
ExternalBrowser class>>fileReaderServicesForFile: fullName suffix: suffix [
	<fileService>

	^ (#('st' 'cs') includes: suffix)
		ifTrue: [ Array with: self serviceBrowseCode]
		ifFalse: [ #() ].
]

{
	#category : #specs,
	#timestamp : ' 8/31/2017 05:26:21'
}
ExternalBrowser class>>openOn: model [

	self basicNew
		model: model;
		initialize;
		openWithSpec
]

{
	#category : #System-FileRegistry,
	#timestamp : ' 8/31/2017 05:26:21'
}
ExternalBrowser class>>serviceBrowseCode [
	"Answer the service of opening a file-contents browser"

	^ (SimpleServiceEntry
		provider: self 
		label: 'Code-file browser'
		selector: #browseStream:
		description: 'Open a "file-contents browser" on this file, allowing you to view and selectively load its code'
		buttonLabel: 'Code')
		argumentGetter: [ :file| file readOnlyStream ]
]

{
	#category : #System-FileRegistry,
	#timestamp : ' 8/31/2017 05:26:21'
}
ExternalBrowser class>>services [
	"Answer potential file services associated with this class"

	^ {self serviceBrowseCode}.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
ExternalBrowser>>classes [

	^ classes
]

{
	#category : #'structure accessing',
	#timestamp : ' 8/31/2017 05:26:21'
}
ExternalBrowser>>classesOfPackage: aPackage [
	| theClasses |
	theClasses := aPackage classes.
	^ self showClassSide state
		ifTrue: [ theClasses collect: #theMetaClass ]
		ifFalse: [ theClasses ]
]

{
	#category : #initialize,
	#timestamp : ' 8/31/2017 05:26:21'
}
ExternalBrowser>>initialExtent [

	^ 800@600
]

{
	#category : #initialize,
	#timestamp : ' 8/31/2017 05:26:21'
}
ExternalBrowser>>initializeClassList [
	classes := self newList
]

{
	#category : #initialize,
	#timestamp : ' 8/31/2017 05:26:21'
}
ExternalBrowser>>initializeMethodBodyPane [
	method := self newCode
]

{
	#category : #initialize,
	#timestamp : ' 8/31/2017 05:26:21'
}
ExternalBrowser>>initializePackageList [
	packages := self newList.
	self populatePackages.
	packages displayBlock: [ :m | m name ]
]

{
	#category : #initialize,
	#timestamp : ' 8/31/2017 05:26:21'
}
ExternalBrowser>>initializePresenter [
	self wirePackages.
	self wireClasses.
	self wireProtocols.
	self wireSelectors.
	
	showClassSide 
		whenChangedDo: [ self refreshClasses: self packages selectedItem ].
]

{
	#category : #initialize,
	#timestamp : ' 8/31/2017 05:26:21'
}
ExternalBrowser>>initializeProtocolList [
	protocols := self newList
]

{
	#category : #initialize,
	#timestamp : ' 8/31/2017 05:26:21'
}
ExternalBrowser>>initializeSelectorList [

	selectors := self newList.
	
]

{
	#category : #initialize,
	#timestamp : ' 8/31/2017 05:26:21'
}
ExternalBrowser>>initializeWidgets [
	self initializePackageList.
	self initializeClassList.
	self initializeProtocolList.
	self initializeSelectorList.
	self initializeMethodBodyPane.
	
	showClassSide := self newCheckBox.
	showClassSide label: 'Class side'.
	showClassSide state: false.
	
	self focusOrder
		add: packages;
		add: classes;
		add: protocols;
		add: selectors;
		add: method
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
ExternalBrowser>>method [
	^ method
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
ExternalBrowser>>method: anObject [
	method := anObject
]

{
	#category : #'structure accessing',
	#timestamp : ' 8/31/2017 05:26:21'
}
ExternalBrowser>>methodFor: aSelector [

	^ (self classes selectedItem methodNamed: aSelector) sourceCode
			
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
ExternalBrowser>>model: aModel [

	model := aModel
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
ExternalBrowser>>packages [

	^ packages
]

{
	#category : #'selection operation',
	#timestamp : ' 8/31/2017 05:26:21'
}
ExternalBrowser>>populatePackages [

	packages items: model packages.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
ExternalBrowser>>protocols [

	^ protocols
]

{
	#category : #'structure accessing',
	#timestamp : ' 8/31/2017 05:26:21'
}
ExternalBrowser>>protocolsOfClass: aClass [

	^ aClass protocols
]

{
	#category : #initialize,
	#timestamp : ' 8/31/2017 05:26:21'
}
ExternalBrowser>>refreshClasses: pack [
	self resetClassSelection.
	pack 
		ifNil: [ classes items: #() ] 
		ifNotNil: [ classes items: (self classesOfPackage: pack)]. 
	Transcript show: pack printString;cr
]

{
	#category : #'selection operation',
	#timestamp : ' 8/31/2017 05:26:21'
}
ExternalBrowser>>resetClassSelection [

	self classes resetSelection
]

{
	#category : #'selection operation',
	#timestamp : ' 8/31/2017 05:26:21'
}
ExternalBrowser>>resetMethodBodyPane [
	self method text: ''
	
]

{
	#category : #'selection operation',
	#timestamp : ' 8/31/2017 05:26:21'
}
ExternalBrowser>>resetProtocolSelection [

	self protocols resetSelection
]

{
	#category : #'selection operation',
	#timestamp : ' 8/31/2017 05:26:21'
}
ExternalBrowser>>resetSelectorSelection [

	self selectors resetSelection
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
ExternalBrowser>>selectors [
	^ selectors
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
ExternalBrowser>>selectors: anObject [
	selectors := anObject
]

{
	#category : #'structure accessing',
	#timestamp : ' 8/31/2017 05:26:21'
}
ExternalBrowser>>selectorsOfProtocol: aProtocol  [
	
	| theSelectedClass |
	theSelectedClass := self showClassSide state
		ifFalse: [ self classes selectedItem ]
		ifTrue: [ self classes selectedItem theMetaClass ].
	^ (theSelectedClass 
		methodsInProtocol: self protocols selectedItem) collect: #selector
]

{
	#category : #'structure accessing',
	#timestamp : ' 8/31/2017 05:26:21'
}
ExternalBrowser>>showClassDefinition [
	method text: (self classes selectedItem definition  ifNil:[''])
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
ExternalBrowser>>showClassSide [

	^ showClassSide
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
ExternalBrowser>>title  [
	^ 'External Package Browser'
]

{
	#category : #initialize,
	#timestamp : ' 8/31/2017 05:26:21'
}
ExternalBrowser>>wireClasses [
	classes
		whenSelectedItemChanged: [ :class | 
			self resetProtocolSelection.
			class 
				ifNil: [ protocols items: #() ] 
				ifNotNil: [ protocols items: (self protocolsOfClass: class).
					         self showClassDefinition ] ]
]

{
	#category : #initialize,
	#timestamp : ' 8/31/2017 05:26:21'
}
ExternalBrowser>>wirePackages [
	packages whenSelectedItemChanged: [ :pack | 
		self refreshClasses: pack ].


	
]

{
	#category : #initialize,
	#timestamp : ' 8/31/2017 05:26:21'
}
ExternalBrowser>>wireProtocols [
	protocols
		whenSelectedItemChanged: [ :protocol | 
			self resetSelectorSelection.
			protocol 
				ifNil: [ selectors items: #() ] 
				ifNotNil: [ selectors items: (self selectorsOfProtocol: protocol) ] ]
]

{
	#category : #initialize,
	#timestamp : ' 8/31/2017 05:26:21'
}
ExternalBrowser>>wireSelectors [
	selectors
		whenSelectedItemChanged: [ :selector | 
			selector 
				ifNil: [ self resetMethodBodyPane ] 
				ifNotNil: [ method text:  (self methodFor: selector) ]]
]
