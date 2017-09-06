"

"
Class {
	#name : #GLMLoggerTest,
	#superclass : #TestCase,
	#category : #Glamour-Tests-Core,
	#timestamp : ''
}

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMLoggerTest>>testCustomInstance [
	| memoryLogger |
	self assert: GLMLogger instance == GLMLogger nullInstance.
	memoryLogger := GLMMemoryLogger new.
	GLMLogger instance: memoryLogger.
	self assert: GLMLogger instance == memoryLogger.
	GLMLogger reset.
	self assert: GLMLogger instance == GLMLogger nullInstance
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMLoggerTest>>testDefault [
	(GLMLoggedObject withAllSubclasses 
		reject: [:each | 
			each allMethods anySatisfy: [ :cm | cm sendsSelector: #subclassResponsibility ] ])
		do: [ :each |
			self assert: each new logger == GLMLogger nullInstance ]
]
