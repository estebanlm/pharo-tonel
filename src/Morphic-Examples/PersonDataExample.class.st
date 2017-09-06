"
Data object for a grid example
"
Class {
	#name : #PersonDataExample,
	#superclass : #Object,
	#instVars : [
		'firstName',
		'secondName',
		'age',
		'married'
	],
	#category : #Morphic-Examples-MorphTreeWidget,
	#timestamp : 'TorstenBergmann 2/3/2014 23:52'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:14'
}
PersonDataExample class>>firstName: fname secondName: sname age: age married: married [
	^ (self new) firstName: fname; secondName: sname; age: age; married: married; yourself
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
PersonDataExample>>age [
	"Answer the value of age"

	^ age
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
PersonDataExample>>age: anObject [
	"Set the value of age"

	age := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
PersonDataExample>>firstName [
	"Answer the value of firstName"

	^ firstName
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
PersonDataExample>>firstName: anObject [
	"Set the value of firstName"

	firstName := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
PersonDataExample>>married [
	"Answer the value of married"

	^ married
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
PersonDataExample>>married: anObject [
	"Set the value of married"

	married := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
PersonDataExample>>secondName [
	"Answer the value of secondName"

	^ secondName
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
PersonDataExample>>secondName: anObject [
	"Set the value of secondName"

	secondName := anObject
]
