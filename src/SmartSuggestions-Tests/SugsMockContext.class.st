"
I'm a mock context with lot of stuff hardcoded.
I'm used in the tests to make easier the configuration for detecting diferents context.
"
Class {
	#name : #SugsMockContext,
	#superclass : #SugsAbstractContext,
	#instVars : [
		'selectorToUse',
		'anInstanceVar',
		'selectedClass',
		'selectedVariable',
		'selectedInterval',
		'message'
	],
	#classVars : [
		'ClassVariable'
	],
	#classInstVars : [
		'anInstanceVar'
	],
	#category : #SmartSuggestions-Tests,
	#timestamp : '<historical>'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:46'
}
SugsMockContext class>>assigmentContext [
	^ self new selectorToUse: #withAssigment; yourself.
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:46'
}
SugsMockContext class>>classContext [
	^ self new selectorToUse: #withClass; yourself.
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:46'
}
SugsMockContext class>>classVariableContext [
		^ self new selectorToUse: #withClassVariable; yourself.
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:46'
}
SugsMockContext class>>for: aClass [
	^self new 
		selectedClass: aClass
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:46'
}
SugsMockContext class>>for: aClass selectedVariable: aVariableName [
	^self new 
		selectedClass: aClass;
		selectedVariable: aVariableName.
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:46'
}
SugsMockContext class>>instVarContext [
	^ self new selectorToUse: #withInstanceVar; yourself.
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:46'
}
SugsMockContext class>>literalContext [
	^ self new selectorToUse: #withLiteral; yourself.
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:46'
}
SugsMockContext class>>mesageContext [
	^ self new selectorToUse: #withMesage; yourself.
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:46'
}
SugsMockContext class>>methodClassContext [
	^self new 
		selectedClass: self;
		selectorToUse: #methodClassContext

]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:46'
}
SugsMockContext class>>methodContext [
	^ self new selectorToUse: #withMethod; yourself.
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:46'
}
SugsMockContext class>>selfContext [
	^ self new selectorToUse: #withSelf; yourself.
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:46'
}
SugsMockContext class>>sourceContext [
	^ self new selectorToUse: #withSourceContext; yourself.
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:46'
}
SugsMockContext class>>superContext [
	^ self new selectorToUse: #withSuper; yourself.
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:46'
}
SugsMockContext class>>tempVarContext [
	^ self new selectorToUse: #withTemporaryVar; yourself.
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:46'
}
SugsMockContext class>>withMessageName: theName  [
	^ self new message: theName; yourself.
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:46'
}
SugsMockContext class>>withNode: aNode  [
	^self new selectedNode: aNode.
]

{
	#category : #refactoring,
	#timestamp : ' 8/31/2017 05:26:46'
}
SugsMockContext>>browsedEnvironment [
	self subclassResponsibility .
]

{
	#category : #api-context,
	#timestamp : ' 8/31/2017 05:26:46'
}
SugsMockContext>>code [
	^ self selectedMethod sourceCode
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:46'
}
SugsMockContext>>interval: selector  [
	selector = #withLiteral ifTrue:[^ 18 to: 17].
	selector = #withSelf ifTrue:[^ 13 to: 13].
	selector = #withSuper ifTrue:[^ 13 to: 13].
	selector = #withClass ifTrue:[^ 15 to: 16].
	selector = #withClassVariable ifTrue:[^ (27 to: 26)].
	selector = #withMethod ifTrue:[^ 6 to: 5].
	selector = #withMesage ifTrue:[^ 21 to: 23].
	selector = #withClassVariable ifTrue:[^ 15 to: 16].
	selector = #withTemporaryVar ifTrue:[^ 63 to: 62].
	selector = #withInstanceVar ifTrue:[^ 18 to: 30].
	selector = #withSourceContext ifTrue:[^ 39 to: 68].
	selector = #withAssigment ifTrue:[^ 26 to: 35].
	^selectedInterval 
	
	
]

{
	#category : #api-context,
	#timestamp : ' 8/31/2017 05:26:46'
}
SugsMockContext>>message: theName [
	^ message := theName.
]

{
	#category : #api-context,
	#timestamp : ' 8/31/2017 05:26:46'
}
SugsMockContext>>selectedClass [
	^selectedClass ifNil: [self class] ifNotNil:[selectedClass].
]

{
	#category : #api-context,
	#timestamp : ' 8/31/2017 05:26:46'
}
SugsMockContext>>selectedClass: aClass [
	selectedClass := aClass.
]

{
	#category : #api-context,
	#timestamp : ' 8/31/2017 05:26:46'
}
SugsMockContext>>selectedInterval [
	^self interval: self selectorToUse 
]

{
	#category : #api-context,
	#timestamp : ' 8/31/2017 05:26:46'
}
SugsMockContext>>selectedInterval: interval [
	selectedInterval := interval.
]

{
	#category : #api-context,
	#timestamp : ' 8/31/2017 05:26:46'
}
SugsMockContext>>selectedMessageName [

	^message ifNil:[super selectedMessageName] ifNotNil: [ message ]
]

{
	#category : #api-context,
	#timestamp : ' 8/31/2017 05:26:46'
}
SugsMockContext>>selectedMethod [
	^selectorToUse 
		ifNotNil: [self selectedClass 
					compiledMethodAt: selectorToUse 
					ifAbsent: [self selectedClass class methodDict at: selectorToUse]]
 		ifNil:[nil].
]

{
	#category : #api-context,
	#timestamp : ' 8/31/2017 05:26:46'
}
SugsMockContext>>selectedVariable: aVariableName. [
	selectedVariable := aVariableName.
]

{
	#category : #api-context,
	#timestamp : ' 8/31/2017 05:26:46'
}
SugsMockContext>>selectedVariableName [
	^selectedVariable ifNil: [ super selectedVariableName ] ifNotNil:   [selectedVariable]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:46'
}
SugsMockContext>>selectorToUse [
	^ selectorToUse
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:46'
}
SugsMockContext>>selectorToUse: anObject [
	selectorToUse := anObject
]

{
	#category : #api-context,
	#timestamp : ' 8/31/2017 05:26:46'
}
SugsMockContext>>sourceTextArea [
	^ RubScrolledTextMorph new
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:46'
}
SugsMockContext>>withAssigment [
	|temp|
	
	temp := 10.
	^temp
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:46'
}
SugsMockContext>>withClass [
	SugsMockContext .
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:46'
}
SugsMockContext>>withClassVariable [
	ClassVariable
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:46'
}
SugsMockContext>>withInstanceVar [
	anInstanceVar.
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:46'
}
SugsMockContext>>withLiteral [
	'hola' with: 19.
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:46'
}
SugsMockContext>>withMesage [
	self withClassVariable 
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:46'
}
SugsMockContext>>withMethod [

]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:46'
}
SugsMockContext>>withSelf [
	self with: 19.
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:46'
}
SugsMockContext>>withSourceContext [
	SugsMockContext .
	20+10.
	OrderedCollection new.
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:46'
}
SugsMockContext>>withSuper [
	super
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:46'
}
SugsMockContext>>withTemporaryVar [
	|aLocalVar|
	
	aLocalVar := 'bonjour'.
	aLocalVar asString.
]
