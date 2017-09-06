"

"
Class {
	#name : #GLMCustomCell,
	#superclass : #Object,
	#instVars : [
		'children',
		'span',
		'id',
		'browser',
		'size'
	],
	#category : #Glamour-Browsers-Tabulator,
	#timestamp : ''
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMCustomCell>>browser  [
	 
	^browser
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMCustomCell>>browser: anObject  [
	 
	browser := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMCustomCell>>children  [
	 
	^children ifNil: [children := OrderedCollection new]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMCustomCell>>children: anObject  [
	 
	children := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMCustomCell>>childrenCount  [
	 
	^self children 
		inject: 0 
		into: [:sum :each | sum + each span]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMCustomCell>>hasId  [
	 
	^id notNil
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMCustomCell>>id  [
	 
	^id ifNil: [#anonymous]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMCustomCell>>id: anObject  [
	 
	id := anObject
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMCustomCell>>isColumn  [
	 
	^false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMCustomCell>>isRow  [
	 
	^false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMCustomCell>>isSplitIntoColumns  [
	 
	^self children allSatisfy: [:each | each isColumn]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMCustomCell>>isSplitIntoRows  [
	 
	^self children allSatisfy: [:each | each isRow]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMCustomCell>>size [
	^ size ifNil: [0]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMCustomCell>>size: anObject [
	size := anObject.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMCustomCell>>span  [
	 
	^span ifNil: [span := 1]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMCustomCell>>span: anObject  [
	 
	span := anObject
]
