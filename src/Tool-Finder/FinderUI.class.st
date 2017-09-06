"
A FinderUI is a UI used to render a Finder instance.

This tool is used to look for selectors, class, source code or patterns through the system, or through a specified environment
"
Class {
	#name : #FinderUI,
	#superclass : #MorphTreeModel,
	#instVars : [
		'finder',
		'forceSearch',
		'searchingTextArea',
		'sourceTextArea',
		'useRegExCheckbox',
		'searchedTextList',
		'sourceTextModel'
	],
	#classInstVars : [
		'searchedTextListMaxSize'
	],
	#category : #Tool-Finder,
	#timestamp : '<historical>'
}

{
	#category : #'event subscriptions',
	#timestamp : ' 8/31/2017 05:26:26'
}
FinderUI class>>doAllSubscriptionsOn: aFinder to: anInstance [
	self subscribesUpdateSourceCodeOn: aFinder to: anInstance.
	self subscribesResetEnvironmentOn: aFinder to: anInstance.
	self subscribesEnableUseRegExOn: aFinder to: anInstance.
	self subscribesDisableUseRegExOn: aFinder to: anInstance.
	self subscribesUpdateSelectedMethodOn: aFinder to: anInstance.
	self subscribesUpdateSelectedClassOn: aFinder to: anInstance.
	self subscribesUpdateListOn: aFinder to: anInstance
]

{
	#category : #icons,
	#timestamp : ' 8/31/2017 05:26:26'
}
FinderUI class>>icon [
	^ self iconNamed: #smallFindIcon
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:26'
}
FinderUI class>>initialize [
	searchedTextListMaxSize := 15
]

