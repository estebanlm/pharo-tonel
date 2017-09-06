"
I declare the instance variables methodDict, traitComposition and localSelectors that normally would be defined on PureBehavior (see class comment of PureBehavior). Furthermore I keep track of where I am used and I provide compatibility methods to make me useable in tools where originally a class was expected.
"
Class {
	#name : #TraitBehavior,
	#superclass : #Object,
	#instVars : [
		'methodDict',
		'traitComposition',
		'localSelectors',
		'users'
	],
	#classVars : [
		'TraitProperties'
	],
	#category : #Traits-Kernel,
	#timestamp : 'apb 3/2/2006 17:49'
}

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior class>>initialize [

	TraitProperties
		ifNil: [ TraitProperties := WeakIdentityKeyDictionary new ]
		ifNotNil: [ | newDict | 
			newDict := WeakIdentityKeyDictionary newFrom: TraitProperties.
			newDict rehash.
			TraitProperties := newDict ]
]

{
	#category : #'accessing method dictionary',
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>>> selector  [
	"Answer the compiled method associated with the argument, selector (a 
	Symbol), a message selector in the receiver's method dictionary. If the 
	selector is not in the dictionary, create an error notification."

	^self compiledMethodAt: selector

]

{
	#category : #traits,
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>addExclusionOf: aSymbol to: aTrait [
	self setTraitComposition: (
		self traitComposition copyWithExclusionOf: aSymbol to: aTrait)
]

{
	#category : #'obsolete subclasses',
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>addObsoleteSubclass: aClass [
	"Weakly remember that aClass was a subclass of the receiver and is now obsolete"
	| obs |

	obs := self basicObsoleteSubclasses at: self ifAbsent:[WeakArray new].
	(obs includes: aClass) ifTrue:[^self].
	obs := obs copyWithout: nil.
	obs := obs copyWith: aClass.
	self basicObsoleteSubclasses at: self put: obs.
]

{
	#category : #'adding/removing methods',
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>addSelector: selector withMethod: compiledMethod  [
	^ self addSelector: selector withMethod: compiledMethod notifying: nil
]

{
	#category : #'adding/removing methods',
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>addSelector: selector withMethod: compiledMethod notifying: requestor [
	^ self addSelectorSilently: selector withMethod: compiledMethod
]

{
	#category : #'adding/removing methods',
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>addSelectorSilently: selector withMethod: compiledMethod [
	self basicAddSelector: selector withMethod: compiledMethod.
	self registerLocalSelector: selector.
	self isTrait ifTrue: [ self notifyUsersOfChangedSelector: selector].
]

{
	#category : #traits,
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>addToComposition: aTrait [
	self setTraitComposition: (self traitComposition copyTraitExpression
		add: aTrait;
		yourself)
]

{
	#category : #traits,
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>addTraitSelector: aSymbol withMethod: aCompiledMethod [
	"Add aMethod with selector aSymbol to my
	methodDict. aMethod must not be defined locally."

	| source method |
	[(self includesLocalSelector: aSymbol) not] assert.
	self ensureLocalSelectors.
		
	source := aCompiledMethod getSourceReplacingSelectorWith: aSymbol.
	method  := aCompiledMethod copy.
	method selector: aSymbol.
	method methodClass: self.
		
	"write source to changes file only if we have it (not available during bootstrap)"	
	((Smalltalk globals includesKey: #SourceFiles) and: [ (Smalltalk globals at: #SourceFiles) notNil]) ifTrue: [ 
		method putSource: source
			withPreamble: [:f | f cr; nextPut: $!; nextChunkPut: 'Trait method'; cr]].
	
	method properties at: #traitSource put: aCompiledMethod.
	
	self basicAddSelector: aSymbol withMethod: method
]

{
	#category : #traits,
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>addUser: aClassOrTrait [
	self traitUsers add: aClassOrTrait.
]

{
	#category : #'adding/removing methods',
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>adoptInstance: anInstance [
	"Change the class of anInstance to me.
	Primitive (found in Cog and new VMs)  follows the same rules as primitiveChangeClassTo:, but returns the 	class rather than the modified instance"
	<primitive: 160 error: ec>
	anInstance primitiveChangeClassTo: self basicNew.
	^self
]

{
	#category : #'accessing instances and variables',
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>allClassVarNames [
	"Answer a Set of the names of the receiver's and the receiver's ancestor's 
	class variables."

	^self superclass allClassVarNames
]

{
	#category : #'accessing instances and variables',
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>allInstVarNames [
	"Answer an Array of the names of the receiver's instance variables. The 
	Array ordering is the order in which the variables are stored and 
	accessed by the interpreter."

	| vars |
	self superclass == nil
		ifTrue: [vars := self instVarNames copy]	"Guarantee a copy is answered."
		ifFalse: [vars := self superclass allInstVarNames , self instVarNames].
	^vars
]

{
	#category : #'accessing instances and variables',
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>allInstances [
	"Answer all instances of the receiver."
	self error: 'Traits does not have instances.'
]

{
	#category : #enumerating,
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>allInstancesDo: aBlock [
	"Evaluate aBlock with each of the current instances of the receiver."
	self error: 'Traits does not have instances.'
]

{
	#category : #'accessing instances and variables',
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>allInstancesOrNil [
	"Answer all instances of the receiver, or nil if the primitive
	 fails, which it may be due to being out of memory."
	self error: 'Traits does not have instances.'
]

{
	#category : #'obsolete subclasses',
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>allLocalCallsOn: aSymbol [
	"Answer a SortedCollection of all the methods that call on aSymbol, anywhere in my class hierarchy."

	^(SystemNavigation new allLocalCallsOn: aSymbol ofClass: (self theNonMetaClass)).

]

{
	#category : #'accessing method dictionary',
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>allMethods [
	"Return the collection of compiled method I and my superclasses are defining"
	"asArray is used to not bump into a bug when comparing compiled methods."
	
	^ self allSelectors asArray collect: [ :s | self lookupSelector: s ]
]

{
	#category : #queries,
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>allMethodsAccessingSlot: aSlot [
	"return all methods that access aSlot in this class and subclasses"
	^self withAllSubclasses flatCollect: [ :class |
		class methodsAccessingSlot: aSlot.
	]
]

{
	#category : #'accessing method dictionary',
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>allSelectors [
	"Answer all selectors understood by instances of the receiver"

	^ self allSelectorsBelow: nil
]

{
	#category : #'accessing method dictionary',
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>allSelectorsAbove [

	^ self allSelectorsAboveUntil: ProtoObject 
	


]

{
	#category : #'accessing method dictionary',
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>allSelectorsAboveUntil: aRootClass [

	| coll |
	coll := IdentitySet new.
	(self allSuperclassesIncluding: aRootClass) 
		do: [:aClass | 
				aClass selectorsDo: [ :sel | coll add: sel ]].
	^ coll
	


]

{
	#category : #'accessing method dictionary',
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>allSelectorsBelow: topClass  [
	| coll |
	coll := IdentitySet new.
	self withAllSuperclassesDo: 
			[:aClass | 
			aClass = topClass
				ifTrue: [^ coll ]
				ifFalse: [aClass selectorsDo: [ :sel | coll add: sel ]]].
	^ coll
	


]

{
	#category : #'accessing method dictionary',
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>allSelectorsWithout: behaviors [
	"Returns all the selectors of the receiver and its superclasses, except the ones define in behaviors"

	| selectors |
	selectors := IdentitySet new.
	self withAllSuperclassesDo: [ :class | 
			(behaviors includes: class)
				ifFalse: [ selectors addAll: class selectors ] ].
	^ selectors
]

{
	#category : #'accessing instances and variables',
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>allSharedPools [
	"Answer an ordered collection of the shared pools that the receiver and the receiver's ancestors share."

	^self superclass allSharedPools
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>allSlots [
	^#()
]

{
	#category : #'accessing instances and variables',
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>allSubInstances  [
	"Answer a list of all current instances of the receiver and all of its subclasses."
	| aCollection |
	aCollection := OrderedCollection new.
	self allSubInstancesDo:
		[:x | x == aCollection ifFalse: [aCollection add: x]].
	^ aCollection
]

{
	#category : #enumerating,
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>allSubInstancesDo: aBlock  [
	"Evaluate the argument, aBlock, for each of the current instances of the 
	receiver and all its subclasses."

	self allInstancesDo: aBlock.
	self allSubclassesDo: [:sub | sub allInstancesDo: aBlock]
]

{
	#category : #'accessing class hierarchy',
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>allSubclasses [
	"Answer an orderedCollection of the receiver's and the receiver's descendent's subclasses. "

	| scan scanTop |
	scan := OrderedCollection withAll: self subclasses.
	scanTop := 1.
	[scanTop > scan size]
		whileFalse: [scan addAll: (scan at: scanTop) subclasses.
			scanTop := scanTop + 1].
	^ scan
]

{
	#category : #enumerating,
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>allSubclassesDo: aBlock  [
	"Evaluate the argument, aBlock, for each of the receiver's subclasses."

	self subclassesDo: 
		[:cl | 
		aBlock value: cl.
		cl allSubclassesDo: aBlock]
]

{
	#category : #'accessing class hierarchy',
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>allSubclassesWithLevelDo: classAndLevelBlock startingLevel: level  [
	"Walk the tree of subclasses, giving the class and its level"
	| subclassNames |
	classAndLevelBlock value: self value: level.
	self == Class ifTrue:  [^ self].  "Don't visit all the metaclasses"
	"Visit subclasses in alphabetical order"
	subclassNames := SortedCollection new.
	self subclassesDo: [:subC | subclassNames add: subC name].
	subclassNames do:
		[:name | (self environment at: name)
			allSubclassesWithLevelDo: classAndLevelBlock
			startingLevel: level+1]
]

{
	#category : #'accessing class hierarchy',
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>allSuperclasses [
	"Answer an OrderedCollection of the receiver's and the receiver's  
	ancestor's superclasses. The first element is the receiver's immediate  
	superclass, followed by its superclass; the last element is Object."
	| temp |
	^ self superclass == nil
		ifTrue: [ OrderedCollection new]
		ifFalse: [temp := self superclass allSuperclasses.
			temp addFirst: self superclass.
			temp]
]

{
	#category : #enumerating,
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>allSuperclassesDo: aBlock  [
	"Evaluate the argument, aBlock, for each of the receiver's superclasses."

	self superclass == nil
		ifFalse: [aBlock value: self superclass.
				self superclass allSuperclassesDo: aBlock]
]

{
	#category : #'accessing class hierarchy',
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>allSuperclassesIncluding: aClass [
	"Answer an OrderedCollection of the receiver's and the receiver's  ancestor's superclasses
	up to aClass included. If aClass is not part of the receiver's superclass, returns up to the root."
	| temp |
	self class == ProtoObject class ifTrue: [ ^ OrderedCollection new].
	^ self superclass == aClass
		ifTrue: [ OrderedCollection with: aClass]
		ifFalse: [temp := self superclass allSuperclassesIncluding: aClass.
			temp addFirst: self superclass.
			temp]
]

{
	#category : #enumerating,
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>allUnreferencedInstanceVariables [
	"Return a list of the instance variables known to the receiver which are not referenced in the receiver or any of its subclasses OR superclasses"

	^ self allInstVarNames reject: [:ivn |
		| definingClass |		
		definingClass := self classThatDefinesInstanceVariable: ivn.
		definingClass withAllSubclasses anySatisfy: [:class |  
				(class whichSelectorsAccess: ivn asSymbol) notEmpty]]
]

{
	#category : #traits,
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>applyChangesOfNewTraitCompositionReplacing: oldComposition [
	| changedSelectors |
	changedSelectors := self traitComposition
		changedSelectorsComparedTo: oldComposition.
	changedSelectors isEmpty ifFalse: [
		self noteChangedSelectors: changedSelectors].
	self traitComposition isEmpty ifTrue: [
		self purgeLocalSelectors].
	^changedSelectors
]

{
	#category : #'adding/removing methods',
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>basicAddSelector: selector withMethod: compiledMethod  [
	"Add the message selector with the corresponding compiled method to the 
	receiver's method dictionary.
	Do this without sending system change notifications"

	| oldMethodOrNil |	
	oldMethodOrNil := self lookupSelector: selector.
	self methodDict at: selector put: compiledMethod.
	compiledMethod methodClass: self.
	compiledMethod selector: selector.
]

{
	#category : #'accessing method dictionary',
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>basicLocalSelectors [
	"Direct accessor for the instance variable localSelectors.
	Since localSelectors is lazily initialized, this may 
	return nil, which means that all selectors are local."

	^ localSelectors
]

{
	#category : #'accessing method dictionary',
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>basicLocalSelectors: aSetOrNil [
	localSelectors := aSetOrNil
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>basicNew [
	self error: 'Traits cannot create instances'.
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>basicNew: sizeRequested  [
	self error: 'Traits cannot create instances'.
]

{
	#category : #'obsolete subclasses',
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>basicObsoleteSubclasses [
	^WeakKeyToCollectionDictionary new.
]

{
	#category : #'adding/removing methods',
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>basicRemoveSelector: selector  [
	"Assuming that the argument, selector (a Symbol), is a message selector 
	in my method dictionary, remove it and its method."

	| oldMethod |
	oldMethod := self methodDict at: selector ifAbsent: [^ self].
	self methodDict removeKey: selector.
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>becomeCompact [
	"Backward compatibility with the Squeak V3 object format.
	Spur does not have a distinction between compact and non-compact classes."
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>becomeCompactSimplyAt: index [
	"Backward compatibility with the Squeak V3 object format.
	Spur does not have a distinction between compact and non-compact classes."
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>becomeUncompact [
	"Backward compatibility with the Squeak V3 object format.
	 Spur does not have a distinction between compact and non-compact classes."
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>binding [
	^ nil -> self
]

{
	#category : #'accessing instances and variables',
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>bindingOf: varName [
	
	"Answer the binding of some variable resolved in the scope of the receiver"

	^ self environment bindingOf: varName asSymbol.
]

{
	#category : #'testing method dictionary',
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>canPerform: selector [
	"Answer whether the receiver can safely perform to the message whose selector 
	is the argument: it is not an abstract or cancelled method"

	^ self classAndMethodFor: selector do: [:c :m | m isProvided] ifAbsent: [false].
]

{
	#category : #'testing method dictionary',
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>canUnderstand: selector [
	"Answer whether the receiver can respond to the message whose selector 
	is the argument."

	^ self
		classAndMethodFor: selector
		do: [ :c :m | true ]
		ifAbsent: [ false ].
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>canZapMethodDictionary [
	"Return true if it is safe to zap the method dictionary on #obsolete"
	^true
]

{
	#category : #'accessing method dictionary',
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>classAndMethodFor: aSymbol do: binaryBlock ifAbsent: absentBlock [
	"Looks up the selector aSymbol in the class chain. If it is found, binaryBlock is evaluated
	with the class that defines the selector and the associated method. Otherwise
	absentBlock is evaluated."

	
	self withAllSuperclassesDo: [:class | | method |
		method := class compiledMethodAt: aSymbol ifAbsent: [nil].
		method ifNotNil: [^ binaryBlock value: class value: method].
	].
	^ absentBlock value.
]

{
	#category : #'testing method dictionary',
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>classBindingOf: varName [
	"Answer the binding of some variable resolved in the scope of the receiver's class"
	^self bindingOf: varName
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>classDepth [

	self superclass ifNil: [^ 1].
	^ self superclass classDepth + 1
]

{
	#category : #'accessing instances and variables',
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>classVarNames [
	"Answer a collection of the receiver's class variable names."

	^#()
]

{
	#category : #traits,
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>classesComposedWithMe [
	self isTrait
		ifTrue: [ ^ self traitUsers flatCollect: [ :u | u classesComposedWithMe ] ]
		ifFalse: [ ^ {self} ]
]

{
	#category : #cleanup,
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>cleanUp [
	"Clean out any caches and other state that should be flushed when trying to get an image into a pristine state. Subclasses may override #cleanUp: to provide different levels of cleanliness"

]

{
	#category : #cleanup,
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>cleanUp: aggressive [
	"Clean out any caches and other state that should be flushed when trying to get an image into a pristine state. The argument should be used to indicate how aggressive the cleanup should be. Some subclasses may act differently depending on its value - for example, ChangeSet will only delete all unused and reinitialize the current change set if we're asking it to be aggressive."

	^self cleanUp
]

{
	#category : #'accessing method dictionary',
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>commentsAt:  selector [
	"Answer a string representing the first comment in the method associated with selector.  Return an empty string if the relevant source file is not available, or if the method's source code does not contain a comment.  Not smart enough to bypass quotes in string constants, but does map doubled quote into a single quote."


	^self commentsIn:  (self sourceCodeAt: selector) asString.
	
"Behavior commentsAt: #commentsAt:"
]

{
	#category : #'accessing method dictionary',
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>commentsIn: sourceString [

	
	| commentStart nextQuotePos someComments aPos |
	('*"*' match: sourceString) ifFalse: [^#()].
	someComments:= OrderedCollection new.
	sourceString size = 0 ifTrue: [^ someComments].
	aPos:=1.
	nextQuotePos:= 0.
	[commentStart := sourceString findString: '"' startingAt: aPos.
	nextQuotePos:= self nextQuotePosIn: sourceString startingFrom: commentStart.
	(commentStart ~= 0 and: [nextQuotePos >commentStart])] whileTrue: [
		commentStart ~= nextQuotePos ifTrue: [
			someComments add: ((sourceString copyFrom: commentStart + 1 to: nextQuotePos - 1) copyReplaceAll: '""' with: '"').].
	aPos := nextQuotePos+1].
	^someComments
]

{
	#category : #'accessing method dictionary',
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>compiledMethodAt: selector  [
	"Answer the compiled method associated with the argument, selector (a 
	Symbol), a message selector in the receiver's method dictionary. If the 
	selector is not in the dictionary, create an error notification."

	^ self methodDict at: selector
]

{
	#category : #'accessing method dictionary',
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>compiledMethodAt: selector ifAbsent: aBlock [
	"Answer the compiled method associated with the argument, selector (a Symbol), a message selector in the receiver's method dictionary. If the selector is not in the dictionary, return the value of aBlock"

	^ self methodDict at: selector ifAbsent: aBlock
]

{
	#category : #'accessing method dictionary',
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>compiledMethodAt: selector ifPresent: anotherBlock ifAbsent: aBlock [
	"Answer the compiled method associated with the argument, selector (a Symbol), a message selector in the receiver's method dictionary. If the selector is not in the dictionary, return the value of aBlock"

	^ self methodDict at: selector ifPresent: anotherBlock ifAbsent: aBlock
]

{
	#category : #'accessing method dictionary',
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>compress [
	"Compact the method dictionary of the receiver."

	self methodDict rehash
]

{
	#category : #queries,
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>copiedFromSuperclass: method [
	"Returns the methods that the receiver copied with its ancestors"
	
	self allSuperclassesDo: [ :cls|
		(cls includesSelector: method selector)
			ifTrue: [ 
				((cls >> method selector) sourceCode  = method sourceCode)
					ifTrue: [ ^ {cls >> method selector}]
					ifFalse: [ ^ #()]]].
	^ #().
	
]

{
	#category : #queries,
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>copiedMethodsFromSuperclass [
	"Returns the methods that the receiver copied with its ancestors"
	
	| methods |
	methods := OrderedCollection new.
	self methodsDo: [ :method|
		methods addAll:  (self copiedFromSuperclass: method)].
	^ methods
]

{
	#category : #queries,
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>copiesFromSuperclass: method [
	"Checks whether the receiver copied the argument,  method, from its superclasses"
	
	self allSuperclassesDo: [ :cls|
		(cls includesSelector: method selector)
			ifTrue: [ ^ (cls >> method selector) sourceCode  = method sourceCode]].
	^ false
]

{
	#category : #queries,
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>copiesMethodsFromSuperclass [
	"Checks whether the receiver copied some method from its superclass"

	self methodsDo: [ :method|
		(self copiesFromSuperclass: method)
			ifTrue: [ ^ true ]].
	^ false
]

{
	#category : #copying,
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>copyOfMethodDictionary [
	"Return a copy of the receiver's method dictionary"

	^ self methodDict copy
]

{
	#category : #copying,
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>deepCopy [
	"Classes should only be shallowCopied or made anew."

	^ self shallowCopy
]

{
	#category : #dependencies,
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>dependentClasses [
	"Return the list of classes used myself"
	
	"Morph dependentClasses"
	| cll | 
	cll := Set new.
	"A class depends on its superclass"
	self superclass ifNotNil: [ cll add: self superclass ].
	
	"We unify a class and its metaclass"
	(self methods, self theMetaClass methods) 
		do: [ :m | m literalsDo: [ :l | 
					"We also check if the method is not an extension"
					((((l isVariableBinding 
					and: [ l value notNil ]) 
					and: [ l value isBehavior ])
					and: [ m category notEmpty ] )
					and: [ m category first ~= $* ])  ifTrue: [ cll add: l value ] ]  ].
	^ cll asArray
]

{
	#category : #'accessing method dictionary',
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>deregisterLocalSelector: aSymbol [
	self basicLocalSelectors notNil ifTrue: [
		self basicLocalSelectors remove: aSymbol ifAbsent: []]
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>emptyMethodDictionary [

	^ MethodDictionary new
]

{
	#category : #traits,
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>ensureLocalSelectors [
	"Ensures that the instance variable localSelectors is effectively used to maintain
	the set of local selectors.
	This method must be called before any non-local selectors are added to the
	method dictionary!"

	self basicLocalSelectors ifNil: [self basicLocalSelectors: self selectors asSet]
]

{
	#category : #accessing-properties,
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>ensureProperties [
	^ TraitProperties at: self ifAbsentPut: WeakKeyDictionary new
		
]

{
	#category : #naming,
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>environment [
	"Return the environment in which the receiver is visible"
	^Smalltalk globals
]

{
	#category : #'accessing method dictionary',
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>firstCommentAt:  selector [
	"Answer a string representing the first comment in the method associated with selector.  Return an empty string if the relevant source file is not available, or if the method's source code does not contain a comment.  Not smart enough to bypass quotes in string constants, but does map doubled quote into a single quote."

	|someComments|
	someComments := self commentsAt: selector.
	^someComments isEmpty ifTrue: [''] ifFalse: [someComments first]


"Behavior firstCommentAt: #firstCommentAt:"
]

{
	#category : #'accessing method dictionary',
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>firstPrecodeCommentFor:  selector [
	"If there is a comment in the source code at the given selector that preceeds the body of the method, return it here, else return nil"

	| method |
	"Behavior firstPrecodeCommentFor: #firstPrecodeCommentFor:"
	(#(Comment Definition Hierarchy) includes: selector)
		ifTrue: [^ nil].
	method := self compiledMethodAt: selector asSymbol ifAbsent: [^ nil].
	^method ast firstPrecodeComment.
	
]

{
	#category : #traits,
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>flattenDown: aTrait [
| selectors |
	[self hasTraitComposition and: [self traitComposition allTraits includes: aTrait]] assert.
	(self traitComposition transformationOfTrait: aTrait)
		ifNotNil: [ :transformation | 
			selectors := transformation selectors.
	self basicLocalSelectors: (self basicLocalSelectors ifNil: Array new) asArray , selectors.
	self removeFromComposition: aTrait. ].
]

{
	#category : #traits,
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>flattenDownAllTraits [
	self traitComposition allTraits do: [:each | self flattenDown: each].
	[ self traitComposition isEmpty ] assert.
	self traitComposition: nil.
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>flushCache [
	"Tell the virtual machine to remove the contents of its method lookup caches, if it has any.  This must be done when the system 	modifies the class hierarchy so that message lookups reflect the revised organization.  c.f. Symbol>>flushCache & 	CompiledMethod>>flushCache.  Essential. See MethodDictionary class comment."

	<primitive: 89>
	self primitiveFailed
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>hasAbstractMethods [
	"Tells whether the receiver locally defines an abstract method, i.e., a method sending subclassResponsibility"
	
	^ (self methods anySatisfy: [:cm | cm sendsSelector: #subclassResponsibility ])
]

{
	#category : #'testing method dictionary',
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>hasMethods [
	"Answer whether the receiver has any methods in its method dictionary."

	^ self methodDict notEmpty
]

{
	#category : #'testing method dictionary',
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>hasSelectorReferringTo: literal [
	"Answer true if any of my methods access the argument as a 
	literal. Dives into the compact literal notation, making it slow but 
	thorough "

	^self methods anySatisfy: [ :method | method hasLiteral: literal ]
		
]

{
	#category : #traits,
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>hasTraitComposition [

	^ self traitComposition notEmpty.
]

{
	#category : #'testing class hierarchy',
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>includesBehavior: aClass [
	
	self isTrait ifTrue: [ ^false ].
	^self == aClass or:[self inheritsFrom: aClass]
]

{
	#category : #'testing method dictionary',
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>includesLocalSelector: aSymbol [
	^self basicLocalSelectors 
		ifNil: [self includesSelector: aSymbol]
		ifNotNil: [self localSelectors includes: aSymbol]
]

{
	#category : #'testing method dictionary',
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>includesSelector: aSymbol  [
	"Answer whether the message whose selector is the argument is in the 
	method dictionary of the receiver's class."

	^ self methodDict includesKey: aSymbol
]

{
	#category : #'accessing instances and variables',
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>includesSharedPoolNamed:  aSharedPoolString  [
	"Answer whether the receiver uses the shared pool named aSharedPoolString"
	
	^ (self sharedPools anySatisfy: [:each | each name = aSharedPoolString])
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>indexIfCompact [
	"Backward compatibility with the Squeak V3 object format.
	 Spur does not have a distinction between compact and non-compact classes."
	^0
]

{
	#category : #'testing class hierarchy',
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>inheritsFrom: aClass  [
	"Answer whether the argument, aClass, is on the receiver's superclass 
	chain."

	| aSuperclass |
	aSuperclass := self superclass.
	[aSuperclass == nil]
		whileFalse: 
			[aSuperclass == aClass ifTrue: [^true].
			aSuperclass := aSuperclass superclass].
	^false
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>initialize [
	"moved here from the class side's #new"
	super initialize.
	self superclass: Object.
	"no longer sending any messages, some of them crash the VM"
	self methodDict: self emptyMethodDictionary.
	self setFormat: Object format.
	self traitComposition: nil.
	self users: IdentitySet new.
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>initializeSlots: anObject  [
	self classLayout initializeInstance: anObject
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>instSize [
	^0
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>instSpec [
	"Answer the instance specification part of the format that defines what kind of object
	 an instance of the receiver is.  The formats are
			0	= 0 sized objects (UndefinedObject True False et al)
			1	= non-indexable objects with inst vars (Point et al)
			2	= indexable objects with no inst vars (Array et al)
			3	= indexable objects with inst vars (MethodContext AdditionalMethodState et al)
			4	= weak indexable objects with inst vars (WeakArray et al)
			5	= weak non-indexable objects with inst vars (ephemerons) (Ephemeron)
			6	= unused
			7	= immediates (SmallInteger, Character)
			8	= unused
			9	= 64-bit indexable
		10-11	= 32-bit indexable (Bitmap)
		12-15	= 16-bit indexable
		16-23	= 8-bit indexable
		24-31	= compiled methods (CompiledMethod)"
	^(self format bitShift: -16) bitAnd: 16r1F
]

{
	#category : #'accessing instances and variables',
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>instVarNames [
	"Answer an Array of the instance variable names. Behaviors must make 
	up fake local instance variable names because Behaviors have instance 
	variables for the purpose of compiling methods, but these are not named 
	instance variables."

	| mySize superSize |
	mySize := self instSize.
	superSize := 
		self superclass == nil
			ifTrue: [0]
			ifFalse: [self superclass instSize].
	mySize = superSize ifTrue: [^#()].	
	^(superSize + 1 to: mySize) collect: [:i | 'inst' , i printString]
]

{
	#category : #compiling,
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>instVarNamesAndOffsetsDo: aBinaryBlock [
	"This is part of the interface between the compiler and a class's instance or field names.
	 The class should enumerate aBinaryBlock with the instance variable name strings and
	 their integer offsets.  The order is important. Names evaluated later will override the
	 same names occurring earlier."

	"Nothing to do here; ClassDescription introduces named instance variables"
	^self
]

{
	#category : #'accessing instances and variables',
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>instanceCount [
	"Answer the number of instances of the receiver that are currently in 
	use."

	| count |
	count := 0.
	self allInstancesDo: [:x | count := count + 1].
	^count
]

{
	#category : #'memory usage',
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>instancesSizeInMemory [
	"Answers the number of bytes consumed by all its instances including their object header"
	
	| bytes |
	bytes := 0.
	self allInstancesDo: [:each | bytes := bytes + each sizeInMemory  ].
	^ bytes
]

{
	#category : #'testing method dictionary',
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>isAliasSelector: aSymbol [
	"Return true if the selector aSymbol is an alias defined
	in my or in another composition somewhere deeper in 
	the tree of traits compositions."

	^(self includesLocalSelector: aSymbol) not
		and: [self hasTraitComposition
				and: [self traitComposition isAliasSelector: aSymbol]]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>isAnonymous [
	^true
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>isBits [
	"Answer whether the receiver contains just bits (not pointers).
	 Above Cog Spur the class format is
		<5 bits inst spec><16 bits inst size>
	 where the 5-bit inst spec is
			0	= 0 sized objects (UndefinedObject True False et al)
			1	= non-indexable objects with inst vars (Point et al)
			2	= indexable objects with no inst vars (Array et al)
			3	= indexable objects with inst vars (MethodContext AdditionalMethodState et al)
			4	= weak indexable objects with inst vars (WeakArray et al)
			5	= weak non-indexable objects with inst vars (ephemerons) (Ephemeron)
			6	= unused
			7	= immediates (SmallInteger, Character)
			8	= unused
			9	= 64-bit indexable
		10-11	= 32-bit indexable (Bitmap)
		12-15	= 16-bit indexable
		16-23	= 8-bit indexable
		24-31	= compiled methods (CompiledMethod)"
	^self instSpec >= 7
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>isBytes [
	"Answer whether the receiver has 8-bit instance variables.
	 Above Cog Spur the class format is
		<5 bits inst spec><16 bits inst size>
	 where the 5-bit inst spec is
			0	= 0 sized objects (UndefinedObject True False et al)
			1	= non-indexable objects with inst vars (Point et al)
			2	= indexable objects with no inst vars (Array et al)
			3	= indexable objects with inst vars (MethodContext AdditionalMethodState et al)
			4	= weak indexable objects with inst vars (WeakArray et al)
			5	= weak non-indexable objects with inst vars (ephemerons) (Ephemeron)
			6	= unused
			7	= immediates (SmallInteger, Character)
			8	= unused
			9	= 64-bit indexable
		10-11	= 32-bit indexable (Bitmap)
		12-15	= 16-bit indexable
		16-23	= 8-bit indexable
		24-31	= compiled methods (CompiledMethod)"
	^self instSpec >= 16
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>isCompact [
	"Backward compatibility with the Squeak V3 object format.
	Spur does not have a distinction between compact and non-compact classes."
	^false
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>isComposedBy: aTrait [
	"Answers if this object includes trait aTrait into its composition"
	aTrait isTrait ifFalse: [ ^false].
	^self hasTraitComposition 
		ifTrue: [ self traitComposition includesTrait: aTrait ]
		ifFalse: [ false ]
]

{
	#category : #'testing method dictionary',
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>isDisabledSelector: selector [
	^ self classAndMethodFor: selector do: [:c :m | m isDisabled] ifAbsent: [false]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>isEphemeronClass [
	"Answer whether the receiver has ephemeral instance variables.  The garbage collector will
	 fire (queue for finalization) any ephemeron whose first instance variable is not referenced
	 other than from the transitive closure of references from ephemerons. Hence referring to
	 an object from the first inst var of an ephemeron will cause the ephemeron to fire when
	 the rest of the system does not refer to the object and that object is ready to be collected.
	 Since references from the remaining inst vars of an ephemeron will not prevent the ephemeron
	 from firing, ephemerons may act as the associations in weak dictionaries such that the value
	 (e.g. properties attached to the key) will not prevent firing when the key is no longer referenced
	 other than from ephemerons.  Ephemerons can therefore be used to implement instance-based
	 pre-mortem finalization."
	^self instSpec = 5
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>isFixed [
	"Answer whether the receiver does not have a variable (indexable) part."

	^self isVariable not
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>isImmediateClass [
	"Answer whether the receiver has immediate instances.  Immediate instances
	 store their value in their object pointer, not in an object body.  Hence immediates
	 take no space and are immutable.  The immediates are distinguished by tag bits
	 in the pointer. They include SmallIntegers and Characters.  Hence in the 32-bit
	 system SmallIntegers are 31-bit signed integers and Characters are 30-bit
	 unsigned character codes."
	^self instSpec = 7
]

{
	#category : #'testing method dictionary',
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>isLocalAliasSelector: aSymbol [
	"Return true if the selector aSymbol is an alias defined
	in my trait composition."

	^(self includesLocalSelector: aSymbol) not
		and: [self hasTraitComposition
				and: [self traitComposition isLocalAliasSelector: aSymbol]]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>isManifest [
	^ false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>isMeta [
	^ false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>isObsolete [
	"Return true if the receiver is obsolete."
	^self instanceCount = 0
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>isPointers [
	"Answer whether the receiver contains just pointers (not bits)."

	^self isBits not
]

{
	#category : #'testing class hierarchy',
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>isRootInEnvironment [
	^self superclass isNil
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>isTrait [
	^true
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>isUsed [
	^self traitUsers isNotEmpty 
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>isVariable [
	"Answer whether the receiver has indexable variables.
	 Above Cog Spur the class format is
		<5 bits inst spec><16 bits inst size>
	 where the 5-bit inst spec is
			0	= 0 sized objects (UndefinedObject True False et al)
			1	= non-indexable objects with inst vars (Point et al)
			2	= indexable objects with no inst vars (Array et al)
			3	= indexable objects with inst vars (MethodContext AdditionalMethodState et al)
			4	= weak indexable objects with inst vars (WeakArray et al)
			5	= weak non-indexable objects with inst vars (ephemerons) (Ephemeron)
			6	= unused
			7	= immediates (SmallInteger, Character)
			8	= unused
			9	= 64-bit indexable
		10-11	= 32-bit indexable (Bitmap)
		12-15	= 16-bit indexable
		16-23	= 8-bit indexable
		24-31	= compiled methods (CompiledMethod)"
	| instSpec |
	instSpec := self instSpec.
	^instSpec >= 2 and: [instSpec <= 4 or: [instSpec >= 9]]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>isWeak [
	"Answer whether the receiver has contains weak references."
	^ self instSpec = 4
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>isWords [
	"Answer true if the receiver is made of 32-bit instance variables."

	^self isBytes not
]

{
	#category : #'testing class hierarchy',
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>kindOfSubclass [
	"Answer a String that is the keyword that describes the receiver's kind of subclass,
	 either a regular subclass, a variableSubclass, a variableByteSubclass,
	 a variableWordSubclass, a weakSubclass, an ephemeronSubclass or an immediateSubclass.
	 c.f. typeOfClass"
	^self isVariable
		ifTrue:
			[self isBits
				ifTrue:
					[self isBytes
						ifTrue: [' variableByteSubclass: ']
						ifFalse: [' variableWordSubclass: ']]
				ifFalse:
					[self isWeak
						ifTrue: [' weakSubclass: ']
						ifFalse: [' variableSubclass: ']]]
		ifFalse:
			[self isImmediateClass
				ifTrue: [' immediateSubclass: ']
				ifFalse:
					[self isEphemeronClass
						ifTrue: [' ephemeronSubclass: ']
						ifFalse: [' subclass: ']]]
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>literalScannedAs: scannedLiteral notifying: requestor [
	"Postprocesses a literal scanned by Scanner scanToken (esp. xLitQuote).
	If scannedLiteral is not an association, answer it.
	Else, if it is of the form:
		nil->#NameOfMetaclass
	answer nil->theMetaclass, if any has that name, else report an error.
	Else, if it is of the form:
		#NameOfGlobalVariable->anythiEng
	answer the global, class, or pool association with that nameE, if any, else
	add it to Undeclared a answer the new Association."

	| key value |
	(scannedLiteral isVariableBinding)
		ifFalse: [^ scannedLiteral].
	key := scannedLiteral key.
	value := scannedLiteral value.
	key ifNil: "###<metaclass soleInstance name>"
			[(self bindingOf: value) ifNotNil:[:assoc|
				 (assoc value isKindOf: Behavior)
					ifTrue: [^ nil->assoc value class]].
			 requestor notify: 'No such metaclass'.
			 ^false].
	(key isSymbol)
		ifTrue: "##<global var name>"
			[(self bindingOf: key) ifNotNil:[:assoc | ^assoc].
			Undeclared at: key put: nil.
			 ^Undeclared bindingOf: key].
	requestor notify: '## must be followed by a non-local variable name'.
	^false

"	Form literalScannedAs: 14 notifying: nil 14
	Form literalScannedAs: #OneBitForm notiEfying: nil  OneBitForm
	Form literalScannedAs: ##OneBitForm notifying: nil  OneBitForm->a Form
	Form literalScannedAs: ##Form notifying: nil   Form->Form
	Form literalScannedAs: ###Form notifying: nil   nilE->Form class
"
]

{
	#category : #'accessing method dictionary',
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>localMethodNamed: selector ifAbsent: aBlock [
	"Answer the locally defined method associated with the argument, selector (a Symbol), a message selector in the receiver's method dictionary. If the selector is not in the dictionary or it is not a local one, return the value of aBlock"
	| method |
	method := self compiledMethodAt: selector ifAbsent: aBlock.
	
	self basicLocalSelectors ifNil: [^method].
	
	(self basicLocalSelectors includes: selector) ifTrue: [ ^method ].
	
	^aBlock value
]

{
	#category : #'accessing method dictionary',
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>localMethods [
	"returns the methods of classes excluding the ones of the traits that the class uses" 
	 
	^ self methods select: [:each | self includesLocalSelector: each selector].
]

{
	#category : #'accessing method dictionary',
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>localSelectors [
	"Return a set of selectors defined locally.
	The instance variable is lazily initialized. If it is nil then there
	are no non-local selectors"

	^ self basicLocalSelectors 
		ifNil: [self selectors asSet]
		ifNotNil: [self basicLocalSelectors].
]

{
	#category : #'accessing method dictionary',
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>localSelectors: aSet  [
	self basicLocalSelectors: aSet
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>longPrintOn: aStream [
	"Append to the argument, aStream, the names and values of all of the receiver's instance variables.  But, not useful for a class with a method dictionary."

	aStream nextPutAll: '<<too complex to show>>'; cr.
]

{
	#category : #'accessing method dictionary',
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>lookupSelector: selector [
	"Look up the given selector in my methodDictionary.
	Return the corresponding method if found.
	Otherwise chase the superclass chain and try again.
	Return nil if no method is found."
	| lookupClass |
	lookupClass := self.
	[lookupClass == nil]
		whileFalse: [ 
			lookupClass methodDict 
				at: selector
				ifPresent: [ :method | ^ method ].
			lookupClass := lookupClass superclass].
	^ nil
]

{
	#category : #'accessing method dictionary',
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>methodDict [
	^ methodDict
]

{
	#category : #'accessing method dictionary',
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>methodDict: aDictionary [
	methodDict := aDictionary
]

{
	#category : #'accessing method dictionary',
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>methodDictionary [
	^self methodDict
]

{
	#category : #'accessing method dictionary',
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>methodDictionary: aDictionary [
	self methodDict: aDictionary
]

{
	#category : #'accessing method dictionary',
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>methods [
	
	^ self methodDict values
]

{
	#category : #queries,
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>methodsAccessingSlot: aSlot [
	^self methods select: [ :method | method accessesSlot: aSlot ]
]

{
	#category : #'accessing method dictionary',
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>methodsDo: aBlock [
	"Evaluate aBlock for all the compiled methods in my method dictionary."

	^ self methodDict valuesDo: aBlock
]

{
	#category : #queries,
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>methodsReadingSlot: aSlot [
	^self methods select: [ :method | method readsSlot: aSlot ]
]

{
	#category : #navigation,
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>methodsReferencingClass: aClass [

	^self methodsReferencingClasses: { aClass }
]

{
	#category : #navigation,
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>methodsReferencingClasses: aCollectionOfClasses [
	^ self methods select: [ :meth | meth referencedClasses includesAny: aCollectionOfClasses ]
]

{
	#category : #queries,
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>methodsWritingSlot: aSlot [
	^self methods select: [ :method | method writesSlot: aSlot ]
]

{
	#category : #naming,
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>name [
	^ self subclassResponsibility.
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>new [
	"Answer a new initialized instance of the receiver (which is a class) with no indexable variables. Fail if the class is indexable."

	^ self basicNew initialize

]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>new: sizeRequested  [
	"Answer an initialized instance of this class with the number of indexable
	variables specified by the argument, sizeRequested."

	^ (self basicNew: sizeRequested) initialize  
]

{
	#category : #'accessing method dictionary',
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>nextQuotePosIn: sourceString startingFrom: commentStart [
	| pos nextQuotePos |
	pos := commentStart + 1.
	[((nextQuotePos := sourceString findString: '"' startingAt: pos) == (sourceString findString: '""' startingAt: pos)) and: [nextQuotePos ~= 0]]
		whileTrue:
			[pos := nextQuotePos + 2].
	^nextQuotePos
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>nonObsoleteClass [
	"Attempt to find and return the current version of this obsolete class"

	| obsName |
	obsName := self name.
	[obsName beginsWith: 'AnObsolete']
		whileTrue: [obsName := obsName copyFrom: 'AnObsolete' size + 1 to: obsName size].
	^ self environment at: obsName asSymbol
]

{
	#category : #traits,
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>noteChangedSelectors: aCollection [
	"Start update of my methodDict (after changes to traits in traitComposition
	or after a local method was removed from my methodDict). The argument 
	is a collection of method selectors that may have been changed. Most of the time
	aCollection only holds one selector. But when there are aliases involved 
	there may be several method changes that have to be propagated to users."

	| affectedSelectors |
	affectedSelectors := IdentitySet new.
	aCollection do: [:selector |
		affectedSelectors addAll: (self updateMethodDictionarySelector: selector)].
	self notifyUsersOfChangedSelectors: affectedSelectors.
	^ affectedSelectors
]

{
	#category : #traits,
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>notifyUsersOfChangedSelector: aSelector [
	self notifyUsersOfChangedSelectors: (Array with: aSelector)
]

{
	#category : #traits,
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>notifyUsersOfChangedSelectors: aCollection [

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>numberOfInstanceVariables [
	^ self instVarNames size

]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>obsolete [
	"Invalidate and recycle local methods,
	e.g., zap the method dictionary if can be done safely."
	self canZapMethodDictionary
		ifTrue: [self methodDict: self emptyMethodDictionary].
	self hasTraitComposition ifTrue: [
		self traitComposition traits do: [:each |
			each removeUser: self]]
]

{
	#category : #'obsolete subclasses',
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>obsoleteSubclasses [
	"Return all the weakly remembered obsolete subclasses of the receiver"
	| obs |
	obs := self basicObsoleteSubclasses at: self ifAbsent: [^ #()].
	^ obs copyWithout: nil
]

{
	#category : #copying,
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>postCopy [
	super postCopy.
	self methodDict: self copyOfMethodDictionary
]

{
	#category : #'accessing method dictionary',
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>precodeCommentOrInheritedCommentFor: selector  [
	"Answer a string representing the first comment in the method associated 
	with selector, considering however only comments that occur before the 
	beginning of the actual code. If the version recorded in the receiver is 
	uncommented, look up the inheritance chain. Return nil if none found."
	
	| aSuper aComment |
	^ (aComment := self firstPrecodeCommentFor: selector) isEmptyOrNil
		ifTrue: [(self == Behavior
					or: [self superclass == nil
							or: [(aSuper := self superclass whichClassIncludesSelector: selector) == nil]])
				ifFalse: [aSuper precodeCommentOrInheritedCommentFor: selector]]
		ifFalse: [aComment]
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>printHierarchy [
	"Answer a description containing the names and instance variable names 
	of all of the subclasses and superclasses of the receiver."

	| aStream index |
	index := 0.
	aStream := (String new: 16) writeStream.
	self allSuperclasses reverseDo: 
		[:aClass | 
		aStream crtab: index.
		index := index + 1.
		aStream nextPutAll: aClass name.
		aStream space.
		aStream print: aClass instVarNames].
	aStream cr.
	self printSubclassesOn: aStream level: index.
	^aStream contents
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>printOn: aStream  [
	"Refer to the comment in Object|printOn:." 

	aStream nextPutAll: 'a descendent of '.
	self superclass printOn: aStream
]

{
	#category : #accessing-properties,
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>properties [
	^ TraitProperties at: self ifAbsent: nil
		
]

{
	#category : #accessing-properties,
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>propertyAt: propName [
	^ self
		propertyAt: propName
		ifAbsent: [ nil ]
]

{
	#category : #accessing-properties,
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>propertyAt: propName ifAbsent: aBlock [
	self properties ifNil: [^aBlock value].
	^ self properties
		at: propName
		ifAbsent: aBlock
]

{
	#category : #accessing-properties,
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>propertyAt: propName put: propValue [
	^ self ensureProperties
		at: propName
		ifAbsentPut: propValue
]

{
	#category : #traits,
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>purgeLocalSelectors [
	self basicLocalSelectors: nil
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>realClass [

	^ self
]

{
	#category : #'accessing method dictionary',
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>registerLocalSelector: aSymbol [
	self basicLocalSelectors notNil ifTrue: [
		self basicLocalSelectors add: aSymbol]
]

{
	#category : #traits,
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>removeAlias: aSymbol of: aTrait [
	self setTraitComposition: (
		self traitComposition copyWithoutAlias: aSymbol of: aTrait)
]

{
	#category : #'obsolete subclasses',
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>removeAllObsoleteSubclasses [
	"Remove all the obsolete subclasses of the receiver"
	self basicObsoleteSubclasses removeKey: self ifAbsent: [].

]

{
	#category : #traits,
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>removeFromComposition: aTrait [
	self setTraitComposition: (self traitComposition copyTraitExpression
		removeFromComposition: aTrait)
]

{
	#category : #accessing-properties,
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>removePropertiesIfEmpty [
	^ TraitProperties at: self ifPresent: [ :dict |
		dict ifEmpty: [ TraitProperties removeKey: self ] ]
		
]

{
	#category : #accessing-properties,
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>removeProperty: propName [
	^ self
		removeProperty: propName
		ifAbsent: [ nil ]
]

{
	#category : #accessing-properties,
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>removeProperty: propName ifAbsent: aBlock [
	| property |
	self properties ifNil: [^aBlock value].
	property := self properties
		removeKey: propName
		ifAbsent: aBlock.
	self removePropertiesIfEmpty.
	^ property
]

{
	#category : #'accessing method dictionary',
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>removeSelector: aSelector [
	"Assuming that the argument, selector (a Symbol), is a message selector 
	in my method dictionary, remove it and its method.
	
	If the method to remove will be replaced by a method from my trait composition,
	the current method does not have to be removed because we mark it as non-local.
	If it is not identical to the actual method from the trait it will be replaced automatically
	by #noteChangedSelectors:.
	
	This is useful to avoid bootstrapping problems when moving methods to a trait
	(e.g., from TBehavior to TMethodDictionaryBehavior). Manual moving (implementing
	the method in the trait and then remove it from the class) does not work if the methods
	themselves are used for this process (such as compiledMethodAt:, includesLocalSelector: or
	addTraitSelector:withMethod:)"
	
	| changeFromLocalToTraitMethod |
	changeFromLocalToTraitMethod := (self includesLocalSelector: aSelector)
		and: [self hasTraitComposition
				and: [self traitComposition includesMethod: aSelector]].

	changeFromLocalToTraitMethod
		ifFalse: [self basicRemoveSelector: aSelector]
		ifTrue: [self ensureLocalSelectors].
	self deregisterLocalSelector: aSelector.
	self noteChangedSelectors: (Array with: aSelector).
	
	self isTrait ifTrue: [ self notifyUsersOfChangedSelector: aSelector].
]

{
	#category : #'adding/removing methods',
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>removeSelectorSilently: selector  [
	"Remove selector without sending system change notifications"

	^ SystemAnnouncer uniqueInstance suspendAllWhile: [self removeSelector: selector].
]

{
	#category : #traits,
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>removeTraitSelector: aSymbol [
	[(self includesLocalSelector: aSymbol) not] assert.
	self basicRemoveSelector: aSymbol
]

{
	#category : #traits,
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>removeUser: aClassOrTrait [
	self traitUsers remove: aClassOrTrait ifAbsent: []
]

{
	#category : #enumerating,
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>selectSubclasses: aBlock  [
	"Evaluate the argument, aBlock, with each of the receiver's (next level) 
	subclasses as its argument. Collect into a Set only those subclasses for 
	which aBlock evaluates to true. In addition, evaluate aBlock for the 
	subclasses of each of these successful subclasses and collect into the set 
	those for which aBlock evaluates true. Answer the resulting set."

	| aSet |
	aSet := Set new.
	self allSubclasses do: 
		[:aSubclass | 
		(aBlock value: aSubclass) ifTrue: [aSet add: aSubclass]].
	^aSet
]

{
	#category : #enumerating,
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>selectSuperclasses: aBlock  [
	"Evaluate the argument, aBlock, with the receiver's superclasses as the 
	argument. Collect into an OrderedCollection only those superclasses for 
	which aBlock evaluates to true. In addition, evaluate aBlock for the 
	superclasses of each of these successful superclasses and collect into the 
	OrderedCollection ones for which aBlock evaluates to true. Answer the 
	resulting OrderedCollection."

	| aSet |
	aSet := Set new.
	self allSuperclasses do: 
		[:aSuperclass | 
		(aBlock value: aSuperclass) ifTrue: [aSet add: aSuperclass]].
	^aSet
]

{
	#category : #'accessing method dictionary',
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>selectors [
	"Answer a Set of all the message selectors specified in the receiver's 
	method dictionary."

	^ self methodDict keys
]

{
	#category : #'accessing method dictionary',
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>selectorsAndMethodsDo: selectorAndMethodBlock [
	"Evaluate selectorAndMethodBlock with two arguments for each selector/method pair in my method dictionary."

	^ self methodDict keysAndValuesDo: selectorAndMethodBlock
]

{
	#category : #'accessing method dictionary',
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>selectorsDo: selectorBlock [
	"Evaluate selectorBlock for all the message selectors in my method dictionary."

	^ self methodDict keysDo: selectorBlock
]

{
	#category : #'accessing method dictionary',
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>selectorsWithArgs: numberOfArgs [
	"Return all selectors defined in this class that take this number of arguments"

	^ self selectors select: [:selector | selector numArgs = numberOfArgs]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>setFormat: aFormatInstanceDescription [
	"Compatibility purposes"
]

{
	#category : #traits,
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>setTraitComposition: aTraitComposition [
	| oldComposition |
	(self hasTraitComposition not and: [aTraitComposition isEmpty]) ifTrue: [^self].
	aTraitComposition assertValidUser: self.

	oldComposition := self traitComposition.
	self traitComposition: aTraitComposition.
	self applyChangesOfNewTraitCompositionReplacing: oldComposition.
	
	oldComposition traits do: [:each | each removeUser: self].
	aTraitComposition traits do: [:each | each addUser: self]
]

{
	#category : #traits,
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>setTraitCompositionFrom: aTraitExpression [
	^ self setTraitComposition: aTraitExpression asTraitComposition
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>sharedPoolNames [
	^ self sharedPools collect: [:ea |
		ea isObsolete
			ifTrue: [ ea name ]
			ifFalse: [ self environment keyAtIdentityValue: ea ] ]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>shouldNotBeRedefined [
	"Answer if the receiver should not be redefined.
	 The assumption is that classes in Smalltalk specialObjects and 
	 instance-specific Behaviors should not be redefined"

	^(Smalltalk specialObjectsArray
		identityIndexOf: self
		ifAbsent: [(self isKindOf: self) ifTrue: [1] ifFalse: [0]]) ~= 0
]

{
	#category : #'system startup',
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>shutDown [
	"This message is sent on system shutdown to registered classes"

]

{
	#category : #'system startup',
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>shutDown: quitting [
	"This message is sent on system shutdown to registered classes"
	^self shutDown.
]

{
	#category : #'accessing instances and variables',
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>someInstance [
	"Primitive. Answer the first instance in the enumeration of all instances 
	of the receiver. Fails if there are none. Essential. See Object 
	documentation whatIsAPrimitive."

	<primitive: 77>
	^nil
]

{
	#category : #'accessing method dictionary',
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>sourceCodeAt: selector [

	^ (self compiledMethodAt: selector) sourceCode.
]

{
	#category : #'accessing method dictionary',
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>sourceCodeAt: selector ifAbsent: aBlock [

	^ (self compiledMethodAt: selector ifAbsent: [^ aBlock value]) sourceCode.
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>sourceMatchesBytecodeAt: selector [
	"Answers true if the source code at the selector compiles to the bytecode at the selector, and false
	otherwise. Implemented to detect an error where Monticello did not recompile sources when the class
	shape changed"

	"This code was copied from #recompile:from:, with few changes. Several methods would benefit from a
	method which turned a selector and class into a CompiledMethod, without  installing it into the 
	methodDictionary"

	| method newMethod |

	method := self compiledMethodAt: selector.
	newMethod := self compiler
			source: (self sourceCodeAt: selector);
			class: self;
			failBlock: [^ false];
			compiledMethodTrailer: method trailer;
			compile.   "Assume OK after proceed from SyntaxError"
	selector == newMethod selector ifFalse: [self error: 'selector changed!!'].
	^ newMethod = method
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>spaceUsed [
	"Answer a rough estimate of number of bytes used by this class and its metaclass. Does not include space used by class variables."

	| space |
	space := 0.
	self methodsDo: [:method  |
		space := space + 16.  "dict and org'n space"
		space := space + (method size + 6 "hdr + avg pad").
		method literalsDo: [:lit |
			(lit isMemberOf: Array) ifTrue: [space := space + ((lit size + 1) * 4)].
			(lit isMemberOf: Float) ifTrue: [space := space + 12].
			(lit isMemberOf: ByteString) ifTrue: [space := space + (lit size + 6)].
			(lit isMemberOf: LargeNegativeInteger) ifTrue: [space := space + ((lit size + 1) * 4)].
			(lit isMemberOf: LargePositiveInteger) ifTrue: [space := space + ((lit size + 1) * 4)]]].
		^ space
]

{
	#category : #'system startup',
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>startUp [
	"This message is sent to registered classes when the system is coming up."
 
]

{
	#category : #'system startup',
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>startUp: resuming [
	"This message is sent to registered classes when the system is coming up."
	^self startUp
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>storeLiteral: aCodeLiteral on: aStream [
	"Store aCodeLiteral on aStream, changing an Association to ##GlobalName
	 or ###MetaclassSoleInstanceName format if appropriate"
	| key value |
	(aCodeLiteral isVariableBinding)
		ifFalse:
			[aCodeLiteral storeOn: aStream.
			 ^self].
	key := aCodeLiteral key.
	(key isNil and: [(value := aCodeLiteral value) isMemberOf: Metaclass])
		ifTrue:
			[aStream nextPutAll: '###'; nextPutAll: value soleInstance name.
			 ^self].
	(key isSymbol and: [(self bindingOf: key) notNil])
		ifTrue:
			[aStream nextPutAll: '##'; nextPutAll: key.
			 ^self].
	aCodeLiteral storeOn: aStream
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>subclassDefinerClass [
	"Answer an evaluator class appropriate for evaluating definitions of new 
	subclasses of this class."

	^Smalltalk compilerClass
]

{
	#category : #'accessing instances and variables',
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>subclassInstVarNames [
	"Answer a Set of the names of the receiver's subclasses' instance 
	variables."
	| vars |
	vars := Set new.
	self allSubclasses do: [:aSubclass | vars addAll: aSubclass instVarNames].
	^vars
]

{
	#category : #enumerating,
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>subclassesDo: aBlock [
	"Evaluate the argument, aBlock, for each of the receiver's immediate subclasses."
	self subclasses do: aBlock
]

{
	#category : #'accessing class hierarchy',
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>superclass [
	"For compatibility with classes"

	^ nil
]

{
	#category : #'accessing class hierarchy',
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>superclass: aClass  [
	"Compatibility purposes"
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>superclass: aClass methodDictionary: mDict format: fmt [
	"Basic initialization of the receiver.
	Must only be sent to a new instance; else we would need Object flushCache."
	self superclass: aClass.
	self setFormat: fmt.
	self methodDict: mDict.
	self traitComposition: nil
]

{
	#category : #'accessing method dictionary',
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>supermostPrecodeCommentFor: selector  [
	"Answer a string representing the precode comment in the most distant 
	superclass's implementation of the selector. Return nil if none found."
	| aSuper superComment |
	(self == Behavior
			or: [self superclass == nil
					or: [(aSuper := self superclass whichClassIncludesSelector: selector) == nil]])
		ifFalse: ["There is a super implementor"
			superComment := aSuper supermostPrecodeCommentFor: selector].
	^ superComment
		ifNil: [self firstPrecodeCommentFor: selector
			"ActorState supermostPrecodeCommentFor: #printOn:"]
]

{
	#category : #'testing method dictionary',
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>thoroughHasSelectorReferringTo: literal [
	"Answer true if any of my methods access the argument as a 
	literal. Dives into the compact literal notation, making it slow but 
	thorough "
	
	| specialIndex |
	"for speed we check the special selectors here once per class"
	specialIndex := Smalltalk specialSelectorIndexOrNil: literal.
	^self methods anySatisfy: [ :method | 
		method hasSelector: literal specialSelectorIndex: specialIndex]
		
]

{
	#category : #'testing method dictionary',
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>thoroughWhichSelectorsReferTo: literal [
	"Answer a set of selectors whose methods access the argument as a 
	literal. Dives into the compact literal notation, making it slow but 
	thorough "
	| specialIndex selectors |
	"for speed we check the special selectors here once per class"
	specialIndex := Smalltalk specialSelectorIndexOrNil: literal.
	selectors := OrderedCollection new.
	self selectorsAndMethodsDo: [ :sel :method |
			(method hasSelector: literal specialSelectorIndex: specialIndex) ifTrue: [selectors add: sel]].
	^ selectors
]

{
	#category : #traits,
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>traitComposition [
	traitComposition ifNil: [traitComposition := TraitComposition new].
	^traitComposition
]

{
	#category : #traits,
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>traitComposition: aTraitComposition [
	traitComposition := aTraitComposition
]

{
	#category : #traits,
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>traitCompositionIncludes: aTrait [
	^self == aTrait or: 
		[self hasTraitComposition and: 
			[self traitComposition allTraits includes: aTrait]]
]

{
	#category : #traits,
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>traitCompositionString [
	^self hasTraitComposition
		ifTrue: [self traitComposition asString]
		ifFalse: ['{}']
]

{
	#category : #traits,
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>traitOrClassOfSelector: aSymbol [
	"Return the trait or the class which originally defines the method aSymbol
	or return self if locally defined or if it is a conflict marker method.
	This is primarly used by Debugger to determin the behavior in which a recompiled
	method should be put. If a conflict method is recompiled it should be put into
	the class, thus return self. Also see TraitComposition>>traitProvidingSelector:"
	
	((self includesLocalSelector: aSymbol) or: [
		self hasTraitComposition not]) ifTrue: [^self].
	^(self traitComposition traitProvidingSelector: aSymbol) ifNil: [self]
]

{
	#category : #traits,
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>traitTransformations  [
	^ self traitComposition transformations 
]

{
	#category : #traits,
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>traitUsers [
	^users
]

{
	#category : #traits,
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>traitUsers: aCollection [
	users := aCollection.
]

{
	#category : #traits,
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>traits [
	"Returns a collection of all traits used by the receiver"
	^ self traitComposition traits
]

{
	#category : #traits,
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>traitsProvidingSelector: aSymbol [
	| result |
	result := OrderedCollection new.
	self hasTraitComposition ifFalse: [^result].
	(self traitComposition methodDescriptionsForSelector: aSymbol)
		do: [:methodDescription | methodDescription selector = aSymbol ifTrue: [
			result addAll: (methodDescription locatedMethods
				collect: [:each | each methodClass])]].
	^result
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>typeOfClass [
	"Answer a symbol uniquely describing the type of the receiver. c.f. kindOfSubclass"
	self classLayout isCustomLayout ifTrue: [ ^self classLayout class name asSymbol].
	self isBytes ifTrue:
		[^self instSpec = CompiledMethod instSpec
			ifTrue: [#compiledMethod] "Very special!"
			ifFalse: [#bytes]].
	(self isWords and: [self isPointers not]) ifTrue:
		[^self instSpec = SmallInteger instSpec
			ifTrue: [#immediate] "Very special!"
			ifFalse: [#words]].
	self isWeak ifTrue: [^#weak].
	self isVariable ifTrue: [^#variable].
	self isEphemeronClass ifTrue: [^#ephemeron].
	^#normal
]

{
	#category : #'accessing method dictionary',
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>ultimateSourceCodeAt: selector ifAbsent: aBlock [
	"Return the source code at selector, deferring to superclass if necessary"
	^ self sourceCodeAt: selector ifAbsent:
		[self superclass
			ifNil:
				[aBlock value]
			 ifNotNil:
				[self superclass ultimateSourceCodeAt: selector ifAbsent: aBlock]]
]

{
	#category : #'user interface',
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>unreferencedInstanceVariables [
	"Return a list of the instance variables defined in the receiver which are not referenced in the receiver or any of its subclasses."

	^ self instVarNames reject: [:ivn | 
		self withAllSubclasses anySatisfy: [:class | 
			(class whichSelectorsAccess: ivn) notEmpty]]
]

{
	#category : #traits,
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>updateMethodDictionarySelector: aSymbol [
	"A method with selector aSymbol in myself or my traitComposition has been changed.
	Do the appropriate update to my methodDict (remove or update method) and
	return all affected selectors of me so that my useres get notified."

	| modifiedSelectors descriptions oldProtocol |
	modifiedSelectors := IdentitySet new.
	descriptions := self traitComposition methodDescriptionsForSelector: aSymbol.
	descriptions do: [:methodDescription | | effectiveMethod selector |
		selector := methodDescription selector.
		(self includesLocalSelector: selector) ifFalse: [
			methodDescription isEmpty
				ifTrue: [
					self removeTraitSelector: selector.
					modifiedSelectors add: selector]
				ifFalse: [
					effectiveMethod := methodDescription effectiveMethod.
					self addTraitSelector: selector withMethod: effectiveMethod.
					
					"If the method was not categorized yet, we categorize it "
					oldProtocol := self organization categoryOfElement: selector.
					(oldProtocol isNil or: [ oldProtocol = Protocol unclassified ]) 
						ifTrue: [ self organization classify: selector under: methodDescription effectiveMethodCategory. ].
					
					modifiedSelectors add: selector]]].
	^modifiedSelectors
]

{
	#category : #traits,
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>users [
	^users
]

{
	#category : #traits,
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>users: aCollection [
	users := aCollection.
]

{
	#category : #compiling,
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>variablesAndOffsetsDo: aBinaryBlock [
	"This is the interface between the compiler and a class's instance or field names.  The
	 class should enumerate aBinaryBlock with the field definitions (with nil offsets) followed
	 by the instance variable name strings and their integer offsets (1-relative).  The order is
	 important; names evaluated later will override the same names occurring earlier."

	"Only need to do instance variables here.  CProtoObject introduces field definitions."
	self instVarNamesAndOffsetsDo: aBinaryBlock
]

{
	#category : #queries,
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>whichClassDefinesClassVar: aString  [
	Symbol hasInterned: aString ifTrue: [ :aSymbol |
		^self whichSuperclassSatisfies: 
			[:aClass | 
			aClass classVarNames anySatisfy: [:each | each = aSymbol]]].
	^#()
]

{
	#category : #queries,
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>whichClassDefinesInstVar: aString  [
	^self 
		whichSuperclassSatisfies: [:aClass | aClass instVarNames includes: aString]
]

{
	#category : #'testing method dictionary',
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>whichClassIncludesSelector: aSymbol  [
	"Answer the class on the receiver's superclass chain where the 
	argument, aSymbol (a message selector), will be found. Answer nil if none found."
	"Rectangle whichClassIncludesSelector: #inspect."
	(self includesSelector: aSymbol)
		ifTrue: [^ self].
	self superclass == nil
		ifTrue: [^ nil].
	^ self superclass whichClassIncludesSelector: aSymbol
]

{
	#category : #'testing method dictionary',
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>whichSelectorsAccess: instVarName  [
	"Answer a set of selectors whose methods access the argument, 
	instVarName, as a named instance variable."

	| instVarIndex |
	instVarIndex := self instVarIndexFor: instVarName ifAbsent: [^#()].
	^ self selectors select:  [:sel | 
		((self compiledMethodAt: sel)
			readsField: instVarIndex)
			or: [(self compiledMethodAt: sel) writesField: instVarIndex]]
]

{
	#category : #queries,
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>whichSelectorsAssign: instVarName  [
	"Answer a Set of selectors whose methods store into the argument, 
	instVarName, as a named instance variable."
	^self whichSelectorsStoreInto: instVarName
]

{
	#category : #queries,
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>whichSelectorsRead: aString [
	
	| index |
	index := self
		instVarIndexFor: aString
		ifAbsent: [ ^ #() ].
	^ self selectors select: [ :each |
		(self compiledMethodAt: each)
			readsField: index ]
]

{
	#category : #'testing method dictionary',
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>whichSelectorsReferTo: literal  [
	^ self thoroughWhichSelectorsReferTo: literal
]

{
	#category : #'testing method dictionary',
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>whichSelectorsStoreInto: instVarName  [
	"Answer a Set of selectors whose methods access the argument, 
	instVarName, as a named instance variable."
	| instVarIndex |
	instVarIndex := self instVarIndexFor: instVarName ifAbsent: [^#()].
	^ self selectors select: [:sel | (self compiledMethodAt: sel) writesField: instVarIndex]

	"Point whichSelectorsStoreInto: 'x'."
]

{
	#category : #queries,
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>whichSuperclassSatisfies: aBlock  [
	(aBlock value: self) ifTrue: [^self].
	^self superclass ifNotNil: [self superclass whichSuperclassSatisfies: aBlock]
]

{
	#category : #'user interface',
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>withAllSubAndSuperclassesDo: aBlock [

	self withAllSubclassesDo: aBlock.
	self allSuperclassesDo: aBlock.

]

{
	#category : #'accessing class hierarchy',
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>withAllSubclasses [
	"Answer a Set of the receiver, the receiver's descendent's, and the  
	receiver's descendent's subclasses."

	^ self allSubclasses add: self;
		 yourself
]

{
	#category : #'accessing class hierarchy',
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>withAllSubclassesDo: aBlock [
	"Evaluate the argument, aBlock, for the receiver and each of its 
	subclasses."
	self withAllSubclasses do: [ :subclass | aBlock value: subclass ].
]

{
	#category : #enumerating,
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>withAllSuperAndSubclassesDo: aBlock [
	self allSuperclassesDo: aBlock.
	aBlock value: self.
	self allSubclassesDo: aBlock
]

{
	#category : #'accessing class hierarchy',
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>withAllSuperclasses [
	"Answer an OrderedCollection of the receiver and the receiver's 
	superclasses. The first element is the receiver, 
	followed by its superclass; the last element is Object."

	| temp |
	temp := self allSuperclasses.
	temp addFirst: self.
	^ temp
]

{
	#category : #enumerating,
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>withAllSuperclassesDo: aBlock  [
	"Evaluate the argument, aBlock, for each of the receiver's superclasses."
	aBlock value: self.
	self superclass == nil
		ifFalse: [self superclass withAllSuperclassesDo: aBlock]
]

{
	#category : #'accessing method dictionary',
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitBehavior>>zapAllMethods [
	"Remove all methods in this class which is assumed to be obsolete"

	self methodDict: self emptyMethodDictionary.
	self class isMeta ifTrue: [self class zapAllMethods]
]
