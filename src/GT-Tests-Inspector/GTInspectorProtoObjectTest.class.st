"

"
Class {
	#name : #GTInspectorProtoObjectTest,
	#superclass : #GLMMorphicTest,
	#category : #GT-Tests-Inspector,
	#timestamp : ''
}

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
GTInspectorProtoObjectTest>>testInspectDoesNotCrash [
	window := GTInspector openOn: ProtoObject new 
]