{
	#category : #explanations,
	#timestamp : ' 8/31/2017 05:26:26'
}
FinderUI class>>methodFinderExplanation [
	"The comment in the bottom pane"

	false ifTrue: [MethodFinder methodFor: #( (4 3) 7  (0 5) 5  (5 5) 10)].
		"to keep the method methodFor: from being removed from the system"

	^ 'Type a fragment of a selector in the search box and click <Search>.

Or, use an example to find a method in the system.  An example is made up of the following three items separated by a period: receiver. args. answer.    For example, type: 3. 4. 7. into the search box and click <Search>

Alternatively, in this bottom pane, use #methodFor: directly to find a method in the system.  Select this line of code and choose "print it".  

	MethodFinder methodFor: #( (4 3) 7  (0 5) 5  (5 5) 10).
This will discover (data1 + data2).

You supply inputs and answers and the system will find the method.  Each inner array is a list of inputs.  It contains the receiver and zero or more arguments.  For Booleans and any computed arguments, use brace notation.

	MethodFinder methodFor: { {1. 3}. true.  {20. 10}. false}.
This will discover the expressions (data1 < data2), (data2 > data1), and many others.

	MethodFinder methodFor: { {''29 Apr 1999'' asDate}. ''Thursday''.  
		{''30 Apr 1999'' asDate}. ''Friday'' }.
This will discover the expression (data1 weekday)

Receiver and arguments do not have to be in the right order.
See MethodFinder.verify for more examples.'
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:26'
}
FinderUI class>>on: aFinder [
	| instance |
	instance := self new finder: aFinder.
	self doAllSubscriptionsOn: aFinder to: instance.
	^instance.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:26'
}
FinderUI class>>searchedTextListMaxSize: anInteger [

	self allInstancesDo: [:each | each searchedTextListMaxSize: anInteger].
	searchedTextListMaxSize := anInteger
]

{
	#category : #'event subscriptions',
	#timestamp : ' 8/31/2017 05:26:26'
}
FinderUI class>>subscribesDisableUseRegExOn: aFinder to: anInstance. [
	aFinder
		when: #disableUseRegEx
		send: #disableUseRegEx
		to: anInstance.
]

{
	#category : #'event subscriptions',
	#timestamp : ' 8/31/2017 05:26:26'
}
FinderUI class>>subscribesEnableUseRegExOn: aFinder to: anInstance [
	aFinder
		when: #enableUseRegEx
		send: #enableUseRegEx
		to: anInstance.
]

{
	#category : #'event subscriptions',
	#timestamp : ' 8/31/2017 05:26:26'
}
FinderUI class>>subscribesResetEnvironmentOn: aFinder to: anInstance  [
	aFinder
		when: #resetEnvironment
		send: #resetEnvironment
		to: anInstance
]

{
	#category : #'event subscriptions',
	#timestamp : ' 8/31/2017 05:26:26'
}
FinderUI class>>subscribesUpdateListOn: aFinder to: anInstance [
	aFinder
		when: #updateResultDictionary
		send: #updateList
		to: anInstance.
]

{
	#category : #'event subscriptions',
	#timestamp : ' 8/31/2017 05:26:26'
}
FinderUI class>>subscribesUpdateSelectedClassOn: aFinder to: anInstance [
	aFinder
		when: #updateSelectedClass
		send: #updateSelectedClass
		to: anInstance.
]

{
	#category : #'event subscriptions',
	#timestamp : ' 8/31/2017 05:26:26'
}
FinderUI class>>subscribesUpdateSelectedMethodOn: aFinder to: anInstance [
	aFinder
		when: #updateSelectedMethod
		send: #updateSelectedMethod
		to: anInstance.
]

{
	#category : #'event subscriptions',
	#timestamp : ' 8/31/2017 05:26:26'
}
FinderUI class>>subscribesUpdateSourceCodeOn: aFinder to: anInstance [
	aFinder
		when: #updateSourceCode
		send: #updateSourceCode
		to: anInstance.
]

{
	#category : #icons,
	#timestamp : ' 8/31/2017 05:26:26'
}
FinderUI class>>taskbarIconName [
	^#smallFindIcon
]

{
	#category : #'items creation',
	#timestamp : ' 8/31/2017 05:26:26'
}
FinderUI>>addAllItems: aWindow [
	| toolbar height  btnFont  btnToolbar cst |
	toolbar := self buildSearchModeToolBar: aWindow.
	height := toolbar minExtent y.
	cst := 15.
	
	aWindow 
		addMorph: toolbar
		fullFrame: ( (0 @ 0 corner: 1 @ 0) asLayoutFrame bottomOffset: height).
	aWindow
		addMorph: self buildPackagesTree buildContents
		fullFrame: ((0@0 corner: 1@0.58) asLayoutFrame topOffset: height).
	btnFont := StandardFonts buttonFont.
	btnToolbar := self buildBrowseToolBar: aWindow.
	aWindow
		addMorph: btnToolbar
		fullFrame: ((0@0.58 corner: 1@0.58) asLayoutFrame bottomOffset: (btnFont height +cst)).
	aWindow 
		addMorph: self sourceTextArea
		fullFrame: ((0@0.58 corner: 1@1) asLayoutFrame topOffset: btnFont height +cst)

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:26'
}
FinderUI>>addToSearchedTextList: aString  [
	self searchedTextList: (self searchedTextList
			remove: aString
			ifAbsent: [];
			 yourself).
	self searchedTextList size = self searchedTextListMaxSize
		ifTrue: [self searchedTextList removeLast].
	self searchedTextList addFirst: aString 
]

{
	#category : #'buttons behavior',
	#timestamp : ' 8/31/2017 05:26:26'
}
FinderUI>>allClassesButtonAction [

	self finder packagesSelection: self environment.
]

{
	#category : #'buttons behavior',
	#timestamp : ' 8/31/2017 05:26:26'
}
FinderUI>>allClassesButtonLabel [
	^ 'All Packages'
]

{
	#category : #'buttons behavior',
	#timestamp : ' 8/31/2017 05:26:26'
}
FinderUI>>allClassesButtonState [
	^false
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:26'
}
FinderUI>>autoSelection [
	| aString firstIndex interval string size |

	(self searchingString isEmpty or: [ self useRegEx] )
		ifTrue: [^ 0 to:0 ].
	
	self isSourceSymbol ifFalse: [^ 0 to: 0].
		
	aString := self sourceTextModel getString asLowercase.
	
	aString = self defaultExplanation asLowercase
		ifTrue: [ ^ 0 to: 0].
	
	string := self searchingString asLowercase.
	(string includes: $*)
		ifTrue: [| list lastIndex|
			list := string substrings: '*'.
			firstIndex := aString findString: list first.
			lastIndex := (aString findString: list last startingAt: firstIndex) + list last size - 1.
			interval := firstIndex to: lastIndex]
		ifFalse: [
			firstIndex := aString findString: string.
			size := string size.
			interval := firstIndex to: (firstIndex + size - 1)].
		
	^ firstIndex = 0 
		ifTrue: [ 0 to:0 ]
		ifFalse: [interval]
]

{
	#category : #'buttons behavior',
	#timestamp : ' 8/31/2017 05:26:26'
}
FinderUI>>browseButtonAction [

	self selectedNode browse.
]

{
	#category : #'buttons behavior',
	#timestamp : ' 8/31/2017 05:26:26'
}
FinderUI>>browseButtonLabel [
	^'Browse'
]

{
	#category : #'buttons behavior',
	#timestamp : ' 8/31/2017 05:26:26'
}
FinderUI>>browseButtonState [
	^self selectedClass isNil or: [self selectedMethod isNil]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:26'
}
FinderUI>>browsedEnvironment [
	^ self environment 
]

{
	#category : #'items creation',
	#timestamp : ' 8/31/2017 05:26:26'
}
FinderUI>>buildAllClassesButton [
	^ PluggableButtonMorph 
			on: self 
			getState: #allClassesButtonState 
			action: #allClassesButtonAction 
			label: #allClassesButtonLabel
]

{
	#category : #'items creation',
	#timestamp : ' 8/31/2017 05:26:26'
}
FinderUI>>buildAllTextArea [
	self buildSearchingTextArea.
	self buildSourceTextArea.
]

{
	#category : #'items creation',
	#timestamp : ' 8/31/2017 05:26:26'
}
FinderUI>>buildBrowseButton [
	^ (PluggableButtonMorph 
			on: self 
			getState: #browseButtonState 
			action: #browseButtonAction 
			label: #browseButtonLabel)
			hResizing: #spaceFill
]

{
	#category : #'items creation',
	#timestamp : ' 8/31/2017 05:26:26'
}
FinderUI>>buildBrowseToolBar: aWindow [
	| toolbar |
	toolbar := aWindow newToolbar: {
		self buildBrowseButton.
		self buildSendersButton.
		self buildImplementorsButton.
		self buildVersionsButton.
		self buildInheritanceButton.
		self buildHierarchyButton}.
	^toolbar hResizing: #shrinkWrap
]

{
	#category : #'text areas behavior',
	#timestamp : ' 8/31/2017 05:26:26'
}
FinderUI>>buildDescriptionOf: aClass [
	^ String
		streamContents:
			[ :stream | 
			stream nextPutAll: aClass definition.
			aClass hasComment
				ifTrue: [ stream
						cr;
						cr;
						cr;
						nextPutAll: aClass comment ] ]
]

{
	#category : #'items creation',
	#timestamp : ' 8/31/2017 05:26:26'
}
FinderUI>>buildEnvironmentButton [
	^ (PluggableButtonMorph 
			on: self 
			getState: #environmentButtonState 
			action: #environmentButtonAction 
			label: #environmentButtonLabel)
			beSticky
]

{
	#category : #'items creation',
	#timestamp : ' 8/31/2017 05:26:26'
}
FinderUI>>buildHierarchyButton [
	^ (PluggableButtonMorph 
			on: self 
			getState: #hierarchyButtonState 
			action: #hierarchyButtonAction 
			label: #hierarchyButtonLabel)
			hResizing: #spaceFill
]

{
	#category : #'items creation',
	#timestamp : ' 8/31/2017 05:26:26'
}
FinderUI>>buildImplementorsButton [
	^ (PluggableButtonMorph 
			on: self 
			getState: #implementorsButtonState 
			action: #implementorsButtonAction 
			label: #implementorsButtonLabel)
			hResizing: #spaceFill
]

{
	#category : #'items creation',
	#timestamp : ' 8/31/2017 05:26:26'
}
FinderUI>>buildInheritanceButton [
	^ (PluggableButtonMorph 
			on: self 
			getState: #inheritanceButtonState 
			action: #inheritanceButtonAction 
			label: #inheritanceButtonLabel)
			hResizing: #spaceFill
]

{
	#category : #'items creation',
	#timestamp : ' 8/31/2017 05:26:26'
}
FinderUI>>buildPackagesTree [
	^ self defaultTreeMorph
]

{
	#category : #'items creation',
	#timestamp : ' 8/31/2017 05:26:26'
}
FinderUI>>buildRegExChooser [
	| string btnHeight btnWidth |
	string := 'Regexp'.
	btnHeight := StandardFonts buttonFont height + 8.
	btnWidth := 0.
	string do: [:c | btnWidth := btnWidth + (StandardFonts buttonFont widthOf: c)].
	^useRegExCheckbox := (CheckboxMorph 
									on: self finder
									selected: #useRegEx
									changeSelected: #useRegEx:)
									beCheckbox;
									vResizing: #rigid;
									height: btnHeight;
									width: btnWidth + 30;
									label: string
]

{
	#category : #'items creation',
	#timestamp : ' 8/31/2017 05:26:26'
}
FinderUI>>buildSearchButton [
	^ (PluggableButtonMorph 
			on: self 
			getState: #searchButtonState 
			action: #searchButtonAction 
			label: #searchButtonLabel)
			hResizing: #shrinkWrap
]

{
	#category : #'items creation',
	#timestamp : ' 8/31/2017 05:26:26'
}
FinderUI>>buildSearchModeDropListIn: aWindow [
			^(self theme 
				newDropListIn: aWindow
				for:self				
				list: #searchModesList
				getSelected: #currentSearchMode
				setSelected: #currentSearchMode:
				getEnabled: nil
				useIndex: false 
				help: self searchModeHelpText) hResizing: #rigid; width: 120; yourself

]

{
	#category : #'items creation',
	#timestamp : ' 8/31/2017 05:26:26'
}
FinderUI>>buildSearchModeToolBar: aWindow [
	^aWindow newToolbar: {
		self buildSearchingTextArea.
		self buildSearchButton.
		self buildRegExChooser.
		self buildSearchModeDropListIn: aWindow.
		self buildEnvironmentButton.
		self buildAllClassesButton}.
]

{
	#category : #'items creation',
	#timestamp : ' 8/31/2017 05:26:26'
}
FinderUI>>buildSearchingTextArea [
	^ searchingTextArea := 
		(EditableDropListMorph
				on: self
				list: #searchedTextList
				selected: #searchingString
				changeSelected: #searchingAccept:
				useIndex: false 
				addToList: #addToSearchedTextList:
				class: String
				getEnabled: nil) hResizing: #spaceFill; 
				ghostText: 'Hit return to accept' translated.

	
]

{
	#category : #'items creation',
	#timestamp : ' 8/31/2017 05:26:26'
}
FinderUI>>buildSendersButton [
	^ (PluggableButtonMorph 
			on: self 
			getState: #sendersButtonState 
			action: #sendersButtonAction 
			label: #sendersButtonLabel)
			hResizing: #spaceFill
]

{
	#category : #'items creation',
	#timestamp : ' 8/31/2017 05:26:26'
}
FinderUI>>buildSourceTextArea [
	sourceTextArea := self sourceTextModel newScrolledText
		beForSmalltalkCode;
		beWrapped;
		yourself.
	sourceTextArea textArea announcer when: RubTextAcceptRequest send: #whenTextAcceptedInView: to: self.
	self updateSourceCode.
	^ sourceTextArea
]

{
	#category : #'items creation',
	#timestamp : ' 8/31/2017 05:26:26'
}
FinderUI>>buildVersionsButton [
	^ (PluggableButtonMorph 
			on: self 
			getState: #versionsButtonState 
			action: #versionsButtonAction 
			label: #versionsButtonLabel)
			hResizing: #spaceFill
]

{
	#category : #'text areas behavior',
	#timestamp : ' 8/31/2017 05:26:26'
}
FinderUI>>collectFromPackages: aCollection [
	self packagesSelection: (self environment forPackageNames: aCollection)
]

{
	#category : #'text areas behavior',
	#timestamp : ' 8/31/2017 05:26:26'
}
FinderUI>>compileSource: aString notifying: aController [

	| class method |
	(self selectedClass isNil or: [ self selectedMethod isNil ])
		ifTrue:[
			self changed: #clearUserEdits.
			^self].
	class := self selectedClass.
	method := class compiledMethodAt: self selectedMethod.
	(class compile: (aString asString) classified: method category notifying: aController)
			ifNil: [^ self ]
			ifNotNil: [:selector |
				self changed: #clearUserEdits ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:26'
}
FinderUI>>constructPackagesSet [
	| result |
	result := ((self environment packages collect:#name )difference: (self packagesSelection packages collect:#name)).
	^result asSet asSortedCollection: [:a :b | a<b]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:26'
}
FinderUI>>constructPackagesSet: aPackageEnvironment [
	| result |
	result := aPackageEnvironment packages collect:[:c | c name].
		^(result reject: [:each | each isNil]) asSet asSortedCollection: [:a :b | a < b ].
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:26'
}
FinderUI>>currentSearchMode [
	^self finder currentSearchMode
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:26'
}
FinderUI>>currentSearchMode: aSymbol [
	
	self finder searchingStringSilently: self searchingTextArea contentMorph textMorph text asString.
	self searchingTextArea contentMorph textMorph hasUnacceptedEdits:false.
	self finder currentSearchMode: aSymbol.
	.
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:26'
}
FinderUI>>defaultExplanation [
^
'The Finder can be used in 4 different ways:
	- Selectors: your research is done among selectors
	- Classes : your research is done among classes names
	- Source : your research is done among all the source code
	- Pragmas: your research is done among pragmas
	- Examples : your research uses the Method Finder behavior 
			   (for further informations, print ''FinderUI methodFinderExplanation'')
	
			
In these four modes, you can also tick the ''Use RegEx'' checkbox.
If you pick this box, your search will be done using regular expressions instead of just matching.

The ''Select classes'' button opened a dialog window  to select which classes will be used for the search.
The ''All classes'' button is used to reset the classes selection.'
]

{
	#category : #'items creation',
	#timestamp : ' 8/31/2017 05:26:26'
}
FinderUI>>defaultTreeMorph [
	|  col |
	col := MorphTreeColumn new
		rowMorphGetSelector: [:node | node displayString asMorph ].
	
	self headerLabel
		ifNotNil: [	col headerButtonLabel: self headerLabel font: nil].
			
	^ (self treeMorphClass on: self) 
			columns:  (Array with: col);
			hResizing: #spaceFill;
			vResizing: #spaceFill;
			resizerWidth: 0;
			columnInset: 0; 
			rowInset: 2; 
			keystrokeActionSelector: #keyStroke:;
			"preferedPaneColor: Color white;"
			multiSelection: self multiSelection;
			autoMultiSelection: self autoMultiSelection;
			isCheckList: self isCheckList;
			doubleClickSelector: #doubleClick;
			getMenuSelector: #menu:shifted:";
			rowColorForEven: Color veryLightGray muchLighter odd: Color white".
]

{
	#category : #display,
	#timestamp : ' 8/31/2017 05:26:26'
}
FinderUI>>defaultWindowLabel [
	^'Finder'.
]

{
	#category : #checkbox,
	#timestamp : ' 8/31/2017 05:26:26'
}
FinderUI>>disableUseRegEx [
	useRegExCheckbox isSelected
		ifTrue: [ useRegExCheckbox toggleSelected].
	useRegExCheckbox enabled: false.

]

{
	#category : #'do it requirements',
	#timestamp : ' 8/31/2017 05:26:26'
}
FinderUI>>doItContext [

	^ nil
]

{
	#category : #'do it requirements',
	#timestamp : ' 8/31/2017 05:26:26'
}
FinderUI>>doItReceiver [

	^ self selectedClass ifNotNil: [:selectedClass | selectedClass theNonMetaClass].
]

{
	#category : #'events handling',
	#timestamp : ' 8/31/2017 05:26:26'
}
FinderUI>>doubleClick [
	self selectedNode doubleClick
]

{
	#category : #checkbox,
	#timestamp : ' 8/31/2017 05:26:26'
}
FinderUI>>enableUseRegEx [
	useRegExCheckbox 
		enabled: true;
		updateEnabled
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:26'
}
FinderUI>>environment [

	^ self finder environment.
]

{
	#category : #'buttons behavior',
	#timestamp : ' 8/31/2017 05:26:26'
}
FinderUI>>environmentButtonAction [
	self openPackageChooser
]

{
	#category : #'buttons behavior',
	#timestamp : ' 8/31/2017 05:26:26'
}
FinderUI>>environmentButtonLabel [
	^ 'Packages...'
]

{
	#category : #'buttons behavior',
	#timestamp : ' 8/31/2017 05:26:26'
}
FinderUI>>environmentButtonState [
	^false.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:26'
}
FinderUI>>finder [
	^finder
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:26'
}
FinderUI>>finder: aFinder [
	finder := aFinder
]

{
	#category : #searching,
	#timestamp : ' 8/31/2017 05:26:26'
}
FinderUI>>forSelectorsDo: selectorBlock forClassNamesDo: classNamesBlock forSourceDo: sourceBlock forExamplesDo: exampleBlock forPragmasDo: pragmaBlock [

	self isSelectorsSymbol
		ifTrue: [^selectorBlock value].
	self isClassNamesSymbol
		ifTrue: [^classNamesBlock value].
	self isSourceSymbol
		ifTrue: [^sourceBlock value].
	self isExamplesSymbol
		ifTrue: [^exampleBlock value].
	self isPragmasSymbol
		ifTrue: [^pragmaBlock value].
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:26'
}
FinderUI>>forceSearch [

	 ^ forceSearch ifNil: [forceSearch := false].
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:26'
}
FinderUI>>hierarchy [
	
		self selectedClass ifNotNil: [ :class |
			self selectedMethod
				ifNil: [SystemNavigation new browseHierarchy: class]
				ifNotNil: [:selector | 
					SystemNavigation new browseHierarchy:class selector: selector]]
]

{
	#category : #'buttons behavior',
	#timestamp : ' 8/31/2017 05:26:26'
}
FinderUI>>hierarchyButtonAction [
	self hierarchy.
]

{
	#category : #'buttons behavior',
	#timestamp : ' 8/31/2017 05:26:26'
}
FinderUI>>hierarchyButtonLabel [
	^'Hierarchy'
]

{
	#category : #'buttons behavior',
	#timestamp : ' 8/31/2017 05:26:26'
}
FinderUI>>hierarchyButtonState [
	^self selectedClass isNil.
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:26'
}
FinderUI>>implementors [

	self selectedMethod ifNil: [^self].
 	SystemNavigation new browseAllImplementorsOf: self selectedMethod
]

{
	#category : #'buttons behavior',
	#timestamp : ' 8/31/2017 05:26:26'
}
FinderUI>>implementorsButtonAction [
	self implementors.
]

{
	#category : #'buttons behavior',
	#timestamp : ' 8/31/2017 05:26:26'
}
FinderUI>>implementorsButtonLabel [
	^'Implementors'
]

{
	#category : #'buttons behavior',
	#timestamp : ' 8/31/2017 05:26:26'
}
FinderUI>>implementorsButtonState [
	^self selectedMethod isNil | self isClassNamesSymbol.
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:26'
}
FinderUI>>inheritance [
	
		self selectedClass ifNotNil: [ :class |.
				self selectedMethod ifNotNil: [:selector | 
					SystemNavigation new methodHierarchyBrowserForClass: class selector: selector]]
]

{
	#category : #'buttons behavior',
	#timestamp : ' 8/31/2017 05:26:26'
}
FinderUI>>inheritanceButtonAction [
	self inheritance.
]

{
	#category : #'buttons behavior',
	#timestamp : ' 8/31/2017 05:26:26'
}
FinderUI>>inheritanceButtonLabel [
	^'Inheritance'
]

{
	#category : #'buttons behavior',
	#timestamp : ' 8/31/2017 05:26:26'
}
FinderUI>>inheritanceButtonState [
	^self selectedClass isNil | self isClassNamesSymbol.
]

{
	#category : #display,
	#timestamp : ' 8/31/2017 05:26:26'
}
FinderUI>>initialExtent [
	^700 @ 500
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:26'
}
FinderUI>>initialize [
	super initialize.
	finder := nil.
	forceSearch := nil.
	searchingTextArea := nil.
	sourceTextArea := nil.
	useRegExCheckbox := nil.
	wrapBlockOrSelector := [ :i | i asString ] 
]

{
	#category : #'mode list',
	#timestamp : ' 8/31/2017 05:26:26'
}
FinderUI>>isClassNamesSymbol [

	^self finder isClassNamesSymbol
]

{
	#category : #'mode list',
	#timestamp : ' 8/31/2017 05:26:26'
}
FinderUI>>isExamplesSymbol [
	^self finder isExamplesSymbol
]

{
	#category : #'mode list',
	#timestamp : ' 8/31/2017 05:26:26'
}
FinderUI>>isPragmasSymbol [
	^self finder isPragmasSymbol
]

{
	#category : #'mode list',
	#timestamp : ' 8/31/2017 05:26:26'
}
FinderUI>>isSelectorsSymbol [
	^self finder isSelectorsSymbol
]

{
	#category : #'mode list',
	#timestamp : ' 8/31/2017 05:26:26'
}
FinderUI>>isSourceSymbol [
	^self finder isSourceSymbol
]

{
	#category : #'events handling',
	#timestamp : ' 8/31/2017 05:26:26'
}
FinderUI>>keyStroke: event [
	self selectedNode ifNotNil: [:node | node keyStroke: event]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:26'
}
FinderUI>>labelFont [
	^StandardFonts defaultFont
]

{
	#category : #'t - accessing',
	#timestamp : ' 8/31/2017 05:26:26'
}
FinderUI>>menu: menu shifted: b  [
	self selectedNode ifNil: [ ^menu ].
	^ self selectedNode menu: menu shifted: b 
]

{
	#category : #display,
	#timestamp : ' 8/31/2017 05:26:26'
}
FinderUI>>open [
	| window |
	window := StandardWindow new model: self.
	self addAllItems: window.
	window setLabel: self defaultWindowLabel.
	window openInWorld.
	self searchingTextArea contentMorph takeKeyboardFocus
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:26'
}
FinderUI>>openPackageChooser [
	(DialogItemsChooser
		on: self
		unselectedItems: self constructPackagesSet
		selectedItems: (self constructPackagesSet: self packagesSelection)
		selectedItemsSetterSelector: #collectFromPackages: 
		title: 'Package Chooser'
		unselectedItemsLabel: 'Unselected Packages' translated
		selectedItemsLabel: 'Selected Packages' translated) open
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:26'
}
FinderUI>>packagesSelection [
	^self finder packagesSelection
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:26'
}
FinderUI>>packagesSelection: aCollection [

	self finder packagesSelection: aCollection.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:26'
}
FinderUI>>refactor [
	^ NautilusRefactoring model: self
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:26'
}
FinderUI>>resetEnvironment [
	self triggerEvent: #resetEnvironment
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:26'
}
FinderUI>>resetSearchedTextList [
	self searchedTextList removeAll.
]

{
	#category : #'tree behavior',
	#timestamp : ' 8/31/2017 05:26:26'
}
FinderUI>>resultDictionary  [
	^self finder resultDictionary 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:26'
}
FinderUI>>rootItems [
	^ self resultDictionary keys sort: [ :a :b | a asString < b asString ]
]

{
	#category : #'t - accessing',
	#timestamp : ' 8/31/2017 05:26:26'
}
FinderUI>>rootNodeClassFromItem: anItem  [
	"To have the good class for my nodes, I ask my owner,
	because he is the only one who knows his state"
	^ self 
		forSelectorsDo: [
			(self resultDictionary at: anItem) size > 1
				ifTrue: [ FinderMethodNode ]
				ifFalse: [ FinderSingleMethodNode ]]
		forClassNamesDo: [FinderClassNode]
		forSourceDo: [FinderMethodNode]
		forExamplesDo: [FinderExampleMethodNode] 
		forPragmasDo: [FinderPragmaNode]
]

{
	#category : #'buttons behavior',
	#timestamp : ' 8/31/2017 05:26:26'
}
FinderUI>>searchButtonAction [
	
	forceSearch := true.
	self searchingTextArea contentMorph acceptTextInModel.
]

{
	#category : #'buttons behavior',
	#timestamp : ' 8/31/2017 05:26:26'
}
FinderUI>>searchButtonLabel [
	^'Search'
]

{
	#category : #'buttons behavior',
	#timestamp : ' 8/31/2017 05:26:26'
}
FinderUI>>searchButtonState [
	^false.
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:26'
}
FinderUI>>searchModeHelpText [
	^'Choose the mode for the search'
]

{
	#category : #'mode list',
	#timestamp : ' 8/31/2017 05:26:26'
}
FinderUI>>searchModesList [
	^#(Selectors Classes Source Pragmas Examples)
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:26'
}
FinderUI>>searchedTextList [
	^searchedTextList ifNil: [ searchedTextList := OrderedCollection new]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:26'
}
FinderUI>>searchedTextList: aCollection [

	searchedTextList := aCollection
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:26'
}
FinderUI>>searchedTextListMaxSize [
	^20
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:26'
}
FinderUI>>searchedTextListMaxSize: anInteger [
	[self searchedTextList size > anInteger]
		whileTrue: [ self searchedTextList removeLast].
	self changed: #searchedTextList.
]

{
	#category : #'text areas behavior',
	#timestamp : ' 8/31/2017 05:26:26'
}
FinderUI>>searchingAccept: aText [

	self forceSearch
		ifFalse: [aText asString = self searchingString ifTrue: [^self]].
	self searchingString: aText asString.
	forceSearch := false.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:26'
}
FinderUI>>searchingString [
	^self finder searchingString
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:26'
}
FinderUI>>searchingString: aString [

	^self finder searchingString: aString
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:26'
}
FinderUI>>searchingTextArea [
	^searchingTextArea ifNil: [self buildSearchingTextArea]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:26'
}
FinderUI>>selectedClass [
	^ self finder selectedClass
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:26'
}
FinderUI>>selectedMethod [
	^ self finder selectedMethod
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:26'
}
FinderUI>>selection: aSelection [
	
	super selection: aSelection.
	self finder selection: aSelection
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:26'
}
FinderUI>>senders [

	self selectedMethod 
		ifNotNil: [ :selector |.
			 	SystemNavigation new browseSendersOf: selector name: 'Senders of ', selector asString autoSelect: selector asString].
]

{
	#category : #'buttons behavior',
	#timestamp : ' 8/31/2017 05:26:26'
}
FinderUI>>sendersButtonAction [
	self senders.
]

{
	#category : #'buttons behavior',
	#timestamp : ' 8/31/2017 05:26:26'
}
FinderUI>>sendersButtonLabel [
	^'Senders'
]

{
	#category : #'buttons behavior',
	#timestamp : ' 8/31/2017 05:26:26'
}
FinderUI>>sendersButtonState [
	^self selectedMethod isNil | self isClassNamesSymbol.
]

{
	#category : #'text areas behavior',
	#timestamp : ' 8/31/2017 05:26:26'
}
FinderUI>>sourceCode [

	^ self selectedClass 
		ifNil: [
			self isExamplesSymbol
				ifTrue: [ self class methodFinderExplanation ]
				ifFalse: [ self defaultExplanation]]
		ifNotNil:[
			self selectedMethod 
				ifNil: [
					self buildDescriptionOf: self selectedClass]
				ifNotNil:[
					| method |
					method := self isExamplesSymbol
								ifTrue: [self finder findSelector: self selectedMethod]
								ifFalse: [self selectedMethod].
					(self selectedClass >> method) sourceCode]]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:26'
}
FinderUI>>sourceTextArea [
	^sourceTextArea ifNil: [self buildSourceTextArea]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:26'
}
FinderUI>>sourceTextModel [
	^ sourceTextModel ifNil: [ sourceTextModel := RubScrolledTextModel new interactionModel: self ].
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:26'
}
FinderUI>>updateSelectedClass [
	self changed: #selectedClass
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:26'
}
FinderUI>>updateSelectedMethod [
	self changed: #selectedMethod
]

{
	#category : #'text areas behavior',
	#timestamp : ' 8/31/2017 05:26:26'
}
FinderUI>>updateSourceCode [
	self sourceTextModel setText: self sourceCode 
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:26'
}
FinderUI>>useRegEx [
	^ self finder useRegEx
]

{
	#category : #'items creation',
	#timestamp : ' 8/31/2017 05:26:26'
}
FinderUI>>useRegExCheckbox [
	^ useRegExCheckbox ifNil: [self buildRegExChooser]

]

{
	#category : #'buttons behavior',
	#timestamp : ' 8/31/2017 05:26:26'
}
FinderUI>>versionsButtonAction [
	Smalltalk tools versionBrowser 
		browseVersionsForClass: self selectedClass 
		selector: self selectedMethod
]

{
	#category : #'buttons behavior',
	#timestamp : ' 8/31/2017 05:26:26'
}
FinderUI>>versionsButtonLabel [
	^'Versions'
]

{
	#category : #'buttons behavior',
	#timestamp : ' 8/31/2017 05:26:26'
}
FinderUI>>versionsButtonState [
	^self selectedClass isNil | self isClassNamesSymbol.
]

{
	#category : #'events handling',
	#timestamp : ' 8/31/2017 05:26:26'
}
FinderUI>>whenTextAcceptedInView: anAnnouncement [
	self compileSource: sourceTextArea text notifying: sourceTextArea
]
