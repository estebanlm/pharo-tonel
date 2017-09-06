"
A GLMTablePresentation shows the given elements within a table.  If the #children block is set then it support a tree-like table where elements can be expanded.

Each column of the presetation can have its own tags and its own sorting block.

Instance Variables
	children:		<Object>
	columns:		<Object>
	rootsExpanded:		<Object>

children
	- xxxxx

columns
	- xxxxx

rootsExpanded
	- xxxxx

"
Class {
	#name : #GLMTablePresentation,
	#superclass : #GLMListingPresentation,
	#traits : 'TGLMScriptingAPITablePresentation',
	#classTraits : 'TGLMScriptingAPITablePresentation classTrait',
	#instVars : [
		'columns',
		'children',
		'rootsExpanded',
		'shouldShowHeader'
	],
	#category : #Glamour-Presentations,
	#timestamp : 'AndreiChis 10/3/2014 18:33'
}

{
	#category : #validation,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMTablePresentation>>allDisplayedDo: aBlock [
	self displayValue do: [ :eachRoot | 
		self withChildrenOf: eachRoot do: aBlock ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMTablePresentation>>children [
	 
	^ children
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMTablePresentation>>children: anObject  [
	 
	children := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMTablePresentation>>childrenValueOf: anObject [
	^ self children glamourValue: (anObject asGlamorousMultiValue, self entity asGlamorousMultiValue)
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMTablePresentation>>childrenValueOf: anObject atLevel: anInteger [
	^ self children glamourValue: (
		anObject asGlamorousMultiValue, 
		self entity asGlamorousMultiValue,
		anInteger asGlamorousMultiValue,
		self asGlamorousMultiValue)
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMTablePresentation>>columns [
	^ columns ifNil: [ columns := OrderedCollection new ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMTablePresentation>>columns: aCollection [
	columns := aCollection 
]

{
	#category : #tags,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMTablePresentation>>computeTagsFilterFor: aGlamourValue [
	| tags |
	
	tags := OrderedCollection new.
	self columns collect: [ :aColumn | 
		tags addAll: (aColumn computeTagsFilterFor: aGlamourValue) ].
	^ tags
]

{
	#category : #tags,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMTablePresentation>>computeTagsFor: anObject [
	| tags |
	
	tags := OrderedCollection new.
	self columns collect: [ :aColumn | 
		tags addAll: (aColumn computeTagsFor: anObject) ].
	^ tags
]

{
	#category : #validation,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMTablePresentation>>defaultValidate: anObject on: aPort [
	"we only allow objects that are in the display value"
	(aPort name == #selection) ifFalse: [ ^ true ].
	self entity isNil ifTrue: [ ^ false ].
	self allDisplayedDo: [:each | each = anObject ifTrue: [ ^ true ] ].
	^ false
]

{
	#category : #'default actions',
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMTablePresentation>>exportToCSV [
	FileSystem workingDirectory / 'table-export.csv' writeStreamDo: [ :stream |
		self columns do: [ :column | 
						stream 
							nextPut: $";
							nextPutAll: (self titleValueOfColumn: column);
							nextPut: $" ]
						separatedBy: [ stream nextPut: $, ].
		stream cr.
		self displayValue 
			do: [ :each |
				self columns 
					do: [ :column | 
						stream 
							nextPut: $";
							nextPutAll: (self column: column valueFor: each) asString;
							nextPut: $" ]
					separatedBy: [ stream nextPut: $, ].
				stream cr ]
			displayingProgress: 'Exporting' ]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMTablePresentation>>hasTags [

	^ self columns anySatisfy: [ :aColumn | aColumn hasTags ]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMTablePresentation>>hasTagsFilter [

	^ self columns anySatisfy: [ :aColumn | aColumn hasTagsFilter ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMTablePresentation>>hideHeader [
	shouldShowHeader := false
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMTablePresentation>>initialize [
	super initialize.
	children := [ #() ]
]

{
	#category : #'default actions',
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMTablePresentation>>installExportToCSV [
	self 
		act: [ self exportToCSV ]
		entitled: 'Export to CSV'
]

{
	#category : #rendering,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMTablePresentation>>renderGlamorouslyOn: aRenderer  [
	self registerAnnouncements.
	^ aRenderer renderTablePresentation: self
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMTablePresentation>>shouldRootsExpand [
	^ rootsExpanded ifNil: [false]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMTablePresentation>>shouldRootsExpand: anObject [
	rootsExpanded := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMTablePresentation>>shouldShowHeader [
	^ shouldShowHeader ifNil: [ shouldShowHeader := true ]
]

{
	#category : #validation,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMTablePresentation>>withChildrenOf: anObject do: aBlock [
	aBlock value: anObject.
	(self childrenValueOf: anObject) do: [ :each |
		self withChildrenOf: each do: aBlock ]
]
