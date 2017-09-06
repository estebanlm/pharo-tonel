"
SUnit tests for pluggable sets
"
Class {
	#name : #PluggableSetTest,
	#superclass : #SetTest,
	#category : #Collections-Tests-Unordered,
	#timestamp : 'TorstenBergmann 2/20/2014 15:28'
}

{
	#category : #'building suites',
	#timestamp : ' 8/31/2017 05:26:28'
}
PluggableSetTest class>>classToBeTested [

^ IdentitySet
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
PluggableSetTest>>classToBeTested [

	^ PluggableSet
]
