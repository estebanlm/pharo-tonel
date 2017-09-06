"
I am a node used to render a Hiedra ruler.
"
Class {
	#name : #HiNode,
	#superclass : #HiRenderingElement,
	#instVars : [
		'value',
		'columnIndex',
		'rowIndex'
	],
	#category : #Hiedra-Rendering,
	#timestamp : 'MartinDias 3/30/2016 23:18'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:27'
}
HiNode class>>contents: anObject [
	^ self new
		contents: anObject;
		yourself
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:27'
}
HiNode class>>contents: anObject rowIndex: anIndex [
	^ self new
		contents: anObject;
		rowIndex: anIndex;
		yourself
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 05:26:27'
}
HiNode>>= other [

	^ self class = other class and: [ value = other contents ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
HiNode>>columnIndex [
	^ columnIndex
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
HiNode>>columnIndex: anObject [
	columnIndex := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
HiNode>>contents [
	^ value
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
HiNode>>contents: anObject [
	value := anObject
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 05:26:27'
}
HiNode>>hash [

	^ value hash
]

{
	#category : #controlling,
	#timestamp : ' 8/31/2017 05:26:27'
}
HiNode>>ifNode: nodeBlock ifLink: linkBlock [

	^ nodeBlock cull: self
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:27'
}
HiNode>>isLink [

	^ false
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:27'
}
HiNode>>printOn: aStream [

	super printOn: aStream.
	
	aStream
		nextPut: $(;
		print: value;
		nextPut: $).
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
HiNode>>rowIndex [
	^ rowIndex
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
HiNode>>rowIndex: anObject [
	rowIndex := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
HiNode>>rulerPoint [
	^ columnIndex @ rowIndex 
]
