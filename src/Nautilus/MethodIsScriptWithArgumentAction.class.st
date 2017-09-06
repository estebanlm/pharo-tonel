"
Action when the method is an executable script tagged with the following pragma

myMethodReturningAForm
    <script: 'self myMethodReturningAForm asMorph openInWorld'>
    ...
"
Class {
	#name : #MethodIsScriptWithArgumentAction,
	#superclass : #MethodIsScriptAction,
	#category : #Nautilus-Widgets,
	#timestamp : 'FranckWarlouzet 6/3/2015 09:58'
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:22'
}
MethodIsScriptWithArgumentAction>>isActionHandled [
	"Return true if the method is tagged with <script: '...'> pragma for 	      evaluating code"
	
    ^ method pragmas anySatisfy: [:each | each keyword = #script: ]
]

{
	#category : #'private - accessing',
	#timestamp : ' 8/31/2017 05:26:22'
}
MethodIsScriptWithArgumentAction>>pragmaName [
	"The name of the pragma we handle"
	
	 ^#script:
]

{
	#category : #'private - actions',
	#timestamp : ' 8/31/2017 05:26:22'
}
MethodIsScriptWithArgumentAction>>runScriptForPragma: pragma [

	self class compiler
			evaluate: pragma arguments first
			for: method methodClass theNonMetaClass
			logged: false

]
