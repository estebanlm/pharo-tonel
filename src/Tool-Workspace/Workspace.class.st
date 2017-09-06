"
I'm workspace: a great place to execute top-level expressions to compute something useful, and it is a great place to develop bits of a program before those bits get put into class methods.

To open a new workspace, execute one of the following expression:

[[[
	self open

	self openContents: '''Pharo is cool'''

	self openLabel: 'A cleaner workspace'
	
	self open label: 'Tutu'
]]]



"
Class {
	#name : #Workspace,
	#superclass : #Model,
	#instVars : [
		'textModel',
		'bindings',
		'window',
		'fileName',
		'lineEnding',
		'encoding',
		'textView'
	],
	#classVars : [
		'LastContents'
	],
	#category : #Tool-Workspace,
	#timestamp : 'StephaneDucasse 6/20/2015 10:09'
}

{
	#category : #cleaning,
	#timestamp : ' 8/31/2017 05:26:18'
}
Workspace class>>cleanUp [
	LastContents := nil.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
Workspace class>>lastContents [
	^ LastContents ifNil: [LastContents := OrderedCollection new]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
Workspace class>>maxKeptContents [
	^ 30
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:18'
}
Workspace class>>open [
	^ self new openLabel: self title ; yourself
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:18'
}
Workspace class>>openContents: aString [
	"Open a new workspace with the given contents. It looks better when aString is code since the style is applied"

	^ self new
		open;
		contents: aString;
		yourself
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:18'
}
Workspace class>>openLabel: aLabel [
	^ self new openLabel: aLabel ; yourself
]

{
	#category : #'tool registry',
	#timestamp : ' 8/31/2017 05:26:18'
}
Workspace class>>registerToolsOn: registry [
	"Add ourselves to registry. See [Smalltalk tools]" 
	registry register: self as: #workspace

]

{
	#category : #icons,
	#timestamp : ' 8/31/2017 05:26:18'
}
Workspace class>>taskbarIconName [
	"Answer the icon for the receiver in a task bar."

	^#workspaceIcon
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:18'
}
Workspace class>>title  [
	^ 'Workspace'
]

{
	#category : #'window menu',
	#timestamp : ' 8/31/2017 05:26:18'
}
Workspace>>addModelItemsToWindowMenu: aMenu [
	aMenu addLine.
	aMenu add: 'Open...' target: self selector: #openMenuAction.
	aMenu lastItem icon: (self iconNamed: #smallOpenIcon).
	aMenu add: 'Save as...' target: self selector: #saveAsMenuAction.
	aMenu lastItem icon: (self iconNamed: #smallSaveAsIcon).
	aMenu addLine.
	aMenu
		add: 'Encoding'
		subMenu:
			([ :menu | 
			TextConverter allEncodingNames
				do: [ :ea | 
					menu
						addUpdating: #itemForEncoding:
						target: self
						selector: #useEncoding:
						argumentList: {ea} ].
			menu ] value: (UIManager default newMenuIn: self for: self)).
	aMenu addLine.
	aMenu add: 'Inspect variables' target: self selector: #browseBindings.
	aMenu
		add: 'Reset variables'
		target: self
		selector: #initializeBindings.
	aMenu
		add: 'Previous contents...'
		target: self
		selector: #selectPreviousContent.
	aMenu addLine
]

{
	#category : #'file support',
	#timestamp : ' 8/31/2017 05:26:18'
}
Workspace>>askForFileNameToOpen [
	"Ask user for file name to load content from"
	^ UIManager default
			chooseFullFileNameMatching: nil 
			label: 'Choose file to open in the workspace' translated
]

{
	#category : #'file support',
	#timestamp : ' 8/31/2017 05:26:18'
}
Workspace>>askForFileNameToSave: suggestedFileName [
	"Ask user for the name of the file to save workspace content to. Use the given file name as the initial answer"

	^ UIManager default
			request: 'Enter file name to save the workspace to' translated 
			initialAnswer: suggestedFileName
]

{
	#category : #'variable definitions',
	#timestamp : ' 8/31/2017 05:26:18'
}
Workspace>>bindingOf: aString  [
	(bindings includesKey: aString)
		ifFalse: [ bindings add: (WorkspaceVariable key: aString asSymbol) ].
	^ bindings associationAt: aString
]

{
	#category : #'variable definitions',
	#timestamp : ' 8/31/2017 05:26:18'
}
Workspace>>browseBindings [
	bindings inspect
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
Workspace>>contents [

	^ textModel getText
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
Workspace>>contents: aString [

	^ textModel setText: aString
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:18'
}
Workspace>>createTextView [
	| v |
	v := textModel newScrolledText
		withRuler: RubWorkspaceBar new;
		beWrapped;
		yourself.
	v announcer when: RubTextAccepted send: #whenTextAccepted: to: self.
	^ v
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:18'
}
Workspace>>defaultTextModel [
	^ RubScrolledTextModel new interactionModel: self
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
Workspace>>doItContext [
	^ nil
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
Workspace>>doItReceiver [
	^ nil
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
Workspace>>fileName [
	^ fileName
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
Workspace>>fileName: anObject [
	fileName := anObject
]

{
	#category : #'shout bindings',
	#timestamp : ' 8/31/2017 05:26:18'
}
Workspace>>guessTypeForName: aString [
	| binding |
	bindings
		ifNotNil: [ 
			binding := bindings at: aString ifAbsent: [ nil ].
			binding isNil
				ifFalse: [ ^ binding class ] ].
	^ nil
]

{
	#category : #'shout bindings',
	#timestamp : ' 8/31/2017 05:26:18'
}
Workspace>>hasBindingOf: aString  [
	^(self guessTypeForName: aString) notNil
]

{
	#category : #'shout bindings',
	#timestamp : ' 8/31/2017 05:26:18'
}
Workspace>>hasBindingThatBeginsWith: aString [
	^ bindings keys anySatisfy: [:each | each beginsWith: aString]
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:18'
}
Workspace>>initialize [
	super initialize.
	textModel := self defaultTextModel.
	encoding := TextConverter default class encodingNames first.
	self initializeBindings
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:18'
}
Workspace>>initializeBindings [
	
	bindings := Dictionary new
]

{
	#category : #'window menu',
	#timestamp : ' 8/31/2017 05:26:18'
}
Workspace>>itemForEncoding: aString [
	^ encoding = aString -> aString
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
Workspace>>label: aString [

	window title: aString
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
Workspace>>lastContents [
	^ self class lastContents 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
Workspace>>maxKeptContents [
	^ self class maxKeptContents 
]

{
	#category : #view,
	#timestamp : ' 8/31/2017 05:26:18'
}
Workspace>>open [
	
	self openLabel: self class title
]

{
	#category : #'file support',
	#timestamp : ' 8/31/2017 05:26:18'
}
Workspace>>openFile: aFileName [
	"Load file content into this workspace. If successful, associate the workspace with this file and change its label"
	
	self readStringFromFile: aFileName.
	self fileName: aFileName.
	self label: aFileName.
]

{
	#category : #view,
	#timestamp : ' 8/31/2017 05:26:18'
}
Workspace>>openLabel: aString [
	
	window := StandardWindow new model: self.
	window title: aString.
	window
		addMorph: self textView
		fullFrame: LayoutFrame identity.
	window openInWorld
	


]

{
	#category : #'window menu',
	#timestamp : ' 8/31/2017 05:26:18'
}
Workspace>>openMenuAction [
	"Open content of the file choosed by user in this workspace and associate it's name with this workspace"
	| userWarned |

	userWarned := true.
	(self fileName isNil and: [self contents isEmpty not or: [self hasUnacceptedEdits]]) ifTrue: [userWarned := self warnUser].
	(self fileName isNil not and: [self hasUnacceptedEdits]) ifTrue: [userWarned := self warnUser].
	
	userWarned ifTrue: [self openFile: self askForFileNameToOpen]
]

{
	#category : #'file support',
	#timestamp : ' 8/31/2017 05:26:18'
}
Workspace>>readStringFromFile: aFileName [
	"Read the content of the given file."

	| readStream fileContent |
	readStream := (File named: aFileName) openForRead.
	fileContent := ZnCharacterReadStream on: readStream encoding: encoding.
	self contents: fileContent upToEnd asString
]

{
	#category : #'window menu',
	#timestamp : ' 8/31/2017 05:26:18'
}
Workspace>>saveAsMenuAction [
	"Save the receiver's contents string to a file, prompting the user for a file-name.  Suggest a reasonable file-name."

	| suggestedFileName |
	suggestedFileName := self askForFileNameToSave: self suggestedFileName.
	suggestedFileName ifNil: [ ^ self ].
	self fileName: suggestedFileName.
	self label: suggestedFileName.
	textModel ifNotNil: [ :model | self saveString: model getString toFile: suggestedFileName ]
]

{
	#category : #'file support',
	#timestamp : ' 8/31/2017 05:26:18'
}
Workspace>>saveString: aString toFile: aFileName [
	"Save the given string to the given file"

	| writeStream fileContent fullFilename |
	fullFilename := aFileName asFileReference fullName.
	writeStream := (File named: fullFilename) openForWrite.
	fileContent := ZnCharacterWriteStream on: writeStream encoding: encoding.
	fileContent nextPutAll: aString
]

{
	#category : #history,
	#timestamp : ' 8/31/2017 05:26:18'
}
Workspace>>selectPreviousContent [

	| trimmedContents  |
	trimmedContents := self lastContents collect: [:c | c copyFrom: 1 to: (c size min: 20)].
	^ (UIManager default chooseFrom: trimmedContents values: self lastContents)
		ifNotNil: [ :newContents | self setContent: newContents ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
Workspace>>selectedClassOrMetaClass [
	^ nil
]

{
	#category : #menu,
	#timestamp : ' 8/31/2017 05:26:18'
}
Workspace>>selectedMethod [
	^ nil
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
Workspace>>setBindings: aDictionary [
	"Sets the Workspace to use the specified dictionary as its namespace"

	bindings := aDictionary.

]

{
	#category : #'file support',
	#timestamp : ' 8/31/2017 05:26:18'
}
Workspace>>suggestedFileName [
	"If the workspace has an associated fileName use that, otherwise derive a reasonable file-name from the window label"
	
	self fileName ifNotNil: [ :f | ^ f ].
	^ window title, '.ws'
]

{
	#category : #view,
	#timestamp : ' 8/31/2017 05:26:18'
}
Workspace>>textView [
	^ textView ifNil:[ textView := self createTextView]
]

{
	#category : #'window menu',
	#timestamp : ' 8/31/2017 05:26:18'
}
Workspace>>useEncoding: aString [
	encoding := aString.
	textModel hasUnacceptedEdits: true
]

{
	#category : #'window menu',
	#timestamp : ' 8/31/2017 05:26:18'
}
Workspace>>warnUser [
	"Warn the user about the possible content loss"

	^ UIManager default confirm: 'This will replace the current workspace content.', String cr, 'Do you want to continue?' translated
]

{
	#category : #update,
	#timestamp : ' 8/31/2017 05:26:18'
}
Workspace>>whenTextAccepted: anAnnouncement [
	self lastContents size > self maxKeptContents
		ifTrue: [ self lastContents removeFirst ].
	self lastContents add: textModel getText copy
]
