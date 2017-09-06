"

"
Class {
	#name : #TemporaryVariableTest,
	#superclass : #TestCase,
	#category : #Slot-Tests,
	#timestamp : ''
}

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
TemporaryVariableTest>>testHasTemporaryVariablesBlock [
	| block |
	block := [ | b | b := 2. b +2  ].
	self assert: (block hasTemporaryVariableNamed: #b).
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
TemporaryVariableTest>>testHasTemporaryVariablesMethod [
	| method |
	method := self class >> #testTemporaryVariablesMethod.
	self assert: (method hasTemporaryVariableNamed: #method).
]

{
	#category : #properties,
	#timestamp : ' 8/31/2017 05:26:46'
}
TemporaryVariableTest>>testPropertyAtPut [

	| testValue temp |
	
	testValue := Date today.
	temp := thisContext temporaryVariableNamed:  #testValue.
	
	temp propertyAt: #testKeySelector put: testValue.
	self
		assert: (temp propertyAt: #testKeySelector)
		equals: testValue.
		
	temp removeProperty: #testKeySelector.
	self assert: temp properties isNil.
]

{
	#category : #properties,
	#timestamp : ' 8/31/2017 05:26:46'
}
TemporaryVariableTest>>testPropertyAtPutPersistent [

	| testValue temp temp2 |
	testValue := Date today.
	temp := thisContext method temporaryVariableNamed: #temp.
	
	temp propertyAt: #testKeySelector put: testValue.
	self
		assert: (temp propertyAt: #testKeySelector)
		equals: testValue.
		
	temp2 := thisContext method temporaryVariableNamed: #temp.
	
	self
		assert: (temp2 propertyAt: #testKeySelector)
		equals: testValue.
		
	self assert: temp2 == temp.
	self deny: thisContext method savedTemps isNil.	
	temp removeProperty: #testKeySelector.
	self assert: temp properties isNil.
	
	self assert: thisContext method savedTemps isNil.
]

{
	#category : #properties,
	#timestamp : ' 8/31/2017 05:26:46'
}
TemporaryVariableTest>>testPropertyBlockPersistent [

	| testValue temp temp2 block |
	testValue := Date today.
	block := [ |t| t:=2].
	temp := block temporaryVariableNamed: #t.
	
	temp propertyAt: #testKeySelector put: testValue.
	self
		assert: (temp propertyAt: #testKeySelector)
		equals: testValue.
		
	temp2 := block temporaryVariableNamed: #t.
	
	self
		assert: (temp2 propertyAt: #testKeySelector)
		equals: testValue.
		
	self assert: temp2 == temp.
	self deny: block method savedTemps isNil.	
	temp removeProperty: #testKeySelector.
	self assert: temp properties isNil.
	
	self assert: block method savedTemps isNil.
]

{
	#category : #properties,
	#timestamp : ' 8/31/2017 05:26:46'
}
TemporaryVariableTest>>testPropertyContextPersistent [

	| testValue temp temp2 |
	testValue := Date today.
	temp := thisContext temporaryVariableNamed: #temp.
	
	temp propertyAt: #testKeySelector put: testValue.
	self
		assert: (temp propertyAt: #testKeySelector)
		equals: testValue.
		
	temp2 := thisContext temporaryVariableNamed: #temp.
	
	self
		assert: (temp2 propertyAt: #testKeySelector)
		equals: testValue.
		
	self assert: temp2 == temp.
	self deny: thisContext method savedTemps isNil.	
	temp removeProperty: #testKeySelector.
	self assert: temp properties isNil.
	
	self assert: thisContext method savedTemps isNil.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
TemporaryVariableTest>>testReadTemporaryVariablesMethod [
	| tempVar |
	tempVar := thisContext temporaryVariableNamed: #tempVar.

	self assert: (tempVar readInContext: thisContext) class = TemporaryVariable.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
TemporaryVariableTest>>testTemporaryVariablesBlock [
	| block |
	block := [ | b | b +2  ].
	self assert: block temporaryVariables first name = #b.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
TemporaryVariableTest>>testTemporaryVariablesMethod [
	| method |
	method := self class >> #testTemporaryVariablesMethod.
	self assert: method temporaryVariables first name = #method.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
TemporaryVariableTest>>testWriteTemporaryVariablesMethod [
	| tempVar |
	tempVar := thisContext temporaryVariableNamed: #tempVar.

	tempVar write: 5 InContext: thisContext.
	self assert: tempVar = 5.
]
