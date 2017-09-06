"
I'm a new browser based on RPackage and Announcements with fancy goodies:

	- groups ( you can create groups with your favorite classes)
	- multi-selections
	- environments
	- iconic buttons
	- hierarchy
	- pragma based menus
	
Adding to context menus.

On the class-side of your object, create a method that:
	1. takes one argument (a PragmaMenuAndShortcutRegistration).
	2. Begins with the pragma for whichever menu you want to extend (see AbstractNautilusUI ""menu pragmas"" protocol)
	
	For example, to extend the menu for the method list pane:
		methodMenu: aBuilder
			<nautilusGlobalMethodMenu>
			
	To see existing examples in your image, browse senders of that pragma
"
Class {
	#name : #Nautilus,
	#superclass : #Object,
	#instVars : [
		'announcer',
		'browsedEnvironment',
		'browsingHistory',
		'plugins',
		'selectedCategory',
		'selectedClass',
		'selectedGroup',
		'selectedMethod',
		'selectedPackage',
		'showCategories',
		'showComment',
		'sortHierarchically',
		'showInstance',
		'showHierarchy',
		'ui',
		'methodClassifier'
	],
	#classVars : [
		'MethodClassifierClass',
		'PluginClasses',
		'SortHierarchically'
	],
	#classInstVars : [
		'groups',
		'methodGroup',
		'useOldStyleKeys',
		'showSourceCodeAnnotation',
		'inlineCritiques'
	],
	#category : #Nautilus,
	#timestamp : 'StephaneDucasse 9/5/2015 22:00'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:22'
}
Nautilus class>>browsedEnvironment: anEnvironment [

	^ self new browsedEnvironment: anEnvironment
]

{
	#category : #groups,
	#timestamp : ' 8/31/2017 05:26:22'
}
Nautilus class>>buildGroupManager [
	| holder |
	holder := GroupHolder new.
	(holder addAPackageGroupSilentlyNamed: 'Work' packages: OrderedCollection new)
		removable: true;
		isFillable: true.
	(holder addAPackageGroupSilentlyNamed: self configurationsGroupName packages: self configurationPackages)
		removable: false;
		isFillable: true.
	^ holder
]

{
	#category : #groups,
	#timestamp : ' 8/31/2017 05:26:22'
}
Nautilus class>>buildMethodGroupManager [
	| holder |
	holder := GroupHolder new.
	(holder addAMethodGroupSilentlyNamed: self lastModifiedMethodsGroupName methods: self lastModifiedMethods)
		removable: false.
	^ holder
]

{
	#category : #cleanup,
	#timestamp : ' 8/31/2017 05:26:22'
}
Nautilus class>>cleanUp [
	AbstractNautilusUI resetIconCaches.
	self resetGroups.

]

{
	#category : #groups,
	#timestamp : ' 8/31/2017 05:26:22'
}
Nautilus class>>configurationPackages [
	^ (RPackageOrganizer default packages
		select: [ :package | (package name beginsWith: 'ConfigurationOf') or: [ package name beginsWith: 'BaselineOf' ] ]) asOrderedCollection
]

