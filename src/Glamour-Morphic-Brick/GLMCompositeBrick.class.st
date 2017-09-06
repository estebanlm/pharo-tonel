"
I'm a composite brick that provides an api of creating different kind of scriptabe presentations like: 
 - list
 - pharoMethod
 - table
 - tree
"
Class {
	#name : #GLMCompositeBrick,
	#superclass : #GLMBrick,
	#category : #Glamour-Morphic-Brick-Widgets-Phlow,
	#timestamp : 'AliakseiSyrel 1/30/2015 10:13'
}

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMCompositeBrick class>>exampleListClassMethodsOpen [
	
	self gtExampleListClassMethods openInBrickWindow
]

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMCompositeBrick class>>exampleListOpen [
	
	self gtExampleList openInBrickWindow
]

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMCompositeBrick class>>exampleListWithCustomItemsOpen [
	
	self gtExampleListWithCustomItems openInBrickWindowLabeled: 'Phlow list with custom item'
]

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMCompositeBrick class>>examplePharoMethodOpen [
	
	self gtExamplePharoMethod openInBrickWindowLabeled: 'Phlow Pharo method'
]

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMCompositeBrick class>>exampleTableOpen [

	self gtExampleTable openInBrickWindowLabeled: 'Phlowr table'
]

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMCompositeBrick class>>gtExampleList [
	<gtExample>
	<label: 'Phlow simple list'>

	^ self new
		hSpaceFill;
		vSpaceFill;
		with: [ :b |
			b list
				title: 'Example';
				display: [ :x | x + 3 ];
				format: [ :anInteger | anInteger asString, ')' ];
				entity: (1 to: 100) ]
]

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMCompositeBrick class>>gtExampleListClassMethods [
	<gtExample>
	<label: 'Phlow list displaying all methods of an object '>

	^ self new
		hSpaceFill;
		vSpaceFill;
		with: [ :b |
			b list
			title: 'Methods of Object';
			display: #yourself;
			format: [ :compiledMethod | compiledMethod gtDisplayString ];
			styled: [ :brick | brick height: 30 ];
			entity: Object methods ]
]

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMCompositeBrick class>>gtExampleListWithCustomItems [
	<gtExample>
	<label: 'Phlow list with custom items'>

	^ self new
		hSpaceFill;
		vSpaceFill;
		with: [ :b |
			b list
				title: 'Example with custom items';
				display: [ :x | x + 3 ];
				format: [ :anInteger | anInteger asString ];
				styled: [ :aBrick | aBrick textPosition: #center; textColor: Color random ];
				entity: (1 to: 100) ]
]

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMCompositeBrick class>>gtExamplePharoMethod [
	<gtExample>
	<label: 'Phlow Pharo method'>

	^ self new
		hSpaceFill;
		vSpaceFill;
		with: [ :b |
			b pharoMethod
				title: #printString;
				display: #sourceCode;
				smalltalkClass: #methodClass;
				entity: Morph>>#bounds ]
]

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMCompositeBrick class>>gtExampleTable [
	<gtExample>
	<label: 'Phlowr table'>
	
	^ self new
		hSpaceFill;
		vSpaceFill;
		with: [ :b |
			b table
				title: #asString;
				display: [ :anObject | (anObject gtInspectorVariableValuePairs asSortedCollection asOrderedCollection yourself) addFirst: 'self' -> anObject; yourself ];
				column: 'Variable'
					evaluated: [:assoc |	GTObjectPrinter asNonTruncatedTextFrom: assoc key ]
					styled: [ :aBrick | aBrick textPosition: #rightCenter; margin: #(0 15 0 0); textColor: Color lightGray ];
				column: 'Variable'
					evaluated: [:assoc | GTObjectPrinter asTruncatedTextFrom: assoc value ]
					styled: [ :aBrick | aBrick margin: #(0 0 0 15) ];
				entity: Morph new ]
]

{
	#category : #phlow,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMCompositeBrick>>custom: aBrick [
	self flag: 'for now we only allow one subbrick in the composite.
	We have to revisit this implementation after the composite will allow for multiple subbricks'.
	self hasSubbricks ifFalse: [ self addBrickBack: aBrick ].
	^ aBrick
]

{
	#category : #phlow,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMCompositeBrick>>list [

	^ self custom: GLMPhlowListBrick new
]

{
	#category : #phlow,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMCompositeBrick>>pharoMethod [

	^ self custom: GLMPhlowPharoMethodBrick new
]

{
	#category : #phlow,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMCompositeBrick>>table [

	^ self custom: GLMPhlowTableBrick new
]

{
	#category : #phlow,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMCompositeBrick>>text [

	^ self custom: GLMPhlowTextBrick new
]

{
	#category : #phlow,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMCompositeBrick>>tree [

]
