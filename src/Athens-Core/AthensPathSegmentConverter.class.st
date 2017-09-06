"
this class is subject of changes/removal. do not use it.
"
Class {
	#name : #AthensPathSegmentConverter,
	#superclass : #Object,
	#instVars : [
		'dest',
		'endPoint',
		'contourStartPt'
	],
	#category : #Athens-Core-Paths,
	#timestamp : '<historical>'
}

{
	#category : #converting,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensPathSegmentConverter>>convert: aPath [
	"pipe the path segments to destination, converting
	segments on the way"
	
	contourStartPt := endPoint := 0@0.
	
	aPath sendCommandsTo: self.
	
	
	
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensPathSegmentConverter>>dest: aDest [
	dest := aDest
]
