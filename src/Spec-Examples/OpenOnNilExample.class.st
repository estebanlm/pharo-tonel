"
I am the component of DynamycSpecExample used for nil.

self example

I display simply an TextInputFieldModel, disable to don't be edditable by the user.
"
Class {
	#name : #OpenOnNilExample,
	#superclass : #ComposableModel,
	#instVars : [
		'text'
	],
	#category : #Spec-Examples-Wrapper,
	#timestamp : 'Spirita 7/27/2016 11:04'
}

{
	#category : #specs,
	#timestamp : ' 8/31/2017 05:26:25'
}
OpenOnNilExample class>>defaultSpec [
	<spec: #default>
	^ SpecLayout composed
		newRow: #text height: 25;
		yourself.
]

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:25'
}
OpenOnNilExample class>>example [
	| example |
	example := self new.
	example
		extent: 200 @ 100;
		openWithSpec.
	^ example
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:25'
}
OpenOnNilExample>>initialize: anInteger [
	text label: anInteger asString
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:25'
}
OpenOnNilExample>>initializeWidgets [
	text := self instantiate: TextInputFieldModel.
	text
		text: 'Object is nil';
		enabled: false.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:25'
}
OpenOnNilExample>>text [
	^ text
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:25'
}
OpenOnNilExample>>title [
	^ 'OpenOnNilExample'
]
