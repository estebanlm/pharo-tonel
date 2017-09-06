"

"
Class {
	#name : #GLMActionTest,
	#superclass : #TestCase,
	#category : #Glamour-Tests-Core,
	#timestamp : ''
}

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMActionTest>>testCondition [
	self 
		assert: (GLMAction new isAvailableOn: GLMPresentation new).
	self 
		deny: (GLMAction new 
			condition: [ false ];
			isAvailableOn: GLMPresentation new).
	self 
		deny: (GLMAction new 
			condition: [ :presentation :entity | false ];
			isAvailableOn: GLMPresentation new)
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMActionTest>>testShortcutAsString [
	| action modifier |
	
	modifier := Smalltalk os menuShortcutModifierString.
	action := GLMAction new.
	action shortcut: $i.
	self assert: action shortcutAsString equals: modifier, '+i'.
	action shortcut: $I.
	self assert: action shortcutAsString equals: modifier, '+shift+i'.
	action shortcut: nil.
	self assert: action shortcutAsString isEmpty
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMActionTest>>testShortcutFromKeymap [
	| action modifier |
	
	modifier := Smalltalk os defaultModifier.
	action := GLMAction new.
	action keymap: modifier + $i asShortcut.
	self assert: action keymap equals: modifier + $i asShortcut.
	action keymap: modifier + $i shift.
	self assert: action keymap equals: modifier + $i shift.
	action keymap: nil.
	self assert: action shortcutAsString isEmpty
]
