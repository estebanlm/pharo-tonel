"
I am FloatPrintPolicy.
I am a DynamicVariable.

I control whether Float instances are printed exactly or inexactly. The inexact printing is much faster, but can be less accurate. 

The default policy is ExactFloatPrintPolicy.

FloatPrintPolicy 
	value: InexactFloatPrintPolicy new 
	during: [ Float pi printString ]
"
Class {
	#name : #FloatPrintPolicy,
	#superclass : #DynamicVariable,
	#instVars : [
		'default'
	],
	#category : #Kernel-Numbers,
	#timestamp : '<historical>'
}

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:33'
}
FloatPrintPolicy class>>absPrint: float on: stream base: base [
	"I delegate Float printing to the current dynamic value of myself"

	self value absPrint: float on: stream base: base
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
FloatPrintPolicy>>default [
	^ default
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:16:33'
}
FloatPrintPolicy>>initialize [
	default := ExactFloatPrintPolicy new
]
