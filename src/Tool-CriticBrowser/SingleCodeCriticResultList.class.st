"
I am a browser for the SmallLint Critics of a rule.
"
Class {
	#name : #SingleCodeCriticResultList,
	#superclass : #ComposableModel,
	#instVars : [
		'rule',
		'criticsModel',
		'toolbarModel',
		'sourceCodeModel',
		'textInputFieldModel',
		'cache',
		'thread'
	],
	#classInstVars : [
		'icons'
	],
	#category : #Tool-CriticBrowser,
	#timestamp : '<historical>'
}

{
	#category : #specs,
	#timestamp : ' 8/31/2017 05:26:37'
}
SingleCodeCriticResultList class>>defaultSpec [
	<spec>
	
	^ SpecLayout composed
		newColumn: [:c |
			c 
				add: #criticsModel;
				add: #toolbarModel height: 25;
				addSplitter;
				add: #textModel ]
]

{
	#category : #icons,
	#timestamp : ' 8/31/2017 05:26:37'
}
SingleCodeCriticResultList class>>exclamationIcon  [

	^  icons
			at: #'exclamationIcon'
			ifAbsentPut:[ Form fromBinaryStream: (Base64MimeConverter mimeDecodeToBytes: self  exclamationIconContents readStream) ].

]

{
	#category : #icons,
	#timestamp : ' 8/31/2017 05:26:37'
}
SingleCodeCriticResultList class>>exclamationIconContents [
	"Private - Method generated"
	^ 'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0
RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAJPSURBVDjLpZPLS5RhFMYfv9QJ
lelTQZwRb2OKlKuINuHGLlBEBEOLxAu46oL0F0QQFdWizUCrWnjBaDHgThCMoiKkhUONTqmj
mDp2GZ0UnWbmfc/ztrC+GbM2dXbv4ZzfeQ7vefKMMfifyP89IbevNNCYdkN2kawkCZKfSPZT
OGTf6Y/m1uflKlC3LvsNTWArr9BT2LAf+W73dn5jHclIBFZyfYWU3or7T4K7AJmbl/yG7EtX
1BQXNTVCYgtgbAEAYHlqYHlrsTEVQWr63RZFuqsfDAcdQPrGRR/JF5nKGm9xUxMyr0YBAEXX
HgIANq/3ADQobD2J9fAkNiMTMSFb9z8ambMAQER3JC1XttkYGGZXoyZEGyTHRuBuPgBTUu7V
SnUAgAUAWutOV2MjZGkehgYUA6O5A0AlkAyRnotiX3MLlFKduYCqAtuGXpyH0XQmOj+TIURt
51OzURTYZdBKV2UBSsOIcRp/TVTT4ewK6idECAihtUKOArWcjq/B8tQ6UkUR31+OYXP4sTOd
isivrkMyHodWejlXwcC38Fvs8dY5xaIId89VlJy7ACpCNCFCuOp8+BJ6A631gANQSg1mVmOx
xGQYRW2nHMha4B5WA3chsv22T5/B13AIicWZmNZ6cMchTXUe81Okzz54pLi0uQWp+TmkZqMw
xsBV74Or3od4OISPr0e3SHa3PX0f3HXKofNH/UIG9pZ5PeUth+CyS2EMkEqs4fPEOBJLsysk
e48/+xD8oxcAYPzs4QaS7RR2kbLTTOTQieczfzfTv8QPldGvTGoF6/8AAAAASUVORK5CYII='
]

{
	#category : #'class initialization',
	#timestamp : ' 8/31/2017 05:26:37'
}
SingleCodeCriticResultList class>>initialize [
	
	icons := IdentityDictionary new
]

{
	#category : #specs,
	#timestamp : ' 8/31/2017 05:26:37'
}
SingleCodeCriticResultList class>>title [

	^ 'Critic Browser'
]

{
	#category : #icons,
	#timestamp : ' 8/31/2017 05:26:37'
}
SingleCodeCriticResultList class>>wrenchOrangeIcon [

	^  icons
			at: #'wrenchOrangeIcon'
			ifAbsentPut:[ Form fromBinaryStream: (Base64MimeConverter mimeDecodeToBytes: self  wrenchOrangeIconContents readStream) ].

]

{
	#category : #icons,
	#timestamp : ' 8/31/2017 05:26:37'
}
SingleCodeCriticResultList class>>wrenchOrangeIconContents [
	"Private - Method generated"
	^ 'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0
RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAHaSURBVDjLlZO7a1NRHMfzfzhI
KQ5OHR1ddRRBLA6lg4iTd5PSas37YR56Y2JiHgg21uoFxSatCVFjbl5iNBBiMmUJgWwZhCB4
pR9/V4QKfSQdDufF5/v7nu85xwJYprV0Oq0kk8luIpEw4vG48f/eVDiVSikCTobDIePxmGg0
yokEBO4OBgNGoxH5fJ5wOHwygVgsZpjVW60WqqqWzbVgMIjf78fn8xlTBcTy736/T7VaJRQK
fQoEArqmafR6Pdxu9/ECkUjkglje63Q6NBoNisUihUKBcrlMpVLB6XR2D4df3VQnmRstsWzU
63WazSZmX6vV0HWdUqmEw+GY2Gw25SC8dV1l1wrZNX5s3qLdbpPL5fB6vXumZalq2O32rtVq
VQ6GuGnCd+HbFnx9AZrC+MkSHo/np8vlmj/M7f4ks6yysyawgB8fwPv70HgKG8v8cp/7fFRO
/+AllewqNJ/DhyBsi9A7J1QTkF4E69mXRws8u6ayvSJwRqoG4K2Md+ygxyF5FdbPaMfdlIXU
ZfiyAUWx/OY25O4JHBP4CtyZ16a9EwuRi1CXs+5K1ew6lB9DXERX517P8tEsPDzfNIP6C5Ye
QewSrJyeCd4P0bnwXYISy3MCn5oZNtsf3pH46e7XBJcAAAAASUVORK5CYII='
]

{
	#category : #menu,
	#timestamp : ' 8/31/2017 05:26:37'
}
SingleCodeCriticResultList>>addCriticToFalsePositive [
	
	criticsModel selectedItems
		ifNotNil: [ :items | items do: [ :item |
			cache
				addFalsePositive: item
				forRule: rule ]].
	
	
]

{
	#category : #menu,
	#timestamp : ' 8/31/2017 05:26:37'
}
SingleCodeCriticResultList>>addCriticToToDo [

	criticsModel selectedItems
		ifNotNil: [ :items | items do: [ :item |
			cache
				addToDo: item
				forRule: rule ]].
		

]

{
	#category : #menu,
	#timestamp : ' 8/31/2017 05:26:37'
}
SingleCodeCriticResultList>>addMarkingMenuItemsTo: aMenu [
	(criticsModel selectedItems anySatisfy: [ :critic | cache isFalsePositive: critic forRule: rule ]) 
		ifTrue: [ aMenu add: 'Unmark as wrong' target: self selector: #removeCriticToFalsePositive ].
	(criticsModel selectedItems anySatisfy: [ :critic | (cache isFalsePositive: critic forRule: rule) not ]) 
		ifTrue: [ aMenu add: 'Mark as wrong' target: self selector: #addCriticToFalsePositive ].
	(criticsModel selectedItems anySatisfy: [ :critic | cache isToDo: critic forRule: rule ]) 
		ifTrue: [ aMenu add: 'Unmark as TODO' target: self selector: #removeCriticToToDo ].
	(criticsModel selectedItems anySatisfy: [ :critic | (cache isToDo: critic forRule: rule) not ]) 
		ifTrue: [ aMenu add: 'Mark as TODO' target: self selector: #addCriticToToDo ].
	
]

{
	#category : #menu,
	#timestamp : ' 8/31/2017 05:26:37'
}
SingleCodeCriticResultList>>addNavigationMenuItemsTo: aMenu [

	criticsModel selectedItem ifNotNil: [ :critique |
		critique sourceAnchor entity populateCBMenu: aMenu ]
]

{
	#category : #menu,
	#timestamp : ' 8/31/2017 05:26:37'
}
SingleCodeCriticResultList>>addRuleToFalsePositive [

	criticsModel selectedItems ifNotNil: [ :criticss |
		criticss do: [ :critic |
			cache addFalsePositiveRule: rule forPackage: critic mcWorkingCopy]].
]

{
	#category : #menu,
	#timestamp : ' 8/31/2017 05:26:37'
}
SingleCodeCriticResultList>>browseCritic [
	criticsModel selectedItem
		ifNotNil: [ :element |
			| entity |
			entity := element sourceAnchor entity.
			entity isBehavior 
				ifTrue: [ entity theNonMetaClass browse ]
				ifFalse: [ entity browse ] ] 
]

{
	#category : #menu,
	#timestamp : ' 8/31/2017 05:26:37'
}
SingleCodeCriticResultList>>browseDependencies [
	criticsModel selectedItems ifNotNil: [ :packages |
		(DAPackageAnalyzerPackageDependenciesWindow onPackagesNamed: (packages collect: #packageName)) open ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
SingleCodeCriticResultList>>cache:  acache  [
	cache := acache
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
SingleCodeCriticResultList>>criticsModel [
	^ criticsModel
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:37'
}
SingleCodeCriticResultList>>criticsModelContains: aCritic [

	^ criticsModel listItems anySatisfy: [ :each |
			 each sourceAnchor entity name = aCritic name]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:37'
}
SingleCodeCriticResultList>>criticsOf: aRule [
	cache ifNil: [^ {}].
	criticsModel items: ((cache criticsOf: aRule)
				sorted: [ :a :b | 
					a printString < b printString ]).
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:37'
}
SingleCodeCriticResultList>>defaultColor [
	^ Color red
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:37'
}
SingleCodeCriticResultList>>diffSeparator [

	^ '——————————————————
	
'
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:37'
}
SingleCodeCriticResultList>>diffTextForChange: aRefactoryChange [
	| text builder |

	text := Text new.
	builder := PrettyTextDiffBuilder new.
	aRefactoryChange changes
		do: [ :chng |
			builder
				from: chng oldVersionTextToDisplay
				to: chng textToDisplay.
			text append: builder buildDisplayPatch ]
		separatedBy: [ text append: self diffSeparator ].
	
	^ text
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:37'
}
SingleCodeCriticResultList>>falsePositiveColor [
	^ Color darkGray
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:37'
}
SingleCodeCriticResultList>>formatCritic: aCritic [
	
	^  String streamContents: [:s | aCritic sourceAnchor entity criticNameOn: s ]

]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:37'
}
SingleCodeCriticResultList>>iconFor: anItem [
	
	^  (cache isFalsePositive: anItem forRule: rule) 
			ifFalse: [(cache isToDo: anItem forRule: rule)
				ifTrue: [ self class wrenchOrangeIcon ]
				ifFalse: [ self class exclamationIcon ] ]
]

{
	#category : #menu,
	#timestamp : ' 8/31/2017 05:26:37'
}
SingleCodeCriticResultList>>implementorsOfCritic [
	criticsModel selectedItem ifNotNil: [ :item | item browse] 

]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:37'
}
SingleCodeCriticResultList>>initialize [

	super initialize.
	self initializeShortcuts
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:37'
}
SingleCodeCriticResultList>>initializeActionToPerformOnTextModel [
	
	| selectedItem |
	sourceCodeModel acceptBlock:  [ :text | 	
		selectedItem := criticsModel selectedItem sourceAnchor entity.
		(selectedItem isCompiledMethod and: [ rule isTransformationRule not ])
			ifTrue: [ selectedItem methodClass compile: text ] 
			ifFalse: [ Smalltalk compiler evaluate:  text ]]
	

]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:37'
}
SingleCodeCriticResultList>>initializeDisplayCritic: aCritic forRule: aRule [
	
	| criticRepresentation | 
	criticRepresentation := (self formatCritic: aCritic) asMorph.
	^ (cache isFalsePositive: aCritic forRule: aRule) 
			ifTrue: [ criticRepresentation color: self falsePositiveColor ]
			ifFalse: [ (cache isToDo: aCritic forRule: aRule)
						ifTrue: [ criticRepresentation color: self toDoColor ]
						ifFalse: [ criticRepresentation color: self defaultColor ]]
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:37'
}
SingleCodeCriticResultList>>initializePresenter [

	self whenSelectedItemChangesOnListModel.
	


]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:37'
}
SingleCodeCriticResultList>>initializeShortcuts [
	criticsModel bindKeyCombination: PharoShortcuts current browseShortcut toAction: [ self browseCritic ]
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:37'
}
SingleCodeCriticResultList>>initializeTextInputFieldModel [

	|critics|
	textInputFieldModel 
		autoAccept: true;
		ghostText: 'Search field';
		text: ' ';
		removeEntryCompletion.	
	textInputFieldModel acceptBlock: [ :text | |matchText|
		critics :=cache criticsOf: rule.
		matchText := '*', text, '*'.
		criticsModel items: (text isEmpty 
			ifTrue: [ critics ]
			ifFalse: [ critics select: [ :critic |
				matchText match: (self formatCritic: critic)]]).
		criticsModel updateList ]

]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:37'
}
SingleCodeCriticResultList>>initializeToolBar [
	
	self toolbarModel whenFalsePositiveClickedDo: [ self addCriticToFalsePositive ].


]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:37'
}
SingleCodeCriticResultList>>initializeWidgets [
	criticsModel := self newIconList.
	sourceCodeModel := self newCode.
	toolbarModel := self instantiate: CriticToolbar.
	textInputFieldModel := self newTextInput.

	criticsModel beMultipleSelection.
	self initializeTextInputFieldModel.
	self initializeToolBar.
	self initializeActionToPerformOnTextModel.
	criticsModel displayBlock: [:selec |
		self initializeDisplayCritic: selec forRule: rule]. 
	
	criticsModel menu: [ :a :b | self menu: a shifted: b ].
	criticsModel icons: [ :item | self iconFor: item ].
	
	self focusOrder
		add: criticsModel;
		add: toolbarModel;
		add: sourceCodeModel.

]

{
	#category : #menu,
	#timestamp : ' 8/31/2017 05:26:37'
}
SingleCodeCriticResultList>>menu: aMenu shifted: aBoolean [
	(rule notNil and: [ criticsModel selectedItems notEmpty ])
		ifFalse: [ ^ aMenu ]. 
		
	self addNavigationMenuItemsTo: aMenu.
	aMenu addLine.
	self addMarkingMenuItemsTo: aMenu.
			
	criticsModel selectedItem
		ifNotNil: [ :critique |
		critique actions ifNotEmpty: [ :actions |
			aMenu addLine.
			actions do: [ :action |
				aMenu
					add: action description
					target: action
					selector: #actOnCritic:ofEntity:
					argumentList: {
						critique .
						critique sourceAnchor entity } ] ] ].
			
	^ aMenu
]

{
	#category : #menu,
	#timestamp : ' 8/31/2017 05:26:37'
}
SingleCodeCriticResultList>>removeCriticToFalsePositive [
	
	criticsModel selectedItems
		ifNotNil: [ :items | items do: [ :item |
			cache removeFalsePositive: item forRule: rule ]].
	
]

{
	#category : #menu,
	#timestamp : ' 8/31/2017 05:26:37'
}
SingleCodeCriticResultList>>removeCriticToToDo [

	criticsModel selectedItems
		ifNotNil: [:items | items do: [ :item |
			cache removeToDo: item forRule: rule ]].
	
	
]

{
	#category : #menu,
	#timestamp : ' 8/31/2017 05:26:37'
}
SingleCodeCriticResultList>>removeRuleToFalsePositive [

	criticsModel selectedItems ifNotNil: [ :criticss |
		criticss do: [ :critic |
			cache removeFalsePositiveRule: rule forPackage: critic sourceAnchor entity mcWorkingCopy]].
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:37'
}
SingleCodeCriticResultList>>resetSelection [
	self criticsModel resetSelection
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
SingleCodeCriticResultList>>rule [
	^ rule
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:37'
}
SingleCodeCriticResultList>>rule: aRule [

	rule := aRule.
	(rule isNil or: [ rule isComposite ]) 
		ifTrue: [ ^ self ].	
	self criticsOf:  aRule.
	toolbarModel rule: rule.
]

{
	#category : #'smartSuggestions - support',
	#timestamp : ' 8/31/2017 05:26:37'
}
SingleCodeCriticResultList>>selectedMessage [
	^ nil
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:37'
}
SingleCodeCriticResultList>>selectionIntervalFor: aString [
	^ rule result selectionIntervalFor: aString
]

{
	#category : #menu,
	#timestamp : ' 8/31/2017 05:26:37'
}
SingleCodeCriticResultList>>sendersOfCritic [

	| abstractTool |
	abstractTool := AbstractTool new. 	
	criticsModel selectedItem
		ifNotNil: [ :elem | 
			elem isBehavior 
				ifTrue: [ abstractTool browseClassRefsOf: elem ]
				ifFalse: [ abstractTool browseSendersOfMessagesFrom: elem selector ] ] 
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:37'
}
SingleCodeCriticResultList>>setTextModelForClassOrMethod: aCritique [

	| entity |
	entity := aCritique sourceAnchor entity.
	self flag: 'Another hack. We need a better way to display entities (because now we may get not only classes and methods. Maybe something like GTInspector presentations could work)'.
	sourceCodeModel text: (
		(entity respondsTo: #definition)
			ifTrue: [ entity definition ]
			ifFalse: [ entity asString ]).
	sourceCodeModel aboutToStyle: true.
	sourceCodeModel behavior: (
		entity isCompiledMethod
			ifTrue: [ entity methodClass ]
			ifFalse: [ nil ]).
	aCritique sourceAnchor providesInterval ifTrue: [ 
		sourceCodeModel setSelection: aCritique sourceAnchor interval ]
	
	
					
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:37'
}
SingleCodeCriticResultList>>setTextModelForNil [

	| text |
	text := rule rationale isEmpty 
		ifTrue: [ rule name ]
		ifFalse: [ rule rationale ]. 
	sourceCodeModel aboutToStyle: false.
	sourceCodeModel text: text.
	sourceCodeModel behavior: nil.
	toolbarModel critic: nil 
	
	
					
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:37'
}
SingleCodeCriticResultList>>setTextModelForTransformationRule: selection [
	
	sourceCodeModel behavior: nil.
	sourceCodeModel text: (
		self diffTextForChange: selection change).
	sourceCodeModel aboutToStyle: false.

									
					
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
SingleCodeCriticResultList>>textInputFieldModel [
	^ textInputFieldModel
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
SingleCodeCriticResultList>>textModel [
	^ sourceCodeModel
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:37'
}
SingleCodeCriticResultList>>toDoColor [
	^ Color orange
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
SingleCodeCriticResultList>>toolbarModel [
	^ toolbarModel
]

{
	#category : #menu,
	#timestamp : ' 8/31/2017 05:26:37'
}
SingleCodeCriticResultList>>transformCritic [
	
	criticsModel selectedItems ifNotNil: [ :items |
		items do: [:critic | critic change execute ]  displayingProgress: [:critic|]]
]

{
	#category : #thread,
	#timestamp : ' 8/31/2017 05:26:37'
}
SingleCodeCriticResultList>>updateList [

	self criticsOf: rule.
	thread ifNotNil: [ thread terminate ].
	thread := [ UIManager default defer:  [ criticsModel updateList ]] fork.
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:37'
}
SingleCodeCriticResultList>>whenSelectedItemChangesOnListModel [

	criticsModel whenSelectedItemChanged: [ :critique |
		sourceCodeModel setSelection: (0 to: 0). 	
		rule ifNotNil: [
			critique
				ifNil: [ self setTextModelForNil ]
				ifNotNil: [  
					toolbarModel critic: critique.
					critique providesChange 
					ifTrue: [ self setTextModelForTransformationRule: critique ]
					ifFalse: [ self setTextModelForClassOrMethod: critique ] ] ] ]		
]
