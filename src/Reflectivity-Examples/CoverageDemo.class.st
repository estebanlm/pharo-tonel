"
I'm an example of how metalinks can be used to show the coverage of an execution.

self new openWithSpec
"
Class {
	#name : #CoverageDemo,
	#superclass : #ComposableModel,
	#instVars : [
		'installMetalinkButton',
		'runCodeButton',
		'codePanelMorph',
		'metalinkBlock',
		'compiledMethods',
		'coverageCode'
	],
	#category : #Reflectivity-Examples,
	#timestamp : 'mcamp 11/17/2015 11:33'
}

{
	#category : #specs,
	#timestamp : ' 8/31/2017 05:26:45'
}
CoverageDemo class>>defaultSpec [
	<spec: #default>
	
	^ SpecLayout composed
		newColumn: [:col|
			col add: #codePanelMorph.
			col newRow: [ :row|
				row add: #installMetalinkButton.
				row add: #runCodeButton.	
			] height:  (self toolbarHeight)
		]
]

{
	#category : #specs,
	#timestamp : ' 8/31/2017 05:26:45'
}
CoverageDemo class>>title [
	^'Coverage Demo'
]

{
	#category : #adding,
	#timestamp : ' 8/31/2017 05:26:45'
}
CoverageDemo>>addCards [

	compiledMethods do:[:method|
		codePanelMorph widget addMorph: 
			(ReflectivityCodeMorph compiledMethod: method)
	]
	
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:45'
}
CoverageDemo>>codePanelMorph [
	^ codePanelMorph
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:45'
}
CoverageDemo>>codePanelMorph: anObject [
	codePanelMorph := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:45'
}
CoverageDemo>>compiledMethods [
	^ compiledMethods
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:45'
}
CoverageDemo>>compiledMethods: anObject [
	compiledMethods := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:45'
}
CoverageDemo>>coverageCode [
	^ coverageCode
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:45'
}
CoverageDemo>>coverageCode: anObject [
	coverageCode := anObject
]

{
	#category : #example,
	#timestamp : ' 8/31/2017 05:26:45'
}
CoverageDemo>>exampleMethod [

	self openWithSpec.
]

{
	#category : #example,
	#timestamp : ' 8/31/2017 05:26:45'
}
CoverageDemo>>exampleNotCompleteCoverage [

	self coverageCode: [ ReflectivityExamples new exampleIfTrueIfFalse. ].
	self compiledMethods add: ReflectivityExamples>>#exampleIfTrueIfFalse.
	
	self openWithSpec.
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:45'
}
CoverageDemo>>initialExtent [
	^ 700@600
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:45'
}
CoverageDemo>>initialize [

	coverageCode := [ReflectivityExamples new exampleMethod].
	compiledMethods := OrderedCollection new.
	compiledMethods add: ReflectivityExamples>>#exampleMethod.
	
	super initialize.
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:45'
}
CoverageDemo>>initializePresenter [

	installMetalinkButton action: [self installMetalink].
	runCodeButton action: [ self runCoverageCode ].
	
	"on close"
	self whenWindowChanged: [  
		self window whenClosedDo: [ self removeMetalink ]
	].
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:45'
}
CoverageDemo>>initializeWidgets [

	installMetalinkButton := self newButton.
	runCodeButton := self newButton.
	codePanelMorph := ReflectivitySourceCodeAgroupation new asSpecAdapter.
	
	installMetalinkButton label: 'Install Metalink'.
	runCodeButton label: 'Run Example Code'.
]

{
	#category : #action,
	#timestamp : ' 8/31/2017 05:26:45'
}
CoverageDemo>>installMetalink [
	|link|
	
	link := MetaLink new
		metaObject: #node;
		selector: #tagExecuted.

	compiledMethods do:[:method| method ast nodesDo: [:node | node link: link]].
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:45'
}
CoverageDemo>>installMetalinkButton [
	^ installMetalinkButton
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:45'
}
CoverageDemo>>installMetalinkButton: anObject [
	installMetalinkButton := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:45'
}
CoverageDemo>>metalinkBlock [
	^ metalinkBlock
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:45'
}
CoverageDemo>>metalinkBlock: anObject [
	metalinkBlock := anObject
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:45'
}
CoverageDemo>>openWithSpec [
	self addCards.
	^ super openWithSpec
]

{
	#category : #action,
	#timestamp : ' 8/31/2017 05:26:45'
}
CoverageDemo>>removeMetalink [
	
	compiledMethods do:[:method| method methodClass recompile].
	
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:45'
}
CoverageDemo>>runCodeButton [
	^ runCodeButton
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:45'
}
CoverageDemo>>runCodeButton: anObject [
	runCodeButton := anObject
]

{
	#category : #action,
	#timestamp : ' 8/31/2017 05:26:45'
}
CoverageDemo>>runCoverageCode [

	coverageCode value.
	self updateRubricStyle.
]

{
	#category : #styling,
	#timestamp : ' 8/31/2017 05:26:45'
}
CoverageDemo>>updateRubricStyle [

	codePanelMorph widget submorphs do:[:card| |conf ast|
			
		"delete previous styling"
		conf := RubConfigurationChange new.
		conf configurationBlock: 
			[:text | text segments copy do:#delete].
		card textModel announce: conf.
			
		"add new styling"
		ast := card compiledMethod ast.
		(ast children anySatisfy: [ :node| node hasBeenExecuted])
			ifTrue:[
				ast acceptVisitor: (CoverageRubricStyler new textModel: card textModel)
			]
	]
]
