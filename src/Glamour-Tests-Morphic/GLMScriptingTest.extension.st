Extension {
	#name : #GLMScriptingTest
}

{
	#category : #'*glamour-tests-morphic',
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMScriptingTest>>testMorphicActionDefinition [
	| browser |
	browser := GLMTabulator new.
	browser column: #one.
	browser
		transmit to: #one;
		andShow: [ :a | 
					a text morphicAct: [  ] entitled: ''.
					a list morphicAct: [  ] entitled: ''.
					a tree morphicAct: [  ] entitled: '' ].
	browser startOn: #(42).
	browser panes first presentations do: [ :each | self assert: each actions size equals: 1 ]
]
