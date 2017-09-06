"
This is a helper class for the TablePresentation.

Instance Variables:
	title	<ProtoObject | PseudoContext>
	computation	<ProtoObject | PseudoContext>
"
Class {
	#name : #GLMTableColumn,
	#superclass : #Object,
	#traits : 'GLMTBlockTags',
	#classTraits : 'GLMTBlockTags classTrait',
	#instVars : [
		'title',
		'computation',
		'width',
		'tagsBlock',
		'tagsFilterBlock',
		'sortBlock',
		'defaultSortBlock',
		'modifiedBlock'
	],
	#category : #Glamour-Presentations,
	#timestamp : 'TudorGirba 2/4/2011 21:14'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMTableColumn>>computation [
	^ computation
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMTableColumn>>computation: anObject [
	computation := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMTableColumn>>defaultSortBlockForPresentation: aGlamourPresentation [
	
	^ [ :x :y | 		
			(aGlamourPresentation
				column: self 
				valueFor: x) asString <
			(aGlamourPresentation 
				column: self 
				valueFor: y) asString ] 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMTableColumn>>modifiedBlock [
	^ modifiedBlock
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMTableColumn>>modifiedBlock: anObject [
	modifiedBlock := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMTableColumn>>sortBlock [
	^ sortBlock
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMTableColumn>>sortBlock: aBlock [
	sortBlock := aBlock
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMTableColumn>>tagsBlock [
	^ tagsBlock
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMTableColumn>>tagsBlock: aBlock [
	tagsBlock := aBlock
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMTableColumn>>tagsFilter: aBlock [
	tagsFilterBlock := aBlock 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMTableColumn>>tagsFilterBlock [
	^ tagsFilterBlock
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMTableColumn>>title [
	^ title
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMTableColumn>>title: anObject [
	title := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMTableColumn>>width [
	^ width ifNil: [200]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMTableColumn>>width: anObject [
	width := anObject
]