{
	#category : #groups,
	#timestamp : ' 8/31/2017 05:26:22'
}
Nautilus class>>configurationsGroupName [
	^ 'Configurations'
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:22'
}
Nautilus class>>defaultBrowsedEnvironment [

	^ RBBrowserEnvironment new
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:22'
}
Nautilus class>>defaultMaxSize [

	^ NavigationHistory defaultMaxSize
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
Nautilus class>>groupsManager [
	^ groups ifNil: [ groups := self buildGroupManager ]
]

{
	#category : #icon,
	#timestamp : ' 8/31/2017 05:26:22'
}
Nautilus class>>icon  [

	^ AbstractNautilusUI icon
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:22'
}
Nautilus class>>initialize [
	SessionManager default registerToolClassNamed: self name
]

{
	#category : #settings,
	#timestamp : ' 8/31/2017 05:26:22'
}
Nautilus class>>inlineCritiques [
	^ inlineCritiques ifNil: [ inlineCritiques := false ]
]

{
	#category : #settings,
	#timestamp : ' 8/31/2017 05:26:22'
}
Nautilus class>>inlineCritiques: aBoolean [
	inlineCritiques := aBoolean
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:22'
}
Nautilus class>>isNoCategoryAndNoMethodSelected [
	
	^ self selectedCategory isNil and: [ self selectedMethod isNil ]
]

{
	#category : #groups,
	#timestamp : ' 8/31/2017 05:26:22'
}
Nautilus class>>lastModifiedMethods [
	^ RecentMessageList uniqueInstance methodReferenceList asSet asOrderedCollection
]

{
	#category : #groups,
	#timestamp : ' 8/31/2017 05:26:22'
}
Nautilus class>>lastModifiedMethodsGroupName [
	^ 'Last Modified Methods'
]

{
	#category : #'world menu',
	#timestamp : ' 8/31/2017 05:26:22'
}
Nautilus class>>menuCommandOn: aBuilder [
	<worldMenu>
	(aBuilder item: #'System Browser')
		parent: #MostUsedTools;
		action: [ Smalltalk tools openClassBrowser ];
		order: 0.1;
		keyText: 'o, b';
		icon: Smalltalk tools browser taskbarIcon
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
Nautilus class>>methodClassifierClass [

	^ MethodClassifierClass ifNil: [ MethodClassifierClass := MethodClassifier ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
Nautilus class>>methodClassifierClass: aClass [

	 MethodClassifierClass := aClass
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
Nautilus class>>methodGroupManager [
	^ methodGroup ifNil: [ methodGroup := self buildMethodGroupManager ]
]

{
	#category : #settings,
	#timestamp : ' 8/31/2017 05:26:22'
}
Nautilus class>>nautilusSettingsOn: aBuilder [
	<systemsettings>
	(aBuilder group: #codeBrowsing)
		label: 'Code Browsing';
		description: 'All settings concerned with code browsing look''n feel';
		with:
				[ (aBuilder group: #Nautilus)
				target: self;
				label: 'Nautilus Browser';
				parent: #codeBrowsing;
				description: 'Settings related to the browser';
				with:
						[ (aBuilder setting: #sortHierarchically)
						label: 'Show hierarchy by default ?';
						description: 'If false, Nautilus will show a flat list of classes'.
					(aBuilder setting: #showSourceCodeAnnotation)
						label: 'Show source code annotation pane ?';
						description: 'Display a pane that shows current position in the source code, allows code formating etc. It affects only for the new Nautilus windows'.
						
					(aBuilder setting: #useOldStyleKeys)
						label: 'Use old style keys ?';
						description: 'If true, the browser will use the old style keys (This is highly non-recommended, you will lose a lot of cool access keys)'.
						
					(aBuilder setting: #inlineCritiques)
						label: 'Show critiques inline?';
						description: 'When turned on the quality critiques will be displayed inline in the code area' ] ]
]

{
	#category : #opening,
	#timestamp : ' 8/31/2017 05:26:22'
}
Nautilus class>>open [
	^ self openInEnvironment: self defaultBrowsedEnvironment
]

{
	#category : #opening,
	#timestamp : ' 8/31/2017 05:26:22'
}
Nautilus class>>openInEnvironment: anEnvironment [

	| instance |
	instance := self new.
	instance 
		browsedEnvironment: anEnvironment;
		open.
	instance ui 
		useLastPackagePatternString;
		showHierarchy: false.
	^ instance
]

{
	#category : #opening,
	#timestamp : ' 8/31/2017 05:26:22'
}
Nautilus class>>openOnCategory: aCategory ofClass: aClass [

	^ self openOnCategory: aCategory ofClass: aClass inEnvironment: self defaultBrowsedEnvironment
]

{
	#category : #opening,
	#timestamp : ' 8/31/2017 05:26:22'
}
Nautilus class>>openOnCategory: aCategory ofClass: aClass inEnvironment: anEnvironment [
	| instance |
	instance := self new.
	instance browsedEnvironment: anEnvironment.
	instance showInstance: aClass isMeta not.
	instance
		package: aClass package
		class: aClass
		protocol: aCategory.
	instance open.
	^ instance
]

{
	#category : #opening,
	#timestamp : ' 8/31/2017 05:26:22'
}
Nautilus class>>openOnClass: aClass [

	^ self openOnClass: aClass inEnvironment: self defaultBrowsedEnvironment
]

{
	#category : #opening,
	#timestamp : ' 8/31/2017 05:26:22'
}
Nautilus class>>openOnClass: aClass inEnvironment: anEnvironment [
	| instance |
	instance := self new.
	instance
		browsedEnvironment: anEnvironment;
		showInstance: aClass isMeta not;
		package: (self parentOfClass: aClass)
			class: aClass;
		open.
	instance ui
		useLastPackagePatternStringForClass: aClass;
		showHierarchy: false;
		giveFocusToProtocol.
	^ instance
]

{
	#category : #opening,
	#timestamp : ' 8/31/2017 05:26:22'
}
Nautilus class>>openOnClass: aClass onGroup: aGroup [
	
	^ self openOnClass: aClass onGroup: aGroup inEnvironment: self defaultBrowsedEnvironment.
]

{
	#category : #opening,
	#timestamp : ' 8/31/2017 05:26:22'
}
Nautilus class>>openOnClass: aClass onGroup: aGroup inEnvironment: anEnvironment [
	| instance |
	instance := self new.
	instance browsedEnvironment: anEnvironment.
	instance showInstance: aClass isMeta not.
	instance selectedGroup: aGroup.
	instance
		package: aClass package
		class: aClass.
	instance open.
	^ instance
]

{
	#category : #opening,
	#timestamp : ' 8/31/2017 05:26:22'
}
Nautilus class>>openOnClass: aClass onProtocol: aProtocol [

	^ self 
		openOnClass: aClass 
		onProtocol: aProtocol 
		inEnvironment: self defaultBrowsedEnvironment
]

{
	#category : #opening,
	#timestamp : ' 8/31/2017 05:26:22'
}
Nautilus class>>openOnClass: aClass onProtocol: aProtocol inEnvironment: anEnvironment [

	| instance |
	instance := self new.
	instance 
		browsedEnvironment: anEnvironment;
		showInstance: aClass isMeta not;
		selectedCategory: aProtocol;
		package: aClass package class: aClass;
		open.
	instance ui 
		showHierarchy: false.
	instance ui 
		selectedCategory: aProtocol;
		categorySelectionChanged;
		changed: #currentHistoryIndex.
	^ instance
]

{
	#category : #opening,
	#timestamp : ' 8/31/2017 05:26:22'
}
Nautilus class>>openOnClass: aClass selector: aSelector  [

	^ aSelector
		ifNil: [ self openOnClass: aClass ]
		ifNotNil: [| method |
			method := aClass methodDict at: aSelector ifAbsent: [ ^ self openOnClass:aClass ].
			method ifNotNil: [ self openOnMethod: method ]]
]

{
	#category : #opening,
	#timestamp : ' 8/31/2017 05:26:22'
}
Nautilus class>>openOnClass: class selector: selector highlight: autoSelectString [
	| nautilus |

	nautilus := self openOnClass: class selector: selector.
	autoSelectString ifNotNil: [ nautilus ui highlight: autoSelectString ]
]

{
	#category : #opening,
	#timestamp : ' 8/31/2017 05:26:22'
}
Nautilus class>>openOnGroup: aGroup [

	^ self openOnGroup: aGroup inEnvironment: self defaultBrowsedEnvironment
]

{
	#category : #opening,
	#timestamp : ' 8/31/2017 05:26:22'
}
Nautilus class>>openOnGroup: aGroup inEnvironment: anEnvironment [
	| instance |
	instance := self new.
	instance browsedEnvironment: anEnvironment.
	instance selectedGroup: aGroup.
	instance open.
	^ instance
]

{
	#category : #opening,
	#timestamp : ' 8/31/2017 05:26:22'
}
Nautilus class>>openOnMethod: aMethod [
	
	^ self openOnMethod: aMethod inEnvironment: self defaultBrowsedEnvironment
]

{
	#category : #opening,
	#timestamp : ' 8/31/2017 05:26:22'
}
Nautilus class>>openOnMethod: aMethod inEnvironment: anEnvironment [
	| instance class |
	class := aMethod methodClass.
	instance := self new.
	instance
		browsedEnvironment: anEnvironment;
		showInstance: class isMeta not;
		package: (self parentOfClass: class)
			class: class
			protocol: aMethod protocol asString
			method: aMethod;
		open.
	instance ui
		useLastPackagePatternStringForClass: class;
		showHierarchy: false;
		giveFocusToMethod.
	^ instance
]

{
	#category : #opening,
	#timestamp : ' 8/31/2017 05:26:22'
}
Nautilus class>>openOnPackage: aPackage [

	^ self openOnPackage: aPackage inEnvironment: self defaultBrowsedEnvironment
]

{
	#category : #opening,
	#timestamp : ' 8/31/2017 05:26:22'
}
Nautilus class>>openOnPackage: selectedPackage class: selectedClass category: selectedCategory method: selectedMethod group: selectedGroup sortHierarchically: sortHierarchically showHierarchy: showHierarchy showComment: showComment showInstance: showInstance showCategories: showCategories [
	^ self
		openOnPackage: selectedPackage
		class: selectedClass
		category: selectedCategory
		method: selectedMethod
		group: selectedGroup
		sortHierarchically: sortHierarchically
		showHierarchy: showHierarchy
		showComment: showComment
		showInstance: showInstance
		showCategories: showCategories
		inEnvironment: self defaultBrowsedEnvironment
]

{
	#category : #opening,
	#timestamp : ' 8/31/2017 05:26:22'
}
Nautilus class>>openOnPackage: selectedPackage class: selectedClass category: selectedCategory method: selectedMethod group: selectedGroup sortHierarchically: sortHierarchically showHierarchy: showHierarchy showComment: showComment showInstance: showInstance showCategories: showCategories inEnvironment: anEnvironment [
	| instance |
	instance := self new.
	instance browsedEnvironment: anEnvironment.
	instance
		package: selectedPackage
		class: selectedClass
		protocol: selectedCategory
		method: selectedMethod.
	instance selectedGroup: selectedGroup.
	instance
		sortHierarchically: sortHierarchically;
		showComment: showComment;
		showInstance: showInstance;
		showCategories: showCategories;
		showHierarchy: showHierarchy.
	instance open.
	instance ui
		showHierarchy: showHierarchy;
		showComment: showComment.
	^ instance
]

{
	#category : #opening,
	#timestamp : ' 8/31/2017 05:26:22'
}
Nautilus class>>openOnPackage: aPackage inEnvironment: anEnvironment [

	| instance |
	instance := self new.
	instance browsedEnvironment: anEnvironment.
	instance selectedPackage: aPackage.
	instance open.
	instance ui showHierarchy: false.
	^ instance
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
Nautilus class>>parentOfClass: aClass [
	"I can answer an RPackage or an RPackageTag, depending on the presence of Tags in package. 
	 This is an UI optimization to not show a tree RPackage->RPackageTag when there is just 
	 one tag in package, named in the same way as his parent"	

	| package tag |
	
	package := aClass package.
	tag := package classTagForClass: aClass.
	
	^ ((((tag name = package name) and: [ package classTags size <= 1 ]) or: [tag isNil])
		ifTrue: [ package ]
		ifFalse: [ tag ])
		asNautilusSelection
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
Nautilus class>>pluginClasses [

	^ PluginClasses ifNil: [ PluginClasses := OrderedCollection new ].
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
Nautilus class>>pluginClasses: aCollection [

	PluginClasses := aCollection
]

{
	#category : #'tool - registration',
	#timestamp : ' 8/31/2017 05:26:22'
}
Nautilus class>>registerToolsOn: registry [
	"Add ourselves to registry. See [Smalltalk tools]" 
	registry register: self as: #browser

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
Nautilus class>>resetGroups [
	<script>
	groups := nil
]

{
	#category : #settings,
	#timestamp : ' 8/31/2017 05:26:22'
}
Nautilus class>>showSourceCodeAnnotation [
	^showSourceCodeAnnotation ifNil: [ showSourceCodeAnnotation := true ]
]

{
	#category : #settings,
	#timestamp : ' 8/31/2017 05:26:22'
}
Nautilus class>>showSourceCodeAnnotation: aBoolean [
	showSourceCodeAnnotation := aBoolean
]

{
	#category : #'system startup',
	#timestamp : ' 8/31/2017 05:26:22'
}
Nautilus class>>shutDown [
	self cleanUp
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
Nautilus class>>sortHierarchically [

	^ SortHierarchically ifNil: [ SortHierarchically := true ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
Nautilus class>>sortHierarchically: aBoolean [

	SortHierarchically := aBoolean
]

{
	#category : #events,
	#timestamp : ' 8/31/2017 05:26:22'
}
Nautilus class>>stopNotifications [
	" self stopNotifications "
	SystemAnnouncer uniqueInstance unsubscribe: self
]

{
	#category : #icon,
	#timestamp : ' 8/31/2017 05:26:22'
}
Nautilus class>>taskbarIconName [

	^#nautilusIcon
]

{
	#category : #settings,
	#timestamp : ' 8/31/2017 05:26:22'
}
Nautilus class>>useOldStyleKeys [
	^useOldStyleKeys ifNil: [ useOldStyleKeys := false ]
]

{
	#category : #settings,
	#timestamp : ' 8/31/2017 05:26:22'
}
Nautilus class>>useOldStyleKeys: aBoolean [
	useOldStyleKeys := aBoolean
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 05:26:22'
}
Nautilus>>= aNautilus [

	self class = aNautilus class ifFalse: [ ^ false ].
	1 to: self class instVarNames size do: [:index |
		(self instVarAt: index) = (aNautilus instVarAt: index)
			ifFalse: [ ^ false ]].
	^ true
]

{
	#category : #history,
	#timestamp : ' 8/31/2017 05:26:22'
}
Nautilus>>adopt: anAssociation [

	self browsingHistory pauseDuring: [
		anAssociation key applyTo: self ]
]

{
	#category : #announcement,
	#timestamp : ' 8/31/2017 05:26:22'
}
Nautilus>>announce: anAnnouncement [

	self announcer announce: anAnnouncement

]

{
	#category : #announcement,
	#timestamp : ' 8/31/2017 05:26:22'
}
Nautilus>>announcer [

	^ announcer ifNil: [ announcer := Announcer new ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
Nautilus>>browsedEnvironment [

	^ browsedEnvironment ifNil: [ browsedEnvironment := RBBrowserEnvironment new ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
Nautilus>>browsedEnvironment: anEnvironment [

	browsedEnvironment := anEnvironment
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
Nautilus>>browsingHistory [

	^ browsingHistory ifNil: [ browsingHistory := NavigationHistory new ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
Nautilus>>classes [
	
	^ self browsedEnvironment classes
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
Nautilus>>classifier [
	^ methodClassifier ifNil: [ methodClassifier := self class methodClassifierClass new ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
Nautilus>>classifier: aMethodClassifier [
	methodClassifier := aMethodClassifier
]

{
	#category : #displaying,
	#timestamp : ' 8/31/2017 05:26:22'
}
Nautilus>>close [

	ui close
]

{
	#category : #'browser compatibility',
	#timestamp : ' 8/31/2017 05:26:22'
}
Nautilus>>codeTextMorph [

	^ self ui codeTextMorph
]

{
	#category : #'browser compatibility',
	#timestamp : ' 8/31/2017 05:26:22'
}
Nautilus>>contents: aText [
	self ui sourceCode: aText
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:22'
}
Nautilus>>foundExtentionsIn: aClass [

	^ aClass extendingPackages.

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
Nautilus>>groupsManager [
	
	^ self class groupsManager
]

{
	#category : #history,
	#timestamp : ' 8/31/2017 05:26:22'
}
Nautilus>>hasNext [
	
	^self browsingHistory hasNext
]

{
	#category : #history,
	#timestamp : ' 8/31/2017 05:26:22'
}
Nautilus>>hasPrevious [
	
	^self browsingHistory hasPrevious
]

{
	#category : #history,
	#timestamp : ' 8/31/2017 05:26:22'
}
Nautilus>>historyChanged [

	ui ifNotNil: [ ui historyChanged ]
]

{
	#category : #history,
	#timestamp : ' 8/31/2017 05:26:22'
}
Nautilus>>historyEntries [

	^ self browsingHistory entries
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:22'
}
Nautilus>>initialize [
	super initialize.

	plugins := OrderedCollection new.
	self class pluginClasses do: [:each || class position |
		class := each first.
		position := each second.
		plugins add: ((class model: self) position: position; yourself)]
]

{
	#category : #'browser compatibility',
	#timestamp : ' 8/31/2017 05:26:22'
}
Nautilus>>labelString [
	^ self ui ifNil: [ 'Nautilus - System Browser' ] ifNotNil: [ :theui | theui title ]
]

{
	#category : #history,
	#timestamp : ' 8/31/2017 05:26:22'
}
Nautilus>>next [
	self browsingHistory pauseDuring: [
		self adopt: self browsingHistory next.
		self historyChanged ].
]

{
	#category : #displaying,
	#timestamp : ' 8/31/2017 05:26:22'
}
Nautilus>>open [
	ui := (NautilusUI on: self) open.
	self announce: (WindowOpened new window: ui window)
]

{
	#category : #history,
	#timestamp : ' 8/31/2017 05:26:22'
}
Nautilus>>package: aPackage [

	self selectedPackage: aPackage.
	
	self announcer announce: (NautilusPackageSelected package: aPackage).
	self ui ifNotNil: [ self ui sourceTextModel announce: NautilusPackageSelected ]
]

{
	#category : #history,
	#timestamp : ' 8/31/2017 05:26:22'
}
Nautilus>>package: aPackage class: aClass [

	self 
		selectedPackage: aPackage;
		selectedClass: aClass.
		
	self announcer announce: (NautilusClassSelected package: aPackage class: aClass).
	self ui ifNotNil: [ self ui sourceTextModel announce: NautilusClassSelected ].
	
	self registerHistoryNewEntry
]

{
	#category : #history,
	#timestamp : ' 8/31/2017 05:26:22'
}
Nautilus>>package: aPackage class: aClass protocol: aProtocol [

	self 
		selectedPackage: aPackage;
		selectedClass: aClass;
		selectedCategory: aProtocol.
		
	self announcer announce: (NautilusProtocolSelected
										package: aPackage
										class: aClass
										protocol: aProtocol).
	self ui ifNotNil: [ self ui sourceTextModel announce: NautilusProtocolSelected ].
	
	self registerHistoryNewEntry
]

{
	#category : #history,
	#timestamp : ' 8/31/2017 05:26:22'
}
Nautilus>>package: aPackage class: aClass protocol: aProtocol method: aMethod [

	self 
		selectedPackage: aPackage;
		selectedClass: aClass;
		selectedCategory: aProtocol;
		selectedMethod: aMethod.
		
	self announcer announce: (NautilusMethodSelected
										package: aPackage
										class: aClass
										protocol: aProtocol
										method: aMethod).
	self ui ifNotNil: [ self ui sourceTextModel announce: NautilusMethodSelected ].
	self ui ifNotNil: [ self ui resetIconStyle ].
	
	self registerHistoryNewEntry
]

{
	#category : #'package filter',
	#timestamp : ' 8/31/2017 05:26:22'
}
Nautilus>>packagePatternString: aString  [
	
	self ui packagePatternString: aString
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
Nautilus>>packages [

	^ self browsedEnvironment packages asArray
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
Nautilus>>packagesWithoutExtensions [
	^ self browsedEnvironment packages asArray
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
Nautilus>>parentOfClass: aClass  [
	^ self class parentOfClass: aClass 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
Nautilus>>plugins [

	^ plugins ifNil: [ plugins := OrderedCollection new ]
]

{
	#category : #history,
	#timestamp : ' 8/31/2017 05:26:22'
}
Nautilus>>previous [
	self browsingHistory pauseDuring: [
		self adopt: self browsingHistory previous.
		self historyChanged ]
]

{
	#category : #history,
	#timestamp : ' 8/31/2017 05:26:22'
}
Nautilus>>registerHistoryNewEntry [
	| lastEntry wrapper |
	
	self browsingHistory isPaused ifTrue: [ ^ self ].
	wrapper := NautilusHistoryEntry with: self.
	self browsingHistory entries ifNotEmpty: [ :entries |
		lastEntry := entries last key.
		( lastEntry selectedClass isNil 
		or: [ ( wrapper selectedClass notNil 
			and: [ wrapper selectedMethod = lastEntry selectedMethod 
			and: [ wrapper selectedClass theNonMetaClass = lastEntry selectedClass theNonMetaClass ] ] ) ] ) 
				ifTrue: [ ^ self ] ].
	
	self browsingHistory add: wrapper.
	self historyChanged.
]

{
	#category : #history,
	#timestamp : ' 8/31/2017 05:26:22'
}
Nautilus>>removeFromHistory: aNautilusHistoryEntry [

	self browsingHistory removeEntry: aNautilusHistoryEntry.
	self historyChanged
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
Nautilus>>selectedCategory [

	^ selectedCategory
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
Nautilus>>selectedCategory: anObject [
	selectedCategory := anObject.
	self selectedMethod: nil.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
Nautilus>>selectedClass [
	^ selectedClass
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
Nautilus>>selectedClass: aClass [
	selectedClass := aClass.
	self selectedCategory: nil.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
Nautilus>>selectedGroup [

	^ selectedGroup
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
Nautilus>>selectedGroup: anObject [
	selectedGroup := anObject.
	anObject
		ifNotNil: [ 
			self announcer announce: (NautilusGroupSelected group: anObject).
			self ui ifNotNil: [ self ui sourceTextModel announce: NautilusGroupSelected ] ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
Nautilus>>selectedMethod [

	^ selectedMethod
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
Nautilus>>selectedMethod: anObject [
	selectedMethod := anObject.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
Nautilus>>selectedPackage [

	^ selectedPackage
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
Nautilus>>selectedPackage: anObject [
	selectedPackage := anObject asNautilusSelection.
	self selectedClass: nil
]

{
	#category : #'browser compatibility',
	#timestamp : ' 8/31/2017 05:26:22'
}
Nautilus>>setClass: aClass selector: aSelector [
	| method protocol |
	method := aClass methodDict at: aSelector ifAbsent: [ nil ].
	protocol := method ifNil: [ nil ] ifNotNil: [ method protocol ].
	self
		selectedPackage: (self parentOfClass: aClass);
		selectedClass: aClass;
		showInstance: aClass isMeta not;
		selectedCategory: protocol;
		selectedMethod: method
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
Nautilus>>showCategories [

	^ showCategories ifNil: [ showCategories := true ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
Nautilus>>showCategories: aBoolean [

	showCategories := aBoolean.
	self announcer announce: ( NautilusShowCategoriesChanged boolean: aBoolean )
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
Nautilus>>showComment [

	^ showComment ifNil: [ showComment := false ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
Nautilus>>showComment: aBoolean [

	showComment := aBoolean.
	self announcer announce: ( NautilusShowCommentChanged boolean: aBoolean )
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
Nautilus>>showHierarchy [

	^ showHierarchy ifNil: [ showHierarchy := false ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
Nautilus>>showHierarchy: aBoolean [

	showHierarchy := aBoolean.
	self announcer announce: ( NautilusShowPackagesChanged boolean: aBoolean not )
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
Nautilus>>showInstance [

	^ showInstance ifNil: [ showInstance := true ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
Nautilus>>showInstance: aBoolean [

	showInstance := aBoolean.
	self announcer announce: ( NautilusShowInstanceChanged boolean: aBoolean )
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
Nautilus>>sortHierarchically [

	^ sortHierarchically ifNil: [ sortHierarchically := self class sortHierarchically ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
Nautilus>>sortHierarchically: aBoolean [

	sortHierarchically := aBoolean.
	self announcer announce: ( NautilusShowHierarchyChanged boolean: aBoolean )
]

{
	#category : #'browser compatibility',
	#timestamp : ' 8/31/2017 05:26:22'
}
Nautilus>>spawnHierarchy [
	self
		sortHierarchically: true;
		open.
	self ui showHierarchy: true
]

{
	#category : #'browser compatibility',
	#timestamp : ' 8/31/2017 05:26:22'
}
Nautilus>>spawnHierarchyForClass: aClass selector: aSelector [
	self setClass: aClass selector: aSelector.
	self spawnHierarchy
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
Nautilus>>ui [

	^ ui
]
