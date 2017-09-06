"
I am example of inheritable process specific variable.
I implement isInheritable on class side to return true when I enabled (I become enable only in tests because existance of inheritable variables effect process instantiation performance)
"
Class {
	#name : #TestInheritableVariable,
	#superclass : #ProcessLocalVariable,
	#classInstVars : [
		'enabled'
	],
	#category : #Kernel-Tests-Processes,
	#timestamp : 'DenisKudryashov 5/24/2016 17:14'
}

{
	#category : #controlling,
	#timestamp : ' 8/31/2017 05:26:30'
}
TestInheritableVariable class>>disable [
	enabled := false.
	Process updateInheritableKeys
]

{
	#category : #controlling,
	#timestamp : ' 8/31/2017 05:26:30'
}
TestInheritableVariable class>>enable [
	enabled := true.
	Process updateInheritableKeys
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:30'
}
TestInheritableVariable class>>enabled [
	^enabled ifNil: [ enabled := false ]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:30'
}
TestInheritableVariable class>>isInheritable [
	^self enabled
]
