"
A Notification is an indication that something interesting has occurred.  If it is not handled, it will pass by without effect.
"
Class {
	#name : #Notification,
	#superclass : #Exception,
	#category : #Kernel-Exceptions,
	#timestamp : '<historical>'
}

{
	#category : #exceptiondescription,
	#timestamp : ' 8/31/2017 07:16:33'
}
Notification>>defaultAction [
	"No action is taken. The value nil is returned as the value of the message that signaled the exception."

	^nil
]
