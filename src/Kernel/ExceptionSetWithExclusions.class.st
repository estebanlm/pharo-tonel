"
I am ExceptionSetWithExclusions, an ExceptionSet that explicitely does not handle a number of exclusion Exceptions.
"
Class {
	#name : #ExceptionSetWithExclusions,
	#superclass : #ExceptionSet,
	#instVars : [
		'exclusions'
	],
	#category : #Kernel-Exceptions,
	#timestamp : '<historical>'
}

{
	#category : #exceptionselector,
	#timestamp : ' 8/31/2017 07:16:33'
}
ExceptionSetWithExclusions>>- exception [
	"Add exception as an exclusion to me.
	I will explicitely not handle my exclusion exceptions."
	
	self addExclusion: exception
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:33'
}
ExceptionSetWithExclusions>>addExclusion: exception [
	"Add exception as an exclusion to me.
	I will explicitely not handle my exclusion exceptions."
	
	^ exclusions add: exception
]

{
	#category : #exceptionselector,
	#timestamp : ' 8/31/2017 07:16:33'
}
ExceptionSetWithExclusions>>handles: exception [
	"Return true when I will handled exception.
	I extend my superclass behavior by explicitely 
	not handling a number of exclusion exceptions."

	^ (super handles: exception) 
			and: [ exclusions noneSatisfy: [ :each | each handles: exception ] ]
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:16:33'
}
ExceptionSetWithExclusions>>initialize [

	super initialize.
	exclusions := OrderedCollection new
]
