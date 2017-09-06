"
ClassWidget is the basic implementation of a widget a list of classes.

Note however that the design is ugly because it mixes UI and Model. 
All the code in this hierarchy is conceptually bogus and should be rewritten.
"
Class {
	#name : #ClassWidget,
	#superclass : #AbstractWidget,
	#instVars : [
		'classesList',
		'classesSelection',
		'classesListElements',
		'cachedHierarchy',
		'showHierarchy'
	],
	#category : #Nautilus-Widgets,
	#timestamp : 'StephaneDucasse 11/11/2015 16:12'
}

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:22'
}
ClassWidget>>abstractColorAdjust: aColor [
			
	^aColor luminance > 0.5
			ifTrue: [ aColor twiceDarker ]
			ifFalse: [ aColor twiceLighter ]
]

{
	#category : #'item creation',
	#timestamp : ' 8/31/2017 05:26:22'
}
ClassWidget>>buildClassesList [
	classesList := self class listClass new
				basicWrapSelector: #classWrapper:;
				keystrokeSelector: #keyPressedOnList:shifted:;
				getIconSelector: #classIconFor:;
				getListSizeSelector: #classListSize;
				
				resetListSelector: #resetClassSelection;
				autoDeselect: true;
				dropEnabled: true;
				dropItemSelector: #dropInClass:inARow:;
				doubleClickSelector: #doubleClick:;
				dragEnabled: true;
				hResizing: #spaceFill;
				vResizing: #spaceFill;
				
				model: self;
				getIndexSelector: #selectedClassIndex;
				setIndexSelector: #selectedClassIndex:;
				getSelectionListSelector: #classSelectionAt:;
				setSelectionListSelector: #classSelectionAt:put:;
				getMenuSelector: #classesMenu:shifted:;
				beMultipleSelection;
				
				getListElementSelector: #getClassItem:.
						
	^ classesList
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:22'
}
ClassWidget>>buildPackageGroupHierarchyFor: aPackageGroup [
	^ self cachedHierarchy class buildHierarchyFor: aPackageGroup in: self model browsedEnvironment
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:22'
}
ClassWidget>>buildTabbedNameOf: anElement [
			
	| tab size stringMorph |
	
	tab := '   '.
	size := self cachedHierarchy indentationFor: anElement.
	
	stringMorph := (size isZero 
		ifTrue: [ anElement name ]
		ifFalse: [ ( tab repeat: size ) , anElement name ]) asStringMorph.
		
	self model selectedPackage ifNotNil: [ :package |
		(package includesClass: anElement) ifFalse: [ 
			stringMorph color: self model extensionColor ] 
	].
	
	anElement hasAbstractMethods ifTrue: [ 	
		stringMorph 
		emphasis: 2; 
		color: (self abstractColorAdjust: stringMorph color)
	].
	
	^ stringMorph
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
ClassWidget>>cachedHierarchy [
	
	^ cachedHierarchy
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
ClassWidget>>cachedHierarchy: anObject [
	
	cachedHierarchy := anObject
]

{
	#category : #'private list model',
	#timestamp : ' 8/31/2017 05:26:22'
}
ClassWidget>>classIconFor: anItem [
	^ self model classIconFor: anItem
]

{
	#category : #'private list model',
	#timestamp : ' 8/31/2017 05:26:22'
}
ClassWidget>>classListSize [
	^ self getClassesList size
]

{
	#category : #'private list model',
	#timestamp : ' 8/31/2017 05:26:22'
}
ClassWidget>>classSelectionAt: anIndex [
	
	| elt |
	elt := self getClassesList at: anIndex ifAbsent: [ ^false ].
	^ self classesSelection at: elt ifAbsent: [ false ]
]

{
	#category : #'private list model',
	#timestamp : ' 8/31/2017 05:26:22'
}
ClassWidget>>classSelectionAt: anIndex put: aBoolean [
	| elt |
	aBoolean ifNil: [ ^ self ].
	elt := self getClassesList at: anIndex ifAbsent: [ ^ self ].
	self classesSelection at: elt put: aBoolean.
	self model changed: #hasSelectedSelections
]

{
	#category : #'private list model',
	#timestamp : ' 8/31/2017 05:26:22'
}
ClassWidget>>classWrapper: anElement [
	^ self sortHierarchically
		ifTrue: [ self buildTabbedNameOf: anElement ]
		ifFalse: [  self wrapFlat: anElement  ]
]

{
	#category : #'private list model',
	#timestamp : ' 8/31/2017 05:26:22'
}
ClassWidget>>classesMenu: aMenu shifted: aBoolean [
	self model classesMenu: aMenu shifted: aBoolean.
	^ aMenu
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:22'
}
ClassWidget>>classesSelection [
	
	^ classesSelection
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:22'
}
ClassWidget>>createClassHierarchyFor: aPackageGroup [

	aPackageGroup ifNil: [ ^ {}].
	self cachedHierarchy: (self buildPackageGroupHierarchyFor: aPackageGroup asNautilusSelection).
	^ self cachedHierarchy sortedElements
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:22'
}
ClassWidget>>createClassListFor: aPackageGroup [

	aPackageGroup ifNil: [ ^ {}].
	^ (SortAlphabeticallyClassList buildListFor: aPackageGroup asNautilusSelection in: self model browsedEnvironment) sortedElements
]

{
	#category : #'private list model',
	#timestamp : ' 8/31/2017 05:26:22'
}
ClassWidget>>doubleClick [
	self model fullBrowse
]

{
	#category : #'private list model',
	#timestamp : ' 8/31/2017 05:26:22'
}
ClassWidget>>doubleClick: ann [
	ann event shiftPressed ifTrue: [ ^ self openFloatingEditorToRenameAtIndex: ann selectedRowIndex  ].
	self model fullBrowse
]

{
	#category : #'drag and drop',
	#timestamp : ' 8/31/2017 05:26:22'
}
ClassWidget>>dragPassengersFor: item inMorph: dragSource [
	| transferType object |
	(dragSource isKindOf: self class listClass)
		ifFalse: [ ^ nil ].
	transferType := self dragTransferTypeForMorph: dragSource.
	object := item originalObject.
	transferType == #getClassItem:
		ifTrue: [ ^ self selectedClasses ifEmpty: [ {object} ] ].
	^ nil
]

{
	#category : #'private list model',
	#timestamp : ' 8/31/2017 05:26:22'
}
ClassWidget>>dropInClass: aCollection inARow: aRow [
	| receiver |
	aRow>0 ifTrue: [  
		receiver := self getClassesList at: aRow.
		receiver := 
		self model showInstance not
			ifTrue: [ receiver theMetaClass ]
			ifFalse: [ receiver theNonMetaClass ].
		self model dropInAClass: aCollection into: receiver]
]

{
	#category : #'private list model',
	#timestamp : ' 8/31/2017 05:26:22'
}
ClassWidget>>getClassItem: anIndex [
	^ self getClassesList at: anIndex
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:22'
}
ClassWidget>>getClassesList [

	^ classesListElements ifNil: [ classesListElements := self loadClassesListElements ].
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:22'
}
ClassWidget>>hasFocus [
	
	^ classesList hasKeyboardFocus
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:22'
}
ClassWidget>>initialize [

	super initialize.

	classesList := nil.
	classesListElements := nil.
	classesSelection := Dictionary new.
	cachedHierarchy := SortHierarchically new.
	showHierarchy := false.
]

{
	#category : #'private list model',
	#timestamp : ' 8/31/2017 05:26:22'
}
ClassWidget>>keyPressedOnList: anEvent shifted: aBoolean [
		| aCharacter |

	aCharacter := anEvent keyCharacter.

	(aCharacter == self model class nextFocusKey) ifTrue: [ ^ self model giveFocusTo: self model categoryWidget ].
	(aCharacter == self model class previousFocusKey) ifTrue: [ ^ self model giveFocusToPackage ].
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:22'
}
ClassWidget>>loadClassHierarchyListElements [
	^ self cachedHierarchy sortedElements 
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:22'
}
ClassWidget>>loadClassesListElements [
	^ self showHierarchy
		ifTrue: [ self loadClassHierarchyListElements ]
		ifFalse: [ self loadPackageClassListElements ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:22'
}
ClassWidget>>loadPackageClassListElements [
	^ self sortHierarchically
		ifTrue: [ self createClassHierarchyFor: self model selectedPackageGroup ]
		ifFalse: [ self createClassListFor:self model selectedPackageGroup ]
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:22'
}
ClassWidget>>okToChange [
	^ model okToChange
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:22'
}
ClassWidget>>openFloatingEditorToRenameAtIndex: anIndex [
	| selectedRowMorph ed clsMorph vScroll font cls |
	cls := self model selectedClass theNonMetaClass.
	vScroll := self vScrollValue.
	selectedRowMorph := classesList visibleRowMorphAtIndex: anIndex.
	clsMorph := selectedRowMorph lastSubmorph lastSubmorph.
	font := clsMorph font.
	ed := RubFloatingEditorBuilder new
		customizeEditorWith:
				[ :editor | 
			| right |
			editor font: font.
			editor scrollbarsShowNever.
			right := classesList isVerticalScrollBarVisible
				ifTrue: [ classesList verticalScrollBar left ]
				ifFalse: [ selectedRowMorph right ].
			editor
				bounds:
					(clsMorph topLeft corner: right @ selectedRowMorph bottom) ];
		withEditedContentsDo:
				[ :editedContents | 
			| newName |
			newName := editedContents asString trimBoth.
			(newName = cls name asString or: [ newName isEmpty])
				ifFalse: [self renameClass: cls toBe: newName.
					self vScrollValue: vScroll ] ].
	ed openEditorWithContents: cls name asString thenDo: [ :editor | editor selectAll  ]
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:22'
}
ClassWidget>>renameClass: aClass toBe: aString [
	| newName oldName obs |
	aString isEmptyOrNil ifTrue: [ ^ self ].	"Cancel returns"
	newName := aString asSymbol.
	newName = aClass name asSymbol ifTrue: [ ^ self ].
	oldName := aClass name asSymbol.
	(aClass environment includesKey: newName)
		ifTrue: [ ^ self inform: newName , ' already exists' ].
	aClass rename: newName.

	obs := self model systemNavigation allReferencesTo: (aClass environment associationAt: newName).
	obs isEmpty
		ifFalse: [ self model systemNavigation browseMessageList: obs name: 'Obsolete References to ' , oldName autoSelect: oldName ].
	^ newName
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:22'
}
ClassWidget>>resetClassList [
	classesListElements := nil.
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:22'
}
ClassWidget>>resetClassSelection [
	self classesSelection removeAll
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:22'
}
ClassWidget>>selectClass: aClass [
	self classesSelection at: aClass theNonMetaClass put: true.

]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:22'
}
ClassWidget>>selectedClass [
	^ self selectedClasses ifEmpty:[ nil]  ifNotEmpty:[: col | col first]
]

{
	#category : #'private list model',
	#timestamp : ' 8/31/2017 05:26:22'
}
ClassWidget>>selectedClassIndex [
	| item |
	item := self selectedClass.
	self model showInstance
		ifFalse: [ item ifNotNil: [ item := item theNonMetaClass ] ].
	^ self getClassesList indexOf: item
]

{
	#category : #'private list model',
	#timestamp : ' 8/31/2017 05:26:22'
}
ClassWidget>>selectedClassIndex: anInteger [
	| selection |
	
	selection := self getClassesList at: anInteger ifAbsent: [nil].
	
	self model showInstance ifFalse: [selection ifNotNil: [selection := selection theMetaClass]].
	self model selectedClassWithoutChangingSelection: selection.
	
	self changed: #selectedClassIndex.
	self model changed: #currentHistoryIndex.
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:22'
}
ClassWidget>>selectedClasses [

	| associations |
	associations := self classesSelection associations select: [:assoc | assoc value ].
	associations := associations collect: [:assoc | assoc key ].
	^ associations select: [:each | each notNil ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:22'
}
ClassWidget>>setCachedHierarchyClass: aClass [
    
	self cachedHierarchy: (SortHierarchically buildHierarchyForClass: aClass) 
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:22'
}
ClassWidget>>showHierarchy [
	
	^ showHierarchy
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:22'
}
ClassWidget>>showHierarchy: aBoolean [

	(showHierarchy := aBoolean)
		ifTrue: [ self selectedClass ifNotNil: [ :class | self setCachedHierarchyClass: class ] ]
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:22'
}
ClassWidget>>showHierarchy: aBoolean forClass: class [

	(showHierarchy := aBoolean)
		ifTrue: [ class ifNotNil: [ self setCachedHierarchyClass: class ] ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
ClassWidget>>sortHierarchically [
	^ self model sortHierarchically
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:22'
}
ClassWidget>>takeKeyboardFocus [

	classesList takeKeyboardFocus
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:22'
}
ClassWidget>>vScrollValue [

	^ classesList scrollValue y
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:22'
}
ClassWidget>>vScrollValue: aNumber [

	^ classesList vScrollValue: aNumber
]

{
	#category : #'drag and drop',
	#timestamp : ' 8/31/2017 05:26:22'
}
ClassWidget>>wantsDroppedMorph: transferMorph event: anEvent inMorph: destinationLM [
	| srcType dstType |
	"only want drops on lists (not, for example, on pluggable texts)"
	(destinationLM isKindOf: self class listClass)
		ifFalse: [ ^ false ].
	srcType := transferMorph dragTransferType.
	dstType := self dragTransferTypeForMorph: destinationLM.
	srcType == #getMethodItem:
		ifTrue: [ ^ dstType == #getClassItem: ].
	srcType == #getCategoryItem:
		ifTrue: [ ^ dstType == #getClassItem: ].
	^ false
	

]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:22'
}
ClassWidget>>wrapFlat: anElement [
	| result |
	result := anElement name.
	^ self model selectedPackage
		ifNil: [ result ]
		ifNotNil: [ :package | 
			(package includesClass: anElement)
				ifTrue: [ result asStringMorph ]
				ifFalse: [ 
					result asStringMorph
						color: self model extensionColor;
						yourself ] ]
]
