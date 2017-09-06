Extension {
	#name : #GlamourPresentationModel
}

{
	#category : #'*GT-Inspector',
	#timestamp : ' 8/31/2017 05:26:35'
}
GlamourPresentationModel class>>exampleInspectorOn42 [
	<gtExample>
	"open an inspector on 42"
	^ self inspectorOn: 42
]

{
	#category : #'*GT-Inspector',
	#timestamp : ' 8/31/2017 05:26:35'
}
GlamourPresentationModel class>>exampleSimpleMethodsBrowser [
	<gtExample>
	"Open a Methods Browser on Object."
	|ui|
	ui := GlamourPresentationModel new.
	ui presentationClass: GTSimpleMethodsBrowser startOn: Object.
	^ ui openWithSpec
]

{
	#category : #'*GT-Inspector',
	#timestamp : ' 8/31/2017 05:26:35'
}
GlamourPresentationModel class>>inspectorOn: anObject [
	"Open an inspector on anObject. 
	Execute the following example:
	self inspectorOn: 42.
	self inspectorOn: self new."
	|ui|
	ui := GlamourPresentationModel new.
	ui presentationClass: GTInspector startOn: anObject.
	^ ui openWithSpec
]
