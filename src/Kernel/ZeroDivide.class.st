"
I am ZeroDivide, an ArithmeticError that may be signaled when a mathematical division by 0 is attempted.
"
Class {
	#name : #ZeroDivide,
	#superclass : #ArithmeticError,
	#instVars : [
		'dividend'
	],
	#category : #Kernel-Exceptions,
	#timestamp : 'SvenVanCaekenberghe 4/21/2011 12:36'
}

{
	#category : #exceptioninstantiator,
	#timestamp : ' 8/31/2017 07:16:33'
}
ZeroDivide class>>dividend: argument [
	^self new dividend: argument; yourself
]

{
	#category : #signaling,
	#timestamp : ' 8/31/2017 07:16:33'
}
ZeroDivide class>>signalWithDividend: aDividend [

	^(self dividend: aDividend) signal
]

{
	#category : #exceptiondescription,
	#timestamp : ' 8/31/2017 07:16:33'
}
ZeroDivide>>dividend [
	"Answer the number that was being divided by zero."

	^dividend
]

{
	#category : #exceptionbuilder,
	#timestamp : ' 8/31/2017 07:16:33'
}
ZeroDivide>>dividend: argument [
	"Specify the number that was being divided by zero."

	dividend := argument
]

{
	#category : #exceptiondescription,
	#timestamp : ' 8/31/2017 07:16:33'
}
ZeroDivide>>isResumable [
	"Determine whether an exception is resumable."

	^true
]
