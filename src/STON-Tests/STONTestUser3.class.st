"
STONTestUser3 extends STONTestUser but wants nil instance variables to be written
"
Class {
	#name : #STONTestUser3,
	#superclass : #STONTestUser,
	#category : #STON-Tests,
	#timestamp : '<historical>'
}

{
	#category : #ston-core,
	#timestamp : ' 8/31/2017 05:26:46'
}
STONTestUser3 class>>stonAllInstVarNames [
	^ #(username password enabled)
]

{
	#category : #ston-core,
	#timestamp : ' 8/31/2017 05:26:46'
}
STONTestUser3 class>>stonName [
	^ 'TestUser3'
]

{
	#category : #ston-core,
	#timestamp : ' 8/31/2017 05:26:46'
}
STONTestUser3>>stonShouldWriteNilInstVars [
	^ true
]
