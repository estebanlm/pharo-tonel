"

"
Class {
	#name : #ReflectivityReificationTest,
	#superclass : #TestCase,
	#instVars : [
		'tag',
		'link'
	],
	#category : #Reflectivity-Tests,
	#timestamp : ''
}

{
	#category : #tagging,
	#timestamp : ' 8/31/2017 05:26:31'
}
ReflectivityReificationTest>>tagExec [
	tag := #yes
]

{
	#category : #tagging,
	#timestamp : ' 8/31/2017 05:26:31'
}
ReflectivityReificationTest>>tagExec: aTag [
	tag := aTag.
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:31'
}
ReflectivityReificationTest>>tearDown [
	link ifNotNil: [link uninstall].
]

{
	#category : #'tests - variablenodes',
	#timestamp : ' 8/31/2017 05:26:31'
}
ReflectivityReificationTest>>testAccessTemp [
	| varNode instance |
	varNode := (ReflectivityExamples>>#exampleAssignment) ast body statements second.
	link := MetaLink new 
		metaObject: self; 
		selector: #tagExec:;
		arguments: {RBVariableNode named: #temp}.
	varNode link: link.
	self assert: varNode hasMetalink.
	self assert: (tag isNil).
	instance := ReflectivityExamples new .
	self assert: (instance exampleAssignment = 3).
	self assert: (tag = 3).
]

{
	#category : #'tests - variables',
	#timestamp : ' 8/31/2017 05:26:31'
}
ReflectivityReificationTest>>testReifyClassVariableClass [
	| classVar instance |
	classVar := ReflectivityExamples classVariableNamed: #ClassVar.
	link := MetaLink new 
		metaObject: self; 
		selector: #tagExec:;
		arguments: #(class).
	classVar link: link.
	self assert: classVar hasMetalink.
	self assert: (ReflectivityExamples >> #exampleClassVarRead) class = ReflectiveMethod.
	self assert: (tag isNil).
	instance := ReflectivityExamples new.
	self assert: (instance exampleClassVarRead = #AClassVar).
	self assert: (tag == ReflectivityExamples).
]

{
	#category : #'tests - variables',
	#timestamp : ' 8/31/2017 05:26:31'
}
ReflectivityReificationTest>>testReifyClassVariableContext [
	| classVar instance |
	classVar := ReflectivityExamples classVariableNamed: #ClassVar.
	link := MetaLink new 
		metaObject: self; 
		selector: #tagExec:;
		arguments: #(context).
	classVar link: link.
	self assert: classVar hasMetalink.
	self assert: (ReflectivityExamples >> #exampleClassVarRead) class = ReflectiveMethod.
	self assert: (tag isNil).
	instance := ReflectivityExamples new.
	self assert: (instance exampleClassVarRead = #AClassVar).
	self assert: (tag class == Context).
]

{
	#category : #'tests - variables',
	#timestamp : ' 8/31/2017 05:26:31'
}
ReflectivityReificationTest>>testReifyClassVariableEntity [
	| classVar instance |
	classVar := ReflectivityExamples classVariableNamed: #ClassVar.
	link := MetaLink new 
		metaObject: self; 
		selector: #tagExec:;
		arguments: #(entity).
	classVar link: link.
	self assert: classVar hasMetalink.
	self assert: (ReflectivityExamples >> #exampleClassVarRead) class = ReflectiveMethod.
	self assert: (tag isNil).
	instance := ReflectivityExamples new.
	self assert: (instance exampleClassVarRead = #AClassVar).
	self assert: (tag = classVar).
]

{
	#category : #'tests - variables',
	#timestamp : ' 8/31/2017 05:26:31'
}
ReflectivityReificationTest>>testReifyClassVariableLink [
	| classVar instance |
	classVar := ReflectivityExamples classVariableNamed: #ClassVar.
	link := MetaLink new 
		metaObject: self; 
		selector: #tagExec:;
		arguments: #(link).
	classVar link: link.
	self assert: classVar hasMetalink.
	self assert: (ReflectivityExamples >> #exampleClassVarRead) class = ReflectiveMethod.
	self assert: (tag isNil).
	instance := ReflectivityExamples new.
	self assert: (instance exampleClassVarRead = #AClassVar).
	self assert: (tag == link).
]

{
	#category : #'tests - variables',
	#timestamp : ' 8/31/2017 05:26:31'
}
ReflectivityReificationTest>>testReifyClassVariableName [
	| classVar instance |
	classVar := ReflectivityExamples classVariableNamed: #ClassVar.
	link := MetaLink new 
		metaObject: self; 
		selector: #tagExec:;
		arguments: #(name).
	classVar link: link.
	self assert: classVar hasMetalink.
	self assert: (ReflectivityExamples >> #exampleClassVarRead) class = ReflectiveMethod.
	self assert: (tag isNil).
	instance := ReflectivityExamples new.
	self assert: (instance exampleClassVarRead = #AClassVar).
	self assert: (tag = #ClassVar).
]

{
	#category : #'tests - variables',
	#timestamp : ' 8/31/2017 05:26:31'
}
ReflectivityReificationTest>>testReifyClassVariableObject [
	| classVar instance |
	classVar := ReflectivityExamples classVariableNamed: #ClassVar.
	link := MetaLink new 
		metaObject: self; 
		selector: #tagExec:;
		arguments: #(object).
	classVar link: link.
	self assert: classVar hasMetalink.
	self assert: (ReflectivityExamples >> #exampleClassVarRead) class = ReflectiveMethod.
	self assert: (tag isNil).
	instance := ReflectivityExamples new.
	self assert: (instance exampleClassVarRead = #AClassVar).
	self assert: (tag class == ReflectivityExamples).
]

{
	#category : #'tests - variables',
	#timestamp : ' 8/31/2017 05:26:31'
}
ReflectivityReificationTest>>testReifyClassVariableValue [
	| classVar instance |
	classVar := ReflectivityExamples classVariableNamed: #ClassVar.
	link := MetaLink new 
		metaObject: self; 
		selector: #tagExec:;
		arguments: #(value).
	classVar link: link.
	self assert: classVar hasMetalink.
	self assert: (ReflectivityExamples >> #exampleClassVarRead) class = ReflectiveMethod.
	self assert: (tag isNil).
	instance := ReflectivityExamples new.
	self assert: (instance exampleClassVarRead = #AClassVar).
	self assert: (tag = #AClassVar).
]

{
	#category : #'tests - variables',
	#timestamp : ' 8/31/2017 05:26:31'
}
ReflectivityReificationTest>>testReifyClassVariableVariable [
	| classVar instance |
	classVar := ReflectivityExamples classVariableNamed: #ClassVar.
	link := MetaLink new 
		metaObject: self; 
		selector: #tagExec:;
		arguments: #(variable).
	classVar link: link.
	self assert: classVar hasMetalink.
	self assert: (ReflectivityExamples >> #exampleClassVarRead) class = ReflectiveMethod.
	self assert: (tag isNil).
	instance := ReflectivityExamples new.
	self assert: (instance exampleClassVarRead = #AClassVar).
	self assert: (tag = classVar).
]

{
	#category : #'tests - allnodes',
	#timestamp : ' 8/31/2017 05:26:31'
}
ReflectivityReificationTest>>testReifyEntity [
	| varNode instance |
	varNode := (ReflectivityExamples>>#exampleIvarRead) ast body statements last value.
	link := MetaLink new 
		metaObject: self; 
		selector: #tagExec:;
		arguments: #(entity).
	varNode link: link.
	self assert: varNode hasMetalink.
	self assert: (tag isNil).
	instance := ReflectivityExamples new .
	self assert: (instance exampleIvarRead = 33).
	self assert: (tag = varNode).

]

{
	#category : #'tests - variablenodes',
	#timestamp : ' 8/31/2017 05:26:31'
}
ReflectivityReificationTest>>testReifyGlobalName [
	| varNode instance |
	varNode := (ReflectivityExamples>>#exampleGlobalRead) ast body statements last value.
	link := MetaLink new 
		metaObject: self; 
		selector: #tagExec:;
		arguments: #(name).
	varNode link: link.
	self assert: varNode hasMetalink.
	self assert: (tag isNil).
	instance := ReflectivityExamples new .
	self assert: (instance exampleGlobalRead = GlobalForTesting).
	self assert: (tag = #GlobalForTesting).
]

{
	#category : #'tests - variablenodes',
	#timestamp : ' 8/31/2017 05:26:31'
}
ReflectivityReificationTest>>testReifyGlobalValue [
	| varNode instance |
	varNode := (ReflectivityExamples>>#exampleGlobalRead) ast body statements last value.
	link := MetaLink new 
		metaObject: self; 
		selector: #tagExec:;
		arguments: #(value).
	varNode link: link.
	self assert: varNode hasMetalink.
	self assert: (tag isNil).
	instance := ReflectivityExamples new .
	self assert: (instance exampleGlobalRead = GlobalForTesting).
	self assert: (tag = GlobalForTesting).
]

{
	#category : #'tests - variablenodes',
	#timestamp : ' 8/31/2017 05:26:31'
}
ReflectivityReificationTest>>testReifyGlobalVariable [
	| varNode instance |
	varNode := (ReflectivityExamples>>#exampleGlobalRead) ast body statements last value.
	link := MetaLink new 
		metaObject: self; 
		selector: #tagExec:;
		arguments: #(variable).
	varNode link: link.
	self assert: varNode hasMetalink.
	self assert: (tag isNil).
	instance := ReflectivityExamples new .
	self assert: (instance exampleGlobalRead = GlobalForTesting).
	self assert: (tag class == GlobalVariable).

]

{
	#category : #'tests - variables',
	#timestamp : ' 8/31/2017 05:26:31'
}
ReflectivityReificationTest>>testReifyGlobalVariableValue [
	| globalVar instance |
	globalVar := GlobalForTesting binding.
	link := MetaLink new 
		metaObject: self; 
		selector: #tagExec:;
		arguments: #(name).
	globalVar link: link.
	self assert: globalVar hasMetalink.
	self assert: (ReflectivityExamples >> #exampleGlobalRead) class = ReflectiveMethod.
	self assert: (tag isNil).
	instance := ReflectivityExamples new.
	self assert: (instance exampleGlobalRead = GlobalForTesting).
	self assert: (tag = #GlobalForTesting).
]

{
	#category : #'tests - variablenodes',
	#timestamp : ' 8/31/2017 05:26:31'
}
ReflectivityReificationTest>>testReifyIvarName [
	| varNode instance |
	varNode := (ReflectivityExamples>>#exampleIvarRead) ast body statements last value.
	link := MetaLink new 
		metaObject: self; 
		selector: #tagExec:;
		arguments: #(name).
	varNode link: link.
	self assert: varNode hasMetalink.
	self assert: (tag isNil).
	instance := ReflectivityExamples new .
	self assert: (instance exampleIvarRead = 33).
	self assert: (tag = 'ivar').
]

{
	#category : #'tests - variablenodes',
	#timestamp : ' 8/31/2017 05:26:31'
}
ReflectivityReificationTest>>testReifyIvarValue [
	| varNode instance |
	varNode := (ReflectivityExamples>>#exampleIvarRead) ast body statements last value.
	link := MetaLink new 
		metaObject: self; 
		selector: #tagExec:;
		arguments: #(value).
	varNode link: link.
	self assert: varNode hasMetalink.
	self assert: (tag isNil).
	instance := ReflectivityExamples new .
	self assert: (instance exampleIvarRead = 33).
	self assert: (tag = 33).
]

{
	#category : #'tests - variablenodes',
	#timestamp : ' 8/31/2017 05:26:31'
}
ReflectivityReificationTest>>testReifyIvarVariable [
	| varNode instance |
	varNode := (ReflectivityExamples>>#exampleIvarRead) ast body statements last value.
	link := MetaLink new 
		metaObject: self; 
		selector: #tagExec:;
		arguments: #(variable).
	varNode link: link.
	self assert: varNode hasMetalink.
	self assert: (tag isNil).
	instance := ReflectivityExamples new .
	self assert: (instance exampleIvarRead = 33).
	self assert: (tag isKindOf: Slot).
]

{
	#category : #'tests - method',
	#timestamp : ' 8/31/2017 05:26:31'
}
ReflectivityReificationTest>>testReifyMethodArgs [
	| sendNode instance|
	sendNode := (ReflectivityExamples>>#exampleWithArg:) ast.
	link := MetaLink new 
		metaObject: self; 
		selector: #tagExec:;
		arguments: #(arguments).
	sendNode link: link.
	self assert: sendNode hasMetalink.
	self assert: (ReflectivityExamples>>#exampleWithArg:) class = ReflectiveMethod.
	self assert: (tag isNil).
	instance := ReflectivityExamples new .
	self assert: ((instance exampleWithArg: 3) = 5).
	self assert: (tag = #(3)).

]

{
	#category : #'tests - method',
	#timestamp : ' 8/31/2017 05:26:31'
}
ReflectivityReificationTest>>testReifyMethodArgsAfter [
	| methodNode instance|
	methodNode := (ReflectivityExamples>>#exampleWithArg:) ast.
	link := MetaLink new 
		metaObject: self; 
		selector: #tagExec:;
		control: #after;
		arguments: #(arguments).
	methodNode link: link.
	self assert: methodNode hasMetalink.
	self assert: (ReflectivityExamples>>#exampleWithArg:) class = ReflectiveMethod.
	self assert: (tag isNil).
	instance := ReflectivityExamples new .
	self assert: ((instance exampleWithArg: 3) = 5).
	self assert: (tag = #(3)).

]

{
	#category : #'tests - method',
	#timestamp : ' 8/31/2017 05:26:31'
}
ReflectivityReificationTest>>testReifyMethodReceiver [
	| sendNode instance|
	sendNode := (ReflectivityExamples>>#exampleMethod) ast.
	link := MetaLink new 
		metaObject: self; 
		selector: #tagExec:;
		arguments: #(receiver).
	sendNode link: link.
	self assert: sendNode hasMetalink.
	self assert: (ReflectivityExamples>>#exampleMethod) class = ReflectiveMethod.
	self assert: (tag isNil).
	instance := ReflectivityExamples new.
	self assert: (instance exampleMethod = 5).
	self assert: (tag = instance).

]

{
	#category : #'tests - method',
	#timestamp : ' 8/31/2017 05:26:31'
}
ReflectivityReificationTest>>testReifyMethodSelector [
	| sendNode instance|
	sendNode := (ReflectivityExamples>>#exampleMethod) ast.
	link := MetaLink new 
		metaObject: self; 
		selector: #tagExec:;
		arguments: #(selector).
	sendNode link: link.
	self assert: sendNode hasMetalink.
	self assert: (ReflectivityExamples>>#exampleMethod) class = ReflectiveMethod.
	self assert: (tag isNil).
	instance := ReflectivityExamples new .
	self assert: (instance exampleMethod = 5).
	self assert: (tag = #exampleMethod).

]

{
	#category : #'tests - method',
	#timestamp : ' 8/31/2017 05:26:31'
}
ReflectivityReificationTest>>testReifyMethodThisContext [
	| sendNode instance|
	sendNode := (ReflectivityExamples>>#exampleMethod) ast.
	link := MetaLink new 
		metaObject: self; 
		selector: #tagExec:;
		arguments: #(context).
	sendNode link: link.
	self assert: sendNode hasMetalink.
	self assert: (ReflectivityExamples>>#exampleMethod) class = ReflectiveMethod.
	self assert: (tag isNil).
	instance := ReflectivityExamples new.
	self assert: (instance exampleMethod = 5).
	self assert: (tag class = Context ).

]

{
	#category : #'tests - assignment',
	#timestamp : ' 8/31/2017 05:26:31'
}
ReflectivityReificationTest>>testReifyNewValueAssignment [
	| varNode instance|
	varNode := (ReflectivityExamples>>#exampleAssignment) assignmentNodes first.
	link := MetaLink new 
		metaObject: self; 
		selector: #tagExec:;
		arguments: #(newValue).
	varNode link: link.
	self assert: varNode hasMetalink.
	self assert: (tag isNil).
	instance := ReflectivityExamples new .
	self assert: (instance exampleAssignment = 3).
	self assert: (tag = 3).

]

{
	#category : #'tests - allnodes',
	#timestamp : ' 8/31/2017 05:26:31'
}
ReflectivityReificationTest>>testReifyNode [
	| varNode instance |
	varNode := (ReflectivityExamples>>#exampleIvarRead) ast body statements last value.
	link := MetaLink new 
		metaObject: self; 
		selector: #tagExec:;
		arguments: #(node).
	varNode link: link.
	self assert: varNode hasMetalink.
	self assert: (tag isNil).
	instance := ReflectivityExamples new .
	self assert: (instance exampleIvarRead = 33).
	self assert: (tag = varNode).


]

{
	#category : #'tests - allnodes',
	#timestamp : ' 8/31/2017 05:26:31'
}
ReflectivityReificationTest>>testReifyObject [
	| sendNode instance|
	sendNode := (ReflectivityExamples>>#exampleMethod) ast body statements first value.
	link := MetaLink new 
		metaObject: self; 
		selector: #tagExec:;
		arguments: #(object).
	sendNode link: link.
	self assert: sendNode hasMetalink.
	self assert: (ReflectivityExamples>>#exampleMethod) class = ReflectiveMethod.
	self assert: (tag isNil).
	instance := ReflectivityExamples new .
	self assert: (instance exampleMethod = 5).
	self assert: (tag = instance).
	self assert: (ReflectivityExamples>>#exampleMethod) class = CompiledMethod. 

]

{
	#category : #'tests - sends',
	#timestamp : ' 8/31/2017 05:26:31'
}
ReflectivityReificationTest>>testReifyReceiverOnSendWithArguments [
	| sendNode instance beforeSize |
	sendNode := (ReflectivityExamples>>#exampleSendNoReturn) ast body statements last.
	beforeSize := 0.
	link := MetaLink new 
		metaObject: [:receiver | beforeSize := receiver size]; 
		selector: #value:;
		control: #before;
		arguments: #(receiver).
	sendNode link: link.
	self assert: sendNode hasMetalink.
	self assert: (ReflectivityExamples>>#exampleSendNoReturn) class equals: ReflectiveMethod.
	self assert: beforeSize equals: 0.
	instance := ReflectivityExamples new .
	instance exampleSendNoReturn.
	self assert: beforeSize equals: 2.
]

{
	#category : #'tests - return',
	#timestamp : ' 8/31/2017 05:26:31'
}
ReflectivityReificationTest>>testReifyReturnValue [
	| returnNode instance |
	returnNode := (ReflectivityExamples>>#exampleAssignment) ast body statements last.
	link := MetaLink new 
		metaObject: self; 
		selector: #tagExec:;
		arguments: #(value).
	returnNode link: link.
	self assert: returnNode hasMetalink.
	self assert: (tag isNil).
	instance := ReflectivityExamples new .
	self assert: (instance exampleAssignment = 3).
	self assert: (tag = 3).
]

{
	#category : #'tests - sends',
	#timestamp : ' 8/31/2017 05:26:31'
}
ReflectivityReificationTest>>testReifySendAll [
	| sendNode instance|
	sendNode := (ReflectivityExamples>>#exampleMethod) ast body statements first value.
	link := MetaLink new 
		metaObject: #receiver; 
		selector: #perform:withArguments:;
		arguments: #(selector arguments).
	sendNode link: link.
	self assert: sendNode hasMetalink.
	self assert: (ReflectivityExamples>>#exampleMethod) class = ReflectiveMethod.
	instance := ReflectivityExamples new .
	self assert: (instance exampleMethod = 5).

]

{
	#category : #'tests - sends',
	#timestamp : ' 8/31/2017 05:26:31'
}
ReflectivityReificationTest>>testReifySendArgsAsArray [
	| sendNode instance|
	sendNode := (ReflectivityExamples>>#exampleMethod) ast body statements first value.
	link := MetaLink new 
		metaObject: self; 
		selector: #tagExec:;
		arguments: #(selector context);
		options: #(argsAsArray).
	sendNode link: link.
	self assert: sendNode hasMetalink.
	self assert: (ReflectivityExamples>>#exampleMethod) class = ReflectiveMethod.
	self assert: (tag isNil).
	instance := ReflectivityExamples new .
	self assert: (instance exampleMethod = 5).
	self assert: (tag isArray).
	self assert: (tag first == #+).
	self assert: (tag second class == Context).
	
]

{
	#category : #'tests - sends',
	#timestamp : ' 8/31/2017 05:26:31'
}
ReflectivityReificationTest>>testReifySendArguments [
	| sendNode instance|
	sendNode := (ReflectivityExamples>>#exampleMethod) ast body statements first value.
	link := MetaLink new 
		metaObject: self; 
		selector: #tagExec:;
		arguments: #(arguments).
	sendNode link: link.
	self assert: sendNode hasMetalink.
	self assert: (ReflectivityExamples>>#exampleMethod) class = ReflectiveMethod.
	self assert: (tag isNil).
	instance := ReflectivityExamples new .
	self assert: (instance exampleMethod = 5).
	self assert: (tag = #(3)).

]

{
	#category : #'tests - sends',
	#timestamp : ' 8/31/2017 05:26:31'
}
ReflectivityReificationTest>>testReifySendArguments2 [
	| sendNode instance|
	sendNode := (ReflectivityExamples>>#exampleSendTwoArgs) ast body statements first value.
	link := MetaLink new 
		metaObject: self; 
		selector: #tagExec:;
		arguments: #(arguments).
	sendNode link: link.
	self assert: sendNode hasMetalink.
	self assert: (ReflectivityExamples>>#exampleSendTwoArgs) class = ReflectiveMethod.
	self assert: (tag isNil).
	instance := ReflectivityExamples new .
	self assert: (instance exampleSendTwoArgs = #(1 2)).
	self assert: (tag = #(1 2)).

]

{
	#category : #'tests - sends',
	#timestamp : ' 8/31/2017 05:26:31'
}
ReflectivityReificationTest>>testReifySendReceiver [
	| sendNode instance|
	sendNode := (ReflectivityExamples>>#exampleMethod) ast body statements first value.
	link := MetaLink new 
		metaObject: self; 
		selector: #tagExec:;
		arguments: #(receiver).
	sendNode link: link.
	self assert: sendNode hasMetalink.
	self assert: (ReflectivityExamples>>#exampleMethod) class = ReflectiveMethod.
	self assert: (tag isNil).
	instance := ReflectivityExamples new .
	self assert: (instance exampleMethod = 5).
	self assert: (tag = 2).

]

{
	#category : #'tests - sends',
	#timestamp : ' 8/31/2017 05:26:31'
}
ReflectivityReificationTest>>testReifySendSelector [
	| sendNode instance|
	sendNode := (ReflectivityExamples>>#exampleMethod) ast body statements first value.
	link := MetaLink new 
		metaObject: self; 
		selector: #tagExec:;
		arguments: #(selector).
	sendNode link: link.
	self assert: sendNode hasMetalink.
	self assert: (ReflectivityExamples>>#exampleMethod) class = ReflectiveMethod.
	self assert: (tag isNil).
	instance := ReflectivityExamples new .
	self assert: (instance exampleMethod = 5).
	self assert: (tag = #+).
]

{
	#category : #'tests - sends',
	#timestamp : ' 8/31/2017 05:26:31'
}
ReflectivityReificationTest>>testReifySendThisContext [
	| sendNode instance|
	sendNode := (ReflectivityExamples>>#exampleMethod) ast body statements first value.
	link := MetaLink new 
		metaObject: self; 
		selector: #tagExec:;
		arguments: #(context).
	sendNode link: link.
	self assert: sendNode hasMetalink.
	self assert: (ReflectivityExamples>>#exampleMethod) class = ReflectiveMethod.
	self assert: (tag isNil).
	instance := ReflectivityExamples new .
	self assert: (instance exampleMethod = 5).
	self assert: (tag class = Context).
]

{
	#category : #'tests - sends',
	#timestamp : ' 8/31/2017 05:26:31'
}
ReflectivityReificationTest>>testReifySendValue [
	| sendNode instance|
	sendNode := (ReflectivityExamples>>#exampleMethod) ast body statements first value.
	link := MetaLink new 
		metaObject: self; 
		selector: #tagExec:;
		control: #after;
		option: #(+ optionWeakAfter);
		arguments: #(value).
	sendNode link: link.
	self assert: sendNode hasMetalink.
	self assert: (ReflectivityExamples>>#exampleMethod) class = ReflectiveMethod.
	self assert: (tag isNil).
	instance := ReflectivityExamples new .
	self assert: (instance exampleMethod = 5).
	self assert: (tag = 5).
]

{
	#category : #'tests - variables',
	#timestamp : ' 8/31/2017 05:26:31'
}
ReflectivityReificationTest>>testReifySlotClass [
	| iVar instance |
	iVar := ReflectivityExamples slotNamed: #ivar.
	link := MetaLink new 
		metaObject: self; 
		selector: #tagExec:;
		arguments: #(class).
	iVar link: link.
	self assert: iVar hasMetalink.
	self assert: (ReflectivityExamples >> #exampleIvarRead) class = ReflectiveMethod.
	self assert: (tag isNil).
	instance := ReflectivityExamples new.
	self assert: (instance exampleIvarRead = 33).
	self assert: (tag = ReflectivityExamples).
]

{
	#category : #'tests - variables',
	#timestamp : ' 8/31/2017 05:26:31'
}
ReflectivityReificationTest>>testReifySlotName [
	| iVar instance |
	iVar := ReflectivityExamples slotNamed: #ivar.
	link := MetaLink new 
		metaObject: self; 
		selector: #tagExec:;
		arguments: #(name).
	iVar link: link.
	self assert: iVar hasMetalink.
	self assert: (ReflectivityExamples >> #exampleIvarRead) class = ReflectiveMethod.
	self assert: (tag isNil).
	instance := ReflectivityExamples new.
	self assert: (instance exampleIvarRead = 33).
	self assert: (tag = #ivar).
]

{
	#category : #'tests - variables',
	#timestamp : ' 8/31/2017 05:26:31'
}
ReflectivityReificationTest>>testReifySlotValue [
	| iVar instance |
	iVar := ReflectivityExamples slotNamed: #ivar.
	link := MetaLink new 
		metaObject: self; 
		selector: #tagExec:;
		arguments: #(value).
	iVar link: link.
	self assert: iVar hasMetalink.
	self assert: (ReflectivityExamples >> #exampleIvarRead) class = ReflectiveMethod.
	self assert: (tag isNil).
	instance := ReflectivityExamples new.
	self assert: (instance exampleIvarRead = 33).
	self assert: (tag = 33).
]

{
	#category : #'tests - variables',
	#timestamp : ' 8/31/2017 05:26:31'
}
ReflectivityReificationTest>>testReifySlotVariable [
	| iVar instance |
	iVar := ReflectivityExamples slotNamed: #ivar.
	link := MetaLink new 
		metaObject: self; 
		selector: #tagExec:;
		arguments: #(variable).
	iVar link: link.
	self assert: iVar hasMetalink.
	self assert: (ReflectivityExamples >> #exampleIvarRead) class = ReflectiveMethod.
	self assert: (tag isNil).
	instance := ReflectivityExamples new.
	self assert: (instance exampleIvarRead = 33).
	self assert: (tag = iVar).
]

{
	#category : #'tests - variablenodes',
	#timestamp : ' 8/31/2017 05:26:31'
}
ReflectivityReificationTest>>testReifyTempName [
	| varNode instance |
	varNode := (ReflectivityExamples>>#exampleAssignment) ast body statements first variable.
	link := MetaLink new 
		metaObject: self; 
		selector: #tagExec:;
		arguments: #(name).
	varNode link: link.
	self assert: varNode hasMetalink.
	self assert: (tag isNil).
	instance := ReflectivityExamples new .
	self assert: (instance exampleAssignment = 3).
	self assert: (tag ='temp').
]

{
	#category : #'tests - variablenodes',
	#timestamp : ' 8/31/2017 05:26:31'
}
ReflectivityReificationTest>>testReifyTempNewValue [
	| varNode instance|
	varNode := (ReflectivityExamples>>#exampleAssignment) ast body statements first variable.
	link := MetaLink new 
		metaObject: self; 
		selector: #tagExec:;
		arguments: #(newValue).
	varNode link: link.
	self assert: varNode hasMetalink.
	self assert: (tag isNil).
	instance := ReflectivityExamples new .
	self assert: (instance exampleAssignment = 3).
	self assert: (tag = 3).
]

{
	#category : #'tests - variablenodes',
	#timestamp : ' 8/31/2017 05:26:31'
}
ReflectivityReificationTest>>testReifyTempValue [
	| varNode instance |
	varNode := (ReflectivityExamples>>#exampleAssignment) ast body statements last value.
	link := MetaLink new 
		metaObject: self; 
		selector: #tagExec:;
		arguments: #(value).
	varNode link: link.
	self assert: varNode hasMetalink.
	self assert: (tag isNil).
	instance := ReflectivityExamples new .
	self assert: (instance exampleAssignment = 3).
	self assert: (tag = 3).
]
