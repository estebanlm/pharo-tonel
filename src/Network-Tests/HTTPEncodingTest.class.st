"
SUnit tests for HTTPEncoding
"
Class {
	#name : #HTTPEncodingTest,
	#superclass : #TestCase,
	#category : #Network-Tests-Protocols,
	#timestamp : 'TorstenBergmann 2/5/2014 10:13'
}

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:29'
}
HTTPEncodingTest>>testEncodeForHTTP [

	self assert: 'aa aa éé aa aa' urlEncoded = 'aa%20aa%20%C3%A9%C3%A9%20aa%20aa'
]
