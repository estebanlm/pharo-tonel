"
I am Exception used in the Weak collection tests which has a custom pass action.
Instead of using the Exception's default pass mechanism I will call a customized block.
"
Class {
	#name : #MockExceptionWithPassAction,
	#superclass : #Exception,
	#instVars : [
		'passAction'
	],
	#category : #Collections-Tests-Weak,
	#timestamp : '<historical>'
}

{
	#category : #handling,
	#timestamp : ' 8/31/2017 05:26:28'
}
MockExceptionWithPassAction>>pass [
	^ passAction cull: self
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:28'
}
MockExceptionWithPassAction>>passAction: aValuable [
	passAction := aValuable
]
