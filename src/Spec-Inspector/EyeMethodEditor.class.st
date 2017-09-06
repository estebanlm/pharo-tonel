"
A simple editor for complied methods.
"
Class {
	#name : #EyeMethodEditor,
	#superclass : #EyeEditor,
	#instVars : [
		'toolbar'
	],
	#category : #Spec-Inspector,
	#timestamp : '<historical>'
}

{
	#category : #spec,
	#timestamp : ' 8/31/2017 05:26:18'
}
EyeMethodEditor class>>inspectorSpec [
	<spec>
	
	^ SpecLayout composed
		add: #text;
		yourself
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
EyeMethodEditor class>>label [
	^ 'Method Editor'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
EyeMethodEditor>>method [
	^ self object
]

{
	#category : #event-handling,
	#timestamp : ' 8/31/2017 05:26:18'
}
EyeMethodEditor>>objectChanged [
	self text 
		text: self method sourceCode;
		behavior: self method methodClass.
	
	self toolbar method: self method
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
EyeMethodEditor>>title [
	^ self method printString 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
EyeMethodEditor>>toolbar [
	^ toolbar ifNil: [ 
		toolbar := self instantiate: MethodToolbar. ]
]
