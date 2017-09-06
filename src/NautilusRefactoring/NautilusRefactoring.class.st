"
NautilusRefactoring is a facade for refactorings:
- class
- method
- inst var
- class var
- source code
"
Class {
	#name : #NautilusRefactoring,
	#superclass : #Object,
	#instVars : [
		'environment',
		'model',
		'promptOnRefactoring'
	],
	#classVars : [
		'PromptOnRefactoring'
	],
	#category : #NautilusRefactoring,
	#timestamp : '<historical>'
}

{
	#category : #shortcuts,
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusRefactoring class>>buildRefactoringMethodShortcutsOn: aBuilder [
	<keymap>	

	(aBuilder shortcut: #rename)
		category: #NautilusGlobalShortcuts
		default: $r meta,  $m meta
		do: [:target || scroll |
				scroll := target methodWidget vScrollValue.
				target refactor renameMethodFor: target selectedMethod.
				target methodWidget vScrollValue: scroll]
		description: 'Rename the seleted method'
		
]

{
	#category : #shortcuts,
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusRefactoring class>>buildRefactoringShortcutsOn: aBuilder [
	<keymap>	

	(aBuilder shortcut: #generateAccessors)
		category: #NautilusGlobalShortcuts
		default: $h meta,  $a meta
		do: [:target | target refactor generateAccessors ]
		description: 'Generate the accessors for the selected class'.
		
	(aBuilder shortcut: #generateSubclass)
		category: #NautilusGlobalShortcuts
		default: $h meta,  $n meta, $s meta
		do: [:target | target refactor generateSubclass ]
		description: 'Generate a subclass for the selected class'.
]

{
	#category : #shortcuts,
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusRefactoring class>>buildSourceCodeShortcutsOn: aBuilder [
	<keymap>
	(aBuilder shortcut: #rename)
		category: #NautilusSourceCodeShortcuts
		default: $r meta
		do: [ :target | 
			target sourceTextModel hasUnacceptedEdits not
				ifTrue: [ target refactor renameTextSelection ] ]
		description: 'Rename the current selection'.
	(aBuilder shortcut: #extractToTemp)
		category: #NautilusSourceCodeShortcuts
		default: $x meta shift
		do: [ :target | 
			target sourceTextModel hasUnacceptedEdits not
				ifTrue: [ target refactor extractToTempTextSelection ] ]
		description: 'Extract to temp the current selection'.
	(aBuilder shortcut: #extractToMethod)
		category: #NautilusSourceCodeShortcuts
		default: $m meta shift
		do: [ :target | 
			target sourceTextModel hasUnacceptedEdits not
				ifTrue: [ target refactor extractToMethodTextSelection ] ]
		description: 'Extract to method the current selection'.
	(aBuilder shortcut: #format)
		category: #NautilusSourceCodeShortcuts
		default: PharoShortcuts current formatCodeShortcut
		do: [ :target | target refactor formatSourceCode ]
]

{
	#category : #menu,
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusRefactoring class>>classRefactoringSubmenu: aBuilder [
	<nautilusGlobalClassMenu>
	| target |
	target := aBuilder model.
	target selectedClass ifNil: [^target].
	
	target selectedClass refactoringSubmenu: aBuilder.
]

{
	#category : #menu,
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusRefactoring class>>classVarRefactoringSubmenu: aBuilder [
	<nautilusGlobalClassMenu>
	| target selectedClass |
	target := aBuilder model.
	selectedClass := target selectedClass.
	selectedClass ifNil: [ ^ target ].
	
	selectedClass varRefactoringSubMenu: aBuilder.

	
]

{
	#category : #menu,
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusRefactoring class>>codeRewritingClassSubmenu: aBuilder [
	<nautilusGlobalClassMenu>
	| target |
	target := aBuilder model.
	target selectedClass ifNil: [^target].
	
	target selectedClass codeRewritingClass: aBuilder.
]

{
	#category : #menu,
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusRefactoring class>>groupRefactoringMenu: aBuilder [
	<nautilusGlobalGroupMenu>
	| target |
	target := aBuilder model.
	target selectedClass ifNotNil: [
		target selectedClass groupRefactoring: aBuilder ].
]

{
	#category : #menu,
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusRefactoring class>>instVarRefactoringSubmenu: aBuilder [
	<nautilusGlobalClassMenu>
	| target selectedClass |
	
	target := aBuilder model.
	selectedClass := target selectedClass.
	selectedClass ifNil: [^target].
	
	selectedClass instVarRefactoring: aBuilder.
]

{
	#category : #menu,
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusRefactoring class>>methodRefactoringSubMenu: aBuilder [
	<nautilusGlobalMethodMenu>
	| target selectedMethod |

	target := aBuilder model.
	selectedMethod := target selectedMethod.
	selectedMethod ifNil:[ ^ target ].
	
	selectedMethod origin instanceSide methodRefactoring: aBuilder.
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusRefactoring class>>model: model [

	^ self new
		model: model;
		yourself
]

{
	#category : #menu,
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusRefactoring class>>packageRefactoringMenu: aBuilder [
	<nautilusGlobalPackageMenu>
	
	| target |
	
	target := aBuilder model.
	
	(aBuilder item: #'Rewrite Code')
		order:  100;
		withSeparatorAfter.
	
	(aBuilder item: #'Rewrite Code')
		action: [ target refactor rewriteCode ];
		parent: #'Rewrite Code';
		order: 0.

	(aBuilder item: #'Search Code')
		action: [ target refactor searchCode ];
		parent: #'Rewrite Code';
		order: 100.
	
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusRefactoring class>>promptOnRefactoring [

	^ PromptOnRefactoring ifNil: [ PromptOnRefactoring := true ]
]

{
	#category : #menu,
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusRefactoring class>>refactoringClassMenu: aBuilder [
	<nautilusGlobalClassMenu>
	| target |
	target := aBuilder model.
	target selectedClass ifNil: [ ^ target ].
	target selectedClass refactoringMenu: aBuilder
]

{
	#category : #menu,
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusRefactoring class>>refactoringMethodMenu: aBuilder [
	<nautilusGlobalMethodMenu>
	| target |
	target := aBuilder model.
	target selectedMethod ifNil: [ ^ target ].
	target selectedMethod origin instanceSide refactoringMethod: aBuilder
]

{
	#category : #menu,
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusRefactoring class>>sourceCodeRefactoringMenuHolder: aBuilder [
	<nautilusGlobalSourceCodeMenu>
	| target |
	target := aBuilder model.
	target ifNil: [ ^ self ].
	target selectedMethod ifNil: [ ^ self ].
	target selectedClass
		ifNotNil: [ :selectedClass | selectedClass sourceCodeRefactoringMenu: aBuilder ]
]

{
	#category : #menu,
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusRefactoring class>>sourceCodeRefactoringSubMenu: aBuilder [
	<nautilusGlobalSourceCodeMenu>
	| target |
	target := aBuilder model.
	target ifNil: [ ^ self ].
	target selectedMethod ifNil: [ ^ self ].
	target selectedClass
		ifNotNil: [ :selectedClass | selectedClass sourceCodeRefactoring: aBuilder ]
]

{
	#category : #'class var',
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusRefactoring>>abstractClassVarFrom: aClass [
	self performRefactoringFor: #privateAbstractClassVarFrom: with: aClass
]

{
	#category : #'inst var',
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusRefactoring>>abstractInstVarFrom: aClass [
	self performRefactoringFor: #privateAbstractInstVarFrom: with: aClass

]

{
	#category : #'class var',
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusRefactoring>>accessorsClassVarFrom: aClass [
	self performRefactoringFor: #privateAccessorsClassVarFrom: with: aClass.

]

{
	#category : #'inst var',
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusRefactoring>>accessorsInstVarFrom: aClass [
	self performRefactoringFor: #privateAccessorsInstVarFrom: with: aClass

]

{
	#category : #method,
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusRefactoring>>addAParameterFor: aMethod [
	self performRefactoringFor: #privateAddAParameterFor: with: aMethod
]

{
	#category : #'class var',
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusRefactoring>>addClassVarFrom: aClass [
	self performRefactoringFor: #privateAddClassVarFrom: with: aClass

]

{
	#category : #'inst var',
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusRefactoring>>addInstVarFrom: aClass [
	 self performRefactoringFor: #privateAddInstVarFrom: with: aClass

]

{
	#category : #class,
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusRefactoring>>buildRenameRefactoringEngineFor: aClass [

	| newName |
	newName := (UIManager default
			request: 'Enter the new class name:'
			initialAnswer: aClass name).
	newName isEmptyOrNil ifTrue: [ ^ RefactoringAborted signal ].
	^ RBRenameClassRefactoring
		model: RBClassModelFactory rbNamespace new
		rename: aClass
		to: newName
]

{
	#category : #'rewrite code',
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusRefactoring>>categoryRegex [
	self model refactorCode: self categoryRegexText
]

{
	#category : #'rewrite code',
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusRefactoring>>categoryRegexText [
	^ 'RBCategoryRegexRefactoring new
	replace: ''^Kernel-(.*)$'' with: ''System-$1'' ignoreCase: false;
	yourself'
]

{
	#category : #undo-redo,
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusRefactoring>>changeManager [
	^ RBRefactoryChangeManager instance
]

{
	#category : #class,
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusRefactoring>>changeSuperclassOf: aClass [
	"should be implemented if it really makes sense"

	self model flashSourceCodeArea
]

{
	#category : #display,
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusRefactoring>>chooseFrom: anArray [
	| answer |
	answer := UIManager default chooseFrom: anArray.
	answer = 0 ifTrue: [ RefactoringAborted signal ].
	^ answer
]

{
	#category : #display,
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusRefactoring>>chooseFrom: anArray title: aString lines: aCollection  [
	anArray isEmpty
		ifTrue: [ ^ nil ].
	anArray size = 1
		ifTrue: [ ^ anArray first ].
	^ UIManager default chooseOrRequestFrom: anArray lines: aCollection title: aString
]

{
	#category : #display,
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusRefactoring>>chooseMultipleFrom: anArray [
	^ self chooseMultipleFrom: anArray title: ''
]

{
	#category : #display,
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusRefactoring>>chooseMultipleFrom: anArray title: aString [
	| window |
	window :=  TickDialogWindow 
					itemsList: anArray 
					itemsHeaderName: ''
					wrapBlockOrSelector: [:e | e ]
					title: aString
					defaultValue: true.
	^ anArray isEmpty
		ifTrue: [ anArray copyEmpty ]
		ifFalse: [ window chooseFromOwner: self model window ]
]

{
	#category : #display,
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusRefactoring>>class: aClass andClassVariable: aBlock [
	| variables index variable class |
	variables := aClass theNonMetaClass allClassVarNames asArray sort.
	index := self chooseFrom: variables.
	variable := variables at: index.
	class := aClass theNonMetaClass whichClassDefinesClassVar: variable.
	^ aBlock value: class value: variable
]

{
	#category : #display,
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusRefactoring>>class: aClass andInstVariable: aBlock [
	| variables index variable class |
	variables := aClass instVarNames sorted.
	variables ifEmpty:[ ^ self notifyNoVariablesIn: aClass].
	index := self chooseFrom: variables.
	variable := variables at: index.
	class := aClass whichClassDefinesInstVar: variable.
	class := class isMeta not
				ifTrue: [ RBClassModelFactory rbClass existingNamed: class name ] 
				ifFalse: [ RBClassModelFactory rbMetaclass existingNamed: class theNonMetaClass name ].
	class model: environment.
	^ aBlock value: class value: variable
]

{
	#category : #private-class,
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusRefactoring>>classObjectFor: anObject  [
	(anObject isBehavior or: [anObject isTrait]) ifTrue: [ ^ environment classFor: anObject ].
	anObject isSymbol ifTrue: [ ^ environment classNamed: anObject ].
	^ anObject
]

{
	#category : #'rewrite code',
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusRefactoring>>classRegex [
	self model refactorCode: self classRegexText
]

{
	#category : #'rewrite code',
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusRefactoring>>classRegexText [
	^ 'RBClassRegexRefactoring new

	"Example 1: Change class prefixes"
	renameClasses;
	replace: ''^AB(.*)$'' with: ''CD$1'' ignoreCase: false;

	"Example 2: Generate empty test classes"
	createClasses;
	rootClass: TestCase;
	replace: ''^.*$'' with: ''$0Test'' ignoreCase: false;

	"Example 3: Copy classes"
	copyClasses;
	replace: ''^.*$'' with: ''$0Plus'' ignoreCase: false;

	yourself'
]

{
	#category : #private-class,
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusRefactoring>>classRemovalRefactoringObjectFor: aCollection [
	^ RBRemoveClassRefactoring 
		model: environment 
		classNames: (aCollection collect: [:e | e theNonMetaClass name ])
]

{
	#category : #source,
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusRefactoring>>createCascadeBetween: anInterval from: aMethod [
	self performRefactoringFor: #privateCreateCascadeBetween:from: with: anInterval with: aMethod
]

{
	#category : #method,
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusRefactoring>>deprecateMethodFor: aMethod [
	self performRefactoringFor: #privateDeprecateMethodFor: with: aMethod
]

{
	#category : #source,
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusRefactoring>>extractBetween: anInterval from: aMethod [
	self performRefactoringFor:  #privateExtractBetween:from: with: anInterval with: aMethod
]

{
	#category : #source,
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusRefactoring>>extractToComponentBetween: anInterval from: aMethod [
	self performRefactoringFor:  #privateExtractToComponentBetween:from: with: anInterval with: aMethod
]

{
	#category : #source,
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusRefactoring>>extractToMethodTextSelection [
	| aMethod |
	aMethod := self model selectedMethod.
	aMethod ifNil: [ ^ self model flashSourceCodeArea ].
	self model contentSelection asString ifEmpty: [ ^ self model flashSourceCodeArea ].
	self extractBetween: self model selectionInterval from: aMethod
]

{
	#category : #source,
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusRefactoring>>extractToTempTextSelection [
	| aMethod |
	aMethod := self model selectedMethod.
	aMethod ifNil: [ ^ self model flashSourceCodeArea ].
	self model contentSelection asString ifEmpty: [ ^ self model flashSourceCodeArea ].
	self extractToTemporaryBetween: self model selectionInterval from: aMethod
]

{
	#category : #source,
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusRefactoring>>extractToTemporaryBetween: anInterval from: aMethod [
	self performRefactoringFor: #privateExtractToTemporaryBetween:from: with: anInterval with: aMethod
]

{
	#category : #source,
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusRefactoring>>formatSourceCode [
	self model sourceTextModel formatSourceCodeInView
]

{
	#category : #class,
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusRefactoring>>generateAccessors [

	| refactorings |
	refactorings := self privateGenerateAccessorsFor: self model selectedClass.
	self performRefactorings: refactorings
]

{
	#category : #class,
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusRefactoring>>generateSubclass [
	self performRefactoringFor: #privateGenerateSubclassFor: with: self model selectedClass theNonMetaClass

]

{
	#category : #class,
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusRefactoring>>generateSuperClass [
	"Execute the refactoring of the receiver."

	| refactoring |
	refactoring := self privateGenerateSuperClassFor: self model selectedClass theNonMetaClass.
	self performRefactoring: refactoring.
]

{
	#category : #display,
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusRefactoring>>handleError: anException [
	self informAnExceptionFor: anException.
	anException resume
]

{
	#category : #display,
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusRefactoring>>handleFailure: anException [
	self informAnExceptionFor: anException.
	anException return
]

{
	#category : #display,
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusRefactoring>>handleMethodNameRequest: aMethodName [
	^ (MethodNameEditor openOn: aMethodName) methodName
]

{
	#category : #display,
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusRefactoring>>handleWarning: anException [
	self inform: anException messageText.
	anException resume
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusRefactoring>>informAnExceptionFor: anException [
	anException actionBlock isNil
		ifTrue: [ self inform: anException messageText ]
		ifFalse: [ 
			(self confirm: anException messageText)
				ifTrue: [ anException actionBlock value ] ]
]

{
	#category : #method,
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusRefactoring>>inlineAllSendersFor: aMethod [
	self performRefactoringFor: #privateInlineAllSendersFor: with: aMethod

]

{
	#category : #source,
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusRefactoring>>inlineMethodBetween: anInterval from: aMethod [
	self performRefactoringFor: #privateInlineMethodBetween:from: with: anInterval with: aMethod
]

{
	#category : #source,
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusRefactoring>>inlineMethodFromComponentBetween: anInterval from: aMethod [
	self performRefactoringFor: #privateInlineMethodFromComponentBetween:from: with: anInterval with: aMethod
]

{
	#category : #method,
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusRefactoring>>inlineParameterFor: aMethod [
	self performRefactoringFor: #privateInlineParameterFor: with: aMethod
]

{
	#category : #source,
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusRefactoring>>inlineTemporaryBetween: anInterval from: aMethod [
	self performRefactoringFor: #privateInlineTemporaryBetween:from: with: anInterval with: aMethod
]

{
	#category : #class,
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusRefactoring>>insertSubclass [
	self performRefactoringFor: #privateInsertSubclassFor: with: self model selectedClass theNonMetaClass
]

{
	#category : #class,
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusRefactoring>>insertSuperclass [
	self performRefactoringFor: #privateInsertSuperclassFor: with: self model selectedClass theNonMetaClass
]

{
	#category : #performing,
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusRefactoring>>internalPerformRefactorings: aCollectionRefactoring [
	"Try to properly label aRefactoring and perform it or open the changes browser, depending on the preferences of the user."

	self promptOnRefactoring
		ifFalse: [ 
			aCollectionRefactoring
				do: [ :e | 
					self refactoringOptions: e.
					e execute ] ]
		ifTrue: [ 
			aCollectionRefactoring
				do: [ :e | 
					self refactoringOptions: e.
					e primitiveExecute ].
			aCollectionRefactoring ifEmpty: [ ^ self ].
			(ChangesBrowser changes: aCollectionRefactoring) open ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusRefactoring>>model [
	^ model
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusRefactoring>>model: aNautilusUI [
	model := aNautilusUI.
	environment := (RBClassModelFactory rbNamespace onEnvironment: aNautilusUI browsedEnvironment)
						name: self printString;
						yourself
]

{
	#category : #'inst var',
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusRefactoring>>moveInstVarToClass: aClass [
	self performRefactoringFor: #privateMoveInstVarToClass: with: aClass
]

{
	#category : #method,
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusRefactoring>>moveMethodFor: aMethod [
	self performRefactoringFor: #privateMoveMethodFor: with: aMethod

]

{
	#category : #method,
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusRefactoring>>moveMethodToClassFor: aMethod [
	self performRefactoringFor: #privateMoveMethodToClassFor: with: aMethod
	
]

{
	#category : #source,
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusRefactoring>>moveVariableDefinitionBetween: anInterval from: aMethod [
	self performRefactoringFor: #privateMoveVariableDefinitionBetween:from: with: anInterval with: aMethod
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusRefactoring>>newVariableRequestText [

	^ 'Enter the new variable name:'
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusRefactoring>>notifyNoVariablesIn: aClass  [
	self inform: aClass printString , ' does not define any instance variable.'.
	RefactoringAborted signal.
]

{
	#category : #option,
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusRefactoring>>openEnvironment: anEnvironment for: aRefactoring [
	anEnvironment isEmpty
		ifTrue: [ ^ self inform: 'Empty scope' ].
	Smalltalk tools browser openInEnvironment: anEnvironment
]

{
	#category : #performing,
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusRefactoring>>performRefactoring: aRefactoring [
	"Try to properly label aRefactoring and perform it or open the changes browser, depending on the preferences of the user."
	
	self performRefactorings: {aRefactoring}
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusRefactoring>>performRefactoringFor: aSymbol with: anArgument [
	[ self performRefactoring: (self perform: aSymbol with: anArgument) ]
		on: RefactoringAborted
		do: [ :ex | self inform: 'Refactoring aborted' ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusRefactoring>>performRefactoringFor: aSymbol with: anArgument with: anotherArgument [
	[ self performRefactoring: (self perform: aSymbol with: anArgument with: anotherArgument) ]
		on: RefactoringAborted
		do: [ :ex | self inform: 'Refactoring aborted' ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusRefactoring>>performRefactoringFor: aSymbol withArguments: anArray [
	[ self performRefactoring: (self perform: aSymbol withArguments: anArray) ]
		on: RefactoringAborted
		do: [ :ex | self inform: 'Refactoring aborted' ]
]

{
	#category : #performing,
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusRefactoring>>"protocol: performing"
performRefactorings: aCollectionRefactoring [
	aCollectionRefactoring ifNil: [ ^ self ].
	aCollectionRefactoring do: [ :each | each model environment: self model browsedEnvironment ].
	[ 
	[ 
	[ self internalPerformRefactorings: aCollectionRefactoring ]
		on: RBRefactoringFailure
		do: [ :exception | self handleFailure: exception ] ]
		on: RBRefactoringWarning
		do: [ :exception | self handleWarning: exception ] ]
		on: RBRefactoringError
		do: [ :exception | self handleError: exception ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusRefactoring>>performRefactoringsFor: aSymbol with: anArgument [
	[ self performRefactorings: (self perform: aSymbol with: anArgument) ]
		on: RefactoringAborted
		do: [ :ex | self inform: 'Refactoring aborted' ]
]

{
	#category : #'private-class var',
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusRefactoring>>privateAbstractClassVarFrom: aClass [
	^ self class: aClass andClassVariable: [ :class :variable | 
		RBAbstractClassVariableRefactoring
			model: environment
			variable: variable
			class: class ]
]

{
	#category : #'private-inst var',
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusRefactoring>>privateAbstractInstVarFrom: aClass [
	^ self class: aClass andInstVariable: [ :class :variable | 
		RBAbstractInstanceVariableRefactoring
			model: environment
			variable: variable
			class: class ]
]

{
	#category : #'private-class var',
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusRefactoring>>privateAccessorsClassVarFrom: aClass [
	^ self class: aClass andClassVariable: [ :class :variable | 
		RBCreateAccessorsForVariableRefactoring 
			model: environment
			variable: variable
			class: class
			classVariable: true ]
]

{
	#category : #'private-inst var',
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusRefactoring>>privateAccessorsInstVarFrom: aClass [
	^ self class: aClass andInstVariable: [ :class :variable | 
		RBCreateAccessorsForVariableRefactoring 
			model: environment
			variable: variable
			class: class
			classVariable: false ]
]

{
	#category : #private-method,
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusRefactoring>>privateAddAParameterFor: aMethod [
	| initialAnswer oldSelector |
	oldSelector := aMethod selector.
	initialAnswer := oldSelector numArgs = 0
		ifTrue: [ oldSelector , ':' ]
		ifFalse: [ oldSelector ].
	^ RBAddParameterRefactoring
		model: environment
		addParameterToMethod: aMethod selector
		in: aMethod origin
		newSelector: (self request: 'Enter new selector:' initialAnswer: initialAnswer) asSymbol
		initializer: (self request: 'Enter default value for parameter:' initialAnswer: 'nil')
]

{
	#category : #'private-class var',
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusRefactoring>>privateAddClassVarFrom: aClass [
	^ RBAddClassVariableRefactoring 
		model: environment 
		variable: (self request: self newVariableRequestText initialAnswer: 'Var')
		class: aClass theNonMetaClass
]

{
	#category : #'private-inst var',
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusRefactoring>>privateAddInstVarFrom: aClass [
	^ RBAddInstanceVariableRefactoring 
		model: environment 
		variable: (self request: self newVariableRequestText initialAnswer: 'inst') 
		class: aClass theNonMetaClass
]

{
	#category : #private-source,
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusRefactoring>>privateCreateCascadeBetween: aSelection from: aMethod [
	^ RBCreateCascadeRefactoring 
		model: environment
		combine: aSelection
		from: aMethod selector
		in: aMethod methodClass
]

{
	#category : #private-method,
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusRefactoring>>privateDeprecateMethodFor: aMethod [
	| class selector newMethod |
	class := aMethod methodClass.
	selector := aMethod selector.
	newMethod := (SearchFacade messageSearchFor: aMethod methodClass) chooseFromOwner: self model window.
	^ RBDeprecateMethodRefactoring
		model: environment
		deprecateMethod: selector
		in: class
		using: newMethod selector
]

{
	#category : #private-source,
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusRefactoring>>privateExtractBetween: anInterval from: aMethod [
	^ RBExtractMethodRefactoring
		model: environment
		extract: anInterval
		from: aMethod selector
		in: aMethod methodClass
]

{
	#category : #private-source,
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusRefactoring>>privateExtractToComponentBetween: anInterval from: aMethod [
	^ RBExtractMethodToComponentRefactoring
		model: environment
		extract: anInterval
		from: aMethod selector
		in: aMethod methodClass
]

{
	#category : #private-source,
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusRefactoring>>privateExtractToTemporaryBetween: anInterval from: aMethod [

	^ RBExtractToTemporaryRefactoring
		model: environment
		extract: anInterval
		to: (self request: self newVariableRequestText)
		from: aMethod selector
		in: aMethod methodClass
]

{
	#category : #private-class,
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusRefactoring>>privateGenerateAccessorsFor: class [
	^ class instVarNames
		collect: [ :aVarName | 
			RBCreateAccessorsForVariableRefactoring
				model: environment
				variable: aVarName
				class: class
				classVariable: false ]
]

{
	#category : #private-class,
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusRefactoring>>privateGenerateSubclassFor: class [
	| subclassName |
	subclassName := self request: 'Enter new subclass name:'.
	^ RBAddClassRefactoring
		model: environment
		addClass: subclassName
		superclass: class
		subclasses: (self chooseMultipleFrom: class subclasses title: 'Select subclasses of ' , subclassName , ':')
		category: class category
]

{
	#category : #private-class,
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusRefactoring>>privateGenerateSuperClassFor: class [
	| superclassName subclasses |
	superclassName := self request: 'Enter new superclass name:'.
	subclasses := self chooseMultipleFrom: class subclasses title: 'Select subclasses of ' , superclassName , ':'.
	subclasses ifNil: [ RefactoringAborted signal ].
	^ RBChildrenToSiblingsRefactoring
		model: environment
		name: superclassName
		class: class
		subclasses: subclasses
]

{
	#category : #private-method,
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusRefactoring>>privateInlineAllSendersFor: aMethod [
	^ RBInlineAllSendersRefactoring
		model: environment
		sendersOf: aMethod selector
		in: aMethod methodClass
]

{
	#category : #private-source,
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusRefactoring>>privateInlineMethodBetween: anInterval from: aMethod [
	^ RBInlineMethodRefactoring
		model: environment
		inline: anInterval
		inMethod: aMethod selector
		forClass: aMethod methodClass
]

{
	#category : #private-source,
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusRefactoring>>privateInlineMethodFromComponentBetween: anInterval from: aMethod [
	^ RBInlineMethodFromComponentRefactoring
		model: environment
		inline: anInterval
		inMethod: aMethod selector
		forClass: aMethod methodClass
]

{
	#category : #private-method,
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusRefactoring>>privateInlineParameterFor: aMethod [
	^ RBInlineParameterRefactoring
		model: environment
		inlineParameter:
			(self
				chooseFrom: aMethod argumentNames
				title: 'Choose a parameter:'
				lines: aMethod argumentNames)
		in: aMethod methodClass
		selector: aMethod selector
]

{
	#category : #private-source,
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusRefactoring>>privateInlineTemporaryBetween: anInterval from: aMethod [
	^ RBInlineTemporaryRefactoring
		model: environment
		inline: (aMethod ast bestNodeFor: anInterval) sourceInterval
		from: aMethod selector
		in: aMethod methodClass
]

{
	#category : #private-class,
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusRefactoring>>privateInsertSubclassFor: class [
	^ RBAddClassRefactoring
		model: environment
		addClass: ( self request: 'Enter new subclass name :')
		superclass: class
		subclasses: class subclasses
		category: class category
]

{
	#category : #private-class,
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusRefactoring>>privateInsertSuperclassFor: class [
	^ RBAddClassRefactoring
		model: environment
		addClass: (self request: 'Enter new superclass name :')
		superclass: class superclass
		subclasses: class asOrderedCollection
		category: class category
]

{
	#category : #'private-inst var',
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusRefactoring>>privateMoveInstVarToClass: aClass [
	| newClass |
	newClass := (SearchFacade classSearchInEnvironment: RBBrowserEnvironment default) chooseFromOwner: World.
	^ self class: aClass andInstVariable: [ :class :variable | 
		RBMoveInstVarToClassRefactoring 
			model: environment
			variable: variable
			class: newClass
			oldClass: aClass ]
]

{
	#category : #private-method,
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusRefactoring>>privateMoveMethodFor: aMethod [
	^ RBMoveMethodRefactoring
		model: environment
		selector: aMethod selector
		class: aMethod methodClass
		variable: (self chooseFrom: aMethod methodClass instVarNames title: 'Choose:' lines:  aMethod methodClass instVarNames)
]

{
	#category : #private-method,
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusRefactoring>>privateMoveMethodToClassFor: aMethod [
	| class |
	class := (SearchFacade classSearchInEnvironment: Smalltalk) chooseFromOwner: World.
	class ifNil: [ RefactoringAborted signal ].
	^ RBMoveMethodToClassRefactoring
		model: environment
		method: aMethod
		class: class
]

{
	#category : #private-source,
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusRefactoring>>privateMoveVariableDefinitionBetween: anInterval from: aMethod [
	^ RBMoveVariableDefinitionRefactoring
		model: environment
		bindTight: anInterval
		in: aMethod methodClass
		selector: aMethod selector
]

{
	#category : #'private-class var',
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusRefactoring>>privatePullUpClassVarFrom: aClass [
	^ self class: aClass andClassVariable: [ :class :variable | 
		RBPullUpClassVariableRefactoring 
			model: environment
			variable: variable
			class: class ]
]

{
	#category : #'private-inst var',
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusRefactoring>>privatePullUpInstVarFrom: aClass [
	^ self class: aClass andInstVariable: [ :class :variable | 
		RBPullUpInstanceVariableRefactoring 
			model: environment
			variable: variable
			class: class superclass ]
]

{
	#category : #private-method,
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusRefactoring>>privatePullUpMethodsFor: aCollection [
	| selectors class |
	selectors := aCollection collect: #selector.
	class := aCollection first methodClass.
	^ RBPullUpMethodRefactoring model: environment pullUp: selectors from: class
]

{
	#category : #'private-class var',
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusRefactoring>>privatePushDownClassVarFrom: aClass [
	^ self class: aClass andClassVariable: [ :class :variable | 
		RBPushDownClassVariableRefactoring
			model: environment
			variable: variable
			class: class ]
]

{
	#category : #'private-inst var',
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusRefactoring>>privatePushDownInstVarFrom: aClass [
	^ self class: aClass andInstVariable: [ :class :variable | 
		RBPushDownInstanceVariableRefactoring
			model: environment
			variable: variable
			class: class ]
]

{
	#category : #private-method,
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusRefactoring>>privatePushDownMethodsFor: aCollection [
	| selectors class |
	selectors := aCollection collect: #selector.
	class := aCollection first methodClass.
	^ RBPushDownMethodRefactoring
		model: environment
		pushDown: selectors
		from: class
]

{
	#category : #private-class,
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusRefactoring>>privateRealizeClassFor: aClass [
	^ RBRealizeClassRefactoring model: environment className: aClass theNonMetaClass name
]

{
	#category : #'private-class var',
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusRefactoring>>privateRemoveClassVarFrom: aClass [
	^ self class: aClass andClassVariable: [ :class :variable | 
		RBRemoveClassVariableRefactoring
			model: environment
			variable: variable
			class: class ]
]

{
	#category : #'private-inst var',
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusRefactoring>>privateRemoveInstVarFrom: aClass [
	^ self class: aClass andInstVariable: [ :class :variable | 
		RBRemoveInstanceVariableRefactoring
			model: environment
			variable: variable
			class: class ]
]

{
	#category : #private-method,
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusRefactoring>>privateRemoveMethodsFor: aCollection [
	| selectors class |
	selectors := aCollection collect: #selector.
	class := aCollection first origin.
	^ RBRemoveMethodRefactoring
		model: environment
		removeMethods: selectors
		from: class
]

{
	#category : #private-method,
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusRefactoring>>privateRemoveParameterMethodFor: aMethod [
	^ RBRemoveParameterRefactoring
		model: environment
		removeParameter: (self chooseFrom: aMethod argumentNames title: 'Choose a parameter to remove:' lines:  aMethod argumentNames)
		in: aMethod origin
		selector: aMethod selector
]

{
	#category : #'private-class var',
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusRefactoring>>privateRenameClassVarFrom: aClass [

	^ self class: aClass andClassVariable: [ :class :variable | 
			RBRenameClassVariableRefactoring
				model: environment
				rename: variable
				to: (self request: self newVariableRequestText initialAnswer: variable) asSymbol
				in: class 
	]
]

{
	#category : #'private-class var',
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusRefactoring>>privateRenameClassVarNamed: variable from: aClass [

	^ RBRenameClassVariableRefactoring
		model: environment
		rename: variable
		to: (self request: self newVariableRequestText initialAnswer: variable) asSymbol
		in: aClass
]

{
	#category : #'private-inst var',
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusRefactoring>>privateRenameInstVarFrom: aClass [

	^ self class: aClass andInstVariable: [ :class :variable | 
		RBRenameInstanceVariableRefactoring
			model: environment
			rename: variable
			to: (self request: self newVariableRequestText initialAnswer: variable) asSymbol
			in: class 
	]
]

{
	#category : #'private-inst var',
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusRefactoring>>privateRenameInstVarNamed: variable from: aClass [

	^ RBRenameInstanceVariableRefactoring
		model: environment
		rename: variable
		to: (self request: self newVariableRequestText initialAnswer: variable) asSymbol
		in: aClass
]

{
	#category : #private-method,
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusRefactoring>>privateRenameMessageFor: aMethodOrMessageNode [
	|  newMethodName oldMethodName selector oldArguments argumentPermutation |
	selector := aMethodOrMessageNode selector.
	oldArguments := aMethodOrMessageNode arguments collect: #name.
	oldMethodName := RBMethodName selector: selector arguments: oldArguments.
	(newMethodName := self requestMethodNameFor: oldMethodName) ifNil: [ RefactoringAborted signal ].	
	argumentPermutation := newMethodName arguments collect: [ :each | oldArguments indexOf: each ].
	^ RBRenameMethodRefactoring
		model: environment
		renameMethod: selector
		in: aMethodOrMessageNode methodNode methodClass
		to: newMethodName selector
		permutation: argumentPermutation
]

{
	#category : #private-method,
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusRefactoring>>privateRenameMethodFor: aMethod [
	|  newMethodName oldMethodName selector oldArguments |
	selector := aMethod selector.
	oldArguments := aMethod ast arguments collect: #name.
	oldMethodName := RBMethodName selector: selector arguments: oldArguments.
	(newMethodName := self requestMethodNameFor: oldMethodName) ifNil: [ RefactoringAborted signal ].
	^ self privateRenameMethodFor: aMethod withNewName: newMethodName

]

{
	#category : #private-method,
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusRefactoring>>privateRenameMethodFor: aMethod withNewName: newMethodName [
	| class selector  tempOldArguments argumentPermutation |
	class := aMethod methodClass.
	selector := aMethod selector.
	tempOldArguments := aMethod ast arguments collect: #name.
	argumentPermutation := newMethodName arguments collect: [ :each | tempOldArguments indexOf: each ].
	^ RBRenameMethodRefactoring
		model: environment
		renameMethod: selector
		in: class
		to: newMethodName selector
		permutation: argumentPermutation
]

{
	#category : #private-source,
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusRefactoring>>privateRenameTemporaryNamed: oldname Between: anInterval from: aMethod [

	^ RBRenameTemporaryRefactoring
		model: environment
		renameTemporaryFrom: anInterval
		to: (self request: self newVariableRequestText initialAnswer: oldname)
		in: aMethod methodClass
		selector: aMethod selector
]

{
	#category : #private-source,
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusRefactoring>>privateSplitCascadeBetween: anInterval from: aMethod [
	^ RBSplitCascadeRefactoring
		model: environment
		split: anInterval
		from: aMethod selector
		in: aMethod methodClass
]

{
	#category : #private-class,
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusRefactoring>>privateSplitClassFor: aClass [
	| class |
	class := aClass theNonMetaClass.
	^ RBSplitClassRefactoring
		model: environment
		class: class
		instanceVariables: (self chooseMultipleFrom: class instVarNames title: 'Select variables to extract:')
		newClassName: (self request: 'Enter new class name:')
		referenceVariableName: (self request: 'Enter new variable name where requests will be forwarded:')
]

{
	#category : #private-method,
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusRefactoring>>privateSwapMethodFor: aCollection [
	^ aCollection
		collect: [ :aMethod | RBSwapMethodRefactoring model: environment swapMethod: aMethod selector in: aMethod methodClass ]
]

{
	#category : #private-source,
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusRefactoring>>privateTemporaryToInstanceVariableNamed: name Between: anInterval from: aMethod [
	^ RBTemporaryToInstanceVariableRefactoring
		model: environment
		class: aMethod methodClass
		selector: aMethod selector
		variable: name
]

{
	#category : #option,
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusRefactoring>>promptOnRefactoring [
	^ promptOnRefactoring ifNil: [ self class promptOnRefactoring ]
]

{
	#category : #option,
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusRefactoring>>promptOnRefactoring: aBoolean [
	promptOnRefactoring := aBoolean
]

{
	#category : #'rewrite code',
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusRefactoring>>protocolRegex [
	self model refactorCode: self protocolRegexText
]

{
	#category : #'rewrite code',
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusRefactoring>>protocolRegexText [
	^ 'RBProtocolRegexRefactoring new
	replace: ''^\*system(.*)$'' with: ''*kernel$1'' ignoreCase: true;
	yourself'
]

{
	#category : #'class var',
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusRefactoring>>pullUpClassVarFrom: aClass [
	self performRefactoringFor: #privatePullUpClassVarFrom: with: aClass

]

{
	#category : #'inst var',
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusRefactoring>>pullUpInstVarFrom: aClass [
	self performRefactoringFor: #privatePullUpInstVarFrom: with: aClass
]

{
	#category : #method,
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusRefactoring>>pullUpMethodsFor: aCollection [
	self performRefactoringFor: #privatePullUpMethodsFor: with: aCollection

]

{
	#category : #'class var',
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusRefactoring>>pushDownClassVarFrom: aClass [
	self performRefactoringFor: #privatePushDownClassVarFrom: with: aClass

]

{
	#category : #'inst var',
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusRefactoring>>pushDownInstVarFrom: aClass [
	self performRefactoringFor: #privatePushDownInstVarFrom: with: aClass

]

{
	#category : #method,
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusRefactoring>>pushDownMethodsFor: aCollection [
	self performRefactoringFor: #privatePushDownMethodsFor: with: aCollection

]

{
	#category : #class,
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusRefactoring>>realizeClass [
	self performRefactoringFor: #privateRealizeClassFor: with: self model selectedClass theNonMetaClass

]

{
	#category : #undo-redo,
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusRefactoring>>redoEnabled [
	^ self changeManager hasRedoableOperations
]

{
	#category : #undo-redo,
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusRefactoring>>redoLabel [
	| stream |
	stream := WriteStream with: 'Redo'.
	self changeManager hasRedoableOperations
		ifFalse: [ ^ stream contents ].
	stream
		nextPut: $ ;
		nextPutAll: self changeManager redoChange name.
	stream position > 40
		ifTrue: [ 
			stream
				position: 40;
				nextPutAll: '...' ].
	^ stream contents
]

{
	#category : #undo-redo,
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusRefactoring>>redoOperation  [
	self changeManager redoOperation
]

{
	#category : #option,
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusRefactoring>>refactoringOptions: aRefactoring [
	aRefactoring
		setOption: #implementorToInline
		toUse: [ :ref :imps | self requestImplementorToInline: imps ];
		setOption: #methodName
		toUse: [ :ref :name | self requestMethodNameFor: name ];
		setOption: #selfArgumentName
		toUse: [ :ref | self requestSelfArgumentName ];
		setOption: #selectVariableToMoveTo
		toUse: [ :ref :class :selector | self selectVariableToMoveMethodTo: selector class: class ];
		setOption: #variableTypes
		toUse: [ :ref :types :selected | self selectVariableTypesFrom: types selected: selected for: ref ];
		setOption: #extractAssignment
		toUse: [ :ref :string | self shouldExtractAssignmentTo: string ];
		setOption: #inlineExpression
		toUse: [ :ref :string | self shouldInlineExpression: string ];
		setOption: #alreadyDefined
		toUse: [ :ref :class :selector | self shouldOverride: selector in: class ];
		setOption: #useExistingMethod
		toUse: [ :ref :selector | self shouldUseExistingMethod: selector ];
		setOption: #openBrowser
		toUse: [ :ref :env | self openEnvironment: env  for: ref]
]

{
	#category : #'class var',
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusRefactoring>>removeClassVarFrom: aClass [
	self performRefactoringFor: #privateRemoveClassVarFrom: with: aClass
]

{
	#category : #class,
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusRefactoring>>removeClasses: aCollection [
	"Execute the refactoring of the receiver."

	| refactoring |
	refactoring := self classRemovalRefactoringObjectFor: aCollection.
	refactoring model environment: self model browsedEnvironment.
	self performRefactoring: refactoring.
	^ true
]

{
	#category : #'inst var',
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusRefactoring>>removeInstVarFrom: aClass [
	self performRefactoringFor: #privateRemoveInstVarFrom: with: aClass
]

{
	#category : #method,
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusRefactoring>>removeMethodsFor: aCollection [
	self performRefactoringFor: #privateRemoveMethodsFor: with: aCollection
]

{
	#category : #method,
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusRefactoring>>removeParameterFor: aMethod [
	self performRefactoringFor: #privateRemoveParameterMethodFor: with: aMethod
]

{
	#category : #class,
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusRefactoring>>renameClass: aClass [
	self performRefactoringFor: #buildRenameRefactoringEngineFor: with: aClass
]

{
	#category : #'class var',
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusRefactoring>>renameClassVarFrom: aClass [
	self performRefactoringFor: #privateRenameClassVarFrom: with: aClass
]

{
	#category : #'class var',
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusRefactoring>>renameClassVarNamed: aName from: aClass [
	self performRefactoringFor: #privateRenameClassVarNamed:from: with: aName with: aClass
]

{
	#category : #'inst var',
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusRefactoring>>renameInstVarFrom: aClass [
	self performRefactoringFor: #privateRenameInstVarFrom: with: aClass
]

{
	#category : #'inst var',
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusRefactoring>>renameInstVarNamed: aName from: aClass [
	self performRefactoringFor: #privateRenameInstVarNamed:from: with: aName with: aClass
]

{
	#category : #method,
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusRefactoring>>renameMessageFor: aMethodOrMessageNode [
	model okToChange ifFalse: [ ^ self ].
	aMethodOrMessageNode ifNil: [ ^ self ].
	self performRefactoringFor: #privateRenameMessageFor: with: aMethodOrMessageNode
]

{
	#category : #method,
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusRefactoring>>renameMethodFor: aMethod [
	model okToChange ifFalse: [ ^ self ].
	aMethod ifNil: [ ^ self ].
	self performRefactoringFor: #privateRenameMethodFor: with: aMethod
]

{
	#category : #method,
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusRefactoring>>renameMethodFor: aMethod withNewMethodName: aMethodName [
	self performRefactoringFor: #privateRenameMethodFor:withNewName: with: aMethod with: aMethodName
]

{
	#category : #source,
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusRefactoring>>renameTemporaryNamed: oldname Between: anInterval from: aMethod [
	aMethod ifNil: [ ^ self ].
	self performRefactoringFor: #privateRenameTemporaryNamed:Between:from: withArguments: {oldname. anInterval. aMethod}.
]

{
	#category : #source,
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusRefactoring>>renameTextSelection [
	self model selectedMethod ifNotNil: [ ^ self renameTextSelectionForMethod ].
	(self model selectedCategory isNil and: [ self model selectedClass notNil ])
		ifTrue: [ ^ self renameTextSelectionForClass ]	" we are editing a class definition "
]

{
	#category : #source,
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusRefactoring>>renameTextSelectionForClass [
	| selectedInterval selection class |
	class := self model selectedClass.
	selection := self model contentSelection.
	selectedInterval := self model selectionInterval.
	selectedInterval isEmpty
		ifTrue: [ ^ self model flashSourceCodeArea ].
	(selection includes: Character space)
		ifTrue: [ ^ self model flashSourceCodeArea ].	"Try to rename the superclass"
	selectedInterval first = 1
		ifTrue: [ self changeSuperclassOf: class ].	"Rename the selected class"
	selection = class name
		ifTrue: [ self renameClass: class ].	"Rename a variable"
	self renameVariable: selection
]

{
	#category : #source,
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusRefactoring>>renameTextSelectionForMethod [
	| selectedInterval  method tempNode |
	method := self model selectedMethod.
	selectedInterval := self model selectionInterval.
	selectedInterval first = 1
		ifTrue: [ ^ self renameMethodFor: method ].
	tempNode := (method ast bestNodeFor: selectedInterval).
	tempNode executeRenameRefactoringBy: self
]

{
	#category : #source,
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusRefactoring>>renameVariable: aString [
	| class |
	class := self model selectedClass.
	(class instVarNames includes: aString)
		ifTrue: [ ^ self renameInstVarNamed: aString from: class ].
	(class classVarNames includes: aString)
		ifTrue: [ ^ self renameClassVarNamed: aString from: class ].
	self model flashSourceCodeArea
]

{
	#category : #display,
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusRefactoring>>request: aString [
	^ self request: aString initialAnswer: ''
]

{
	#category : #display,
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusRefactoring>>request: requestString initialAnswer: initialAnswerString [
	| answer |
	answer := UIManager default request: requestString initialAnswer: initialAnswerString.
	answer isEmptyOrNil ifTrue:  [ RefactoringAborted signal ].
	^ answer
	

]

{
	#category : #display,
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusRefactoring>>requestImplementorToInline: imps [
	^ self chooseFrom: imps title: 'Choose the class that should provide the implementation.' lines:#()
]

{
	#category : #display,
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusRefactoring>>requestMethodNameFor: aMethodName [
	^ self handleMethodNameRequest: aMethodName
]

{
	#category : #option,
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusRefactoring>>requestSelfArgumentName [
	^ self request: 'Enter name for argument to refer to "self" in extracted method'
]

{
	#category : #'rewrite code',
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusRefactoring>>rewriteCode [
	self model rewriteCode: self rewriteCodeText
]

{
	#category : #'rewrite code',
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusRefactoring>>rewriteCodeText [
	^ 'RBParseTreeRewriter new
	replace: ''`@object'' with: ''`@object'';
	replace: ''`@object'' with: ''`@object'' when: [ :node | true ];
	replace: ''`@object'' withValueFrom: [ :node | node ];
	replace: ''`@object'' withValueFrom: [ :node | node ] when: [ :node | true ];
	replaceMethod: ''`@method: `@args | `@temps | `@.statements'' with: ''`@method: `@args | `@temps | `@.statements'';
	replaceMethod: ''`@method: `@args | `@temps | `@.statements'' with: ''`@method: `@args | `@temps | `@.statements'' when: [ :node | true ];
	replaceMethod: ''`@method: `@args | `@temps | `@.statements'' withValueFrom: [ :node | node ];
	replaceMethod: ''`@method: `@args | `@temps | `@.statements'' withValueFrom: [ :node | node ] when: [ :node | true ];
	yourself'
]

{
	#category : #'rewrite code',
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusRefactoring>>searchCode [
	self model searchCode: self searchCodeText
]

{
	#category : #'rewrite code',
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusRefactoring>>searchCodeText [
	^ 'RBParseTreeSearcher new
	matches: ''`@object'' do: [ :node :answer | node ];
	matchesMethod: ''`@method: `@args | `@temps | `@.statements'' do: [ :node :answer | node ];
	yourself'
]

{
	#category : #option,
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusRefactoring>>selectVariableToMoveMethodTo: aSelector class: aClass [
	| parseTree nameList |
	parseTree := aClass parseTreeFor: aSelector.
	parseTree isNil
		ifTrue: [ parseTree := RBMethodNode selector: #value body: (RBSequenceNode statements: #()) ].
	nameList := OrderedCollection new.
	nameList
		addAll: parseTree argumentNames sorted;
		addAll: aClass allInstanceVariableNames sorted.
	^ self
		chooseFrom: nameList
		title: 'Select variable to move method into:'
		lines: (Array with: parseTree argumentNames size)
]

{
	#category : #option,
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusRefactoring>>selectVariableTypesFrom: aCollectionOfTypes selected: aSelectedCollection for: aRefactoring [
	| stream result |
	stream := WriteStream on: String new.
	aCollectionOfTypes do: [ :each | stream nextPutAll: each name ] separatedBy: [ stream cr ].
	result := Smalltalk ui theme
		textEditorIn: self model window
		text: 'Select classes to move to: (one class per line)'
		title: 'Select classes to move to:'
		entryText: stream contents
		entryHeight: 300.
	result ifNil: [ ^ nil ].
	^ (result asString findTokens: String crlf)
		collect: [ :each | aRefactoring model classFor: (Smalltalk classNamed: each trimBoth) ]
]

{
	#category : #option,
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusRefactoring>>shouldExtractAssignmentTo: aString [
	^ self confirm: ('Do you want to extract the assignment of <1s> at the end of selection?' expandMacrosWith: aString)
]

{
	#category : #option,
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusRefactoring>>shouldInlineExpression: aString [
	^ self confirm: ('Do you want to inline the expression ''<1s>'' in the current method?' expandMacrosWith: aString)
]

{
	#category : #option,
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusRefactoring>>shouldOverride: aSelector in: aClass  [
	^ self confirm: ('<1s> is already defined in the <2p> hierarchy. Extracting it to an existing selector may change behavior. Do you wish to use <1s> anyway?' expandMacrosWith: aSelector with: aClass)
]

{
	#category : #display,
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusRefactoring>>shouldUseExistingMethod: aMethodName [
	"for now we always want to use the existing method."
	^ true
]

{
	#category : #'rewrite code',
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusRefactoring>>sourceRegex [
	self model refactorCode: self sourceRegexText
]

{
	#category : #'rewrite code',
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusRefactoring>>sourceRegexText [
	^ 'RBSourceRegexRefactoring new
	
	"Example 1: Replace symbols with strings"
	replace: ''#(\w+)'' with: ''''''$1'''''' ignoreCase: false;
	
	"Example 2: Replace 4 spaces with tabs"
	replace: ''    '' with: ''	'' ignoreCase: false;

	yourself'
]

{
	#category : #source,
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusRefactoring>>splitCascadeBetween: anInterval from: aMethod [
	self performRefactoringFor: #privateSplitCascadeBetween:from: with: anInterval with: aMethod
]

{
	#category : #class,
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusRefactoring>>splitClass: aClass [
	self performRefactoringFor: #privateSplitClassFor: with: aClass
]

{
	#category : #method,
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusRefactoring>>swapMethodFor: aCollection [
	self performRefactoringsFor: #privateSwapMethodFor: with: aCollection
]

{
	#category : #source,
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusRefactoring>>temporaryToInstanceVariableNamed: name Between: anInterval from: aMethod [
	| refactoring | 
	aMethod ifNil: [ ^ self ].
	refactoring := self privateTemporaryToInstanceVariableNamed: name Between: anInterval from: aMethod.
	self performRefactoring: refactoring
]

{
	#category : #'rewrite code',
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusRefactoring>>typeClass [
	self model sourceCode: (self typeClassTextFor: self model selectedClasses)
]

{
	#category : #'rewrite code',
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusRefactoring>>typeClassTextFor: aCollectionOfClass [
	^ String streamContents: [:s |
		aCollectionOfClass do: [:class |
			s << (RBRefactoryTyper new runOn: class) printString.
			s cr; cr ]]
]

{
	#category : #undo-redo,
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusRefactoring>>undoEnabled [
	^ self changeManager hasUndoableOperations
]

{
	#category : #undo-redo,
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusRefactoring>>undoLabel [
	| stream |
	stream := WriteStream with: 'Undo'.
	self changeManager hasUndoableOperations
		ifFalse: [ ^ stream contents ].
	stream
		nextPut: $ ;
		nextPutAll: self changeManager undoChange name.
	stream position > 40
		ifTrue: [ 
			stream
				position: 40;
				nextPutAll: '...' ].
	^ stream contents
]

{
	#category : #undo-redo,
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusRefactoring>>undoOperation [
	self changeManager undoOperation
]
