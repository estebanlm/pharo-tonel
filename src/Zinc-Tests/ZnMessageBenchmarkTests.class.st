"

"
Class {
	#name : #ZnMessageBenchmarkTests,
	#superclass : #TestCase,
	#category : #Zinc-Tests,
	#timestamp : ''
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:47'
}
ZnMessageBenchmarkTests>>testRequests [
	ZnMessageBenchmark requests do: [ :each |
		| bench |
		bench := ZnMessageBenchmark new.
		bench perform: each.
		self assert: (bench message isKindOf: ZnRequest).
		bench writeRepresentation.
		self assert: (bench read isKindOf: ZnRequest).
		self assert: bench read equals: bench message ]
		
	
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:47'
}
ZnMessageBenchmarkTests>>testResponses [
	ZnMessageBenchmark responses do: [ :each |
		| bench |
		bench := ZnMessageBenchmark new.
		bench perform: each.
		self assert: (bench message isKindOf: ZnResponse).
		bench writeRepresentation.
		self assert: (bench read isKindOf: ZnResponse).
		self assert: bench read equals: bench message ]
		
	
]
