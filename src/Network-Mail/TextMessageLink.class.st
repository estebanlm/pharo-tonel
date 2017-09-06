"
A link to a hidden mail message.  Clicking on it allows the message to be viewed or saved to disk.
"
Class {
	#name : #TextMessageLink,
	#superclass : #TextAttribute,
	#instVars : [
		'message'
	],
	#category : #Network-Mail,
	#timestamp : '<historical>'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:23'
}
TextMessageLink class>>message: aMessage [
	^self new initialize: aMessage
]

{
	#category : #appearance,
	#timestamp : ' 8/31/2017 05:26:23'
}
TextMessageLink>>emphasizeScanner: scanner [
	scanner textColor: Color brown
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:23'
}
TextMessageLink>>initialize: message0 [
	message := message0
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:23'
}
TextMessageLink>>message [
	^message
]
