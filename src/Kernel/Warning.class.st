"
A Warning is a Notification which by default should be brought to the attention of the user.
"
Class {
	#name : #Warning,
	#superclass : #Notification,
	#category : #Kernel-Exceptions,
	#timestamp : '<historical>'
}

{
	#category : #exceptionDescription,
	#timestamp : ' 8/31/2017 07:16:33'
}
Warning>>defaultAction [
	
	UIManager default warningDefaultAction: self
]
