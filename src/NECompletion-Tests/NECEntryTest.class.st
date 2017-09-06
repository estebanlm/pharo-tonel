"

"
Class {
	#name : #NECEntryTest,
	#superclass : #TestCase,
	#category : #NECompletion-Tests,
	#timestamp : ''
}

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:44'
}
NECEntryTest>>testCompletion [
	| entry |
	entry := NECSelectorEntry 
		contents: 'makeItHappen'
		type: #unary:.
	self assert: entry completion = #makeItHappen
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:44'
}
NECEntryTest>>testInstance [
	| entry |
	entry := NECInstVarEntry contents: 'abc'.
	self assert: entry isInstance
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:44'
}
NECEntryTest>>testLocal [
	| entry |
	entry := NECLocalEntry 
		contents: 'abc'
		type: #patternArg:.
	self assert: entry contents = 'abc'.
	self assert: entry type = #patternArg:.
	self assert: entry isLocal
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:44'
}
NECEntryTest>>testPrintOn [
	| entry |
	entry := NECSelectorEntry 
		contents: 'compute'
		type: #unary:.
	self assert: 'NECSelectorEntry(compute,unary:)' = entry printString
]
