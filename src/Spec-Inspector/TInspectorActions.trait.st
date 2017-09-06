"
I contain common actions for inspectors and inspector elements/wrappers
"
Trait {
	#name : #TInspectorActions,
	#traits : '{}',
	#classTraits : '{}',
	#category : #Spec-Inspector,
	#timestamp : '<historical>'
}

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:18'
}
TInspectorActions>>browseSelectedObject [
	self selectedObjectDo: [ :anObject | anObject browse ]
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:18'
}
TInspectorActions>>browseSelectedObjectClass [
	self selectedObjectDo: [ :anObject | Smalltalk tools browser openOnClass: anObject class ]
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:18'
}
TInspectorActions>>browseSelectedObjectClassHierarchy [
	self selectedObjectDo: [ :anObject | anObject class browseHierarchy ]
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:18'
}
TInspectorActions>>exploreSelectedObject [
	self selectedObjectDo: [ :anObject | anObject explore ].
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:18'
}
TInspectorActions>>inspectInNewWindow: anObject [

	anObject inspect
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:18'
}
TInspectorActions>>inspectSelectedObjectInNewWindow [
	self selectedObjectDo: [ :anObject | self inspectInNewWindow: anObject ].
]
