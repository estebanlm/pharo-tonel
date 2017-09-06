"

"
Class {
	#name : #RBSubclassOfClassToRename,
	#superclass : #RBClassToRename,
	#instVars : [
		'rewriteRule1'
	],
	#category : #Refactoring-Tests-Core-Data,
	#timestamp : ''
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:31'
}
RBSubclassOfClassToRename>>calls [
	^self rewriteRule1: self name , self rewriteRule1
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:31'
}
RBSubclassOfClassToRename>>calls1 [
	^self rewriteRule1: (self rewriteRule1: self calls)
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:31'
}
RBSubclassOfClassToRename>>name [
	^rewriteRule1
]

{
	#category : #performing,
	#timestamp : ' 8/31/2017 05:26:31'
}
RBSubclassOfClassToRename>>reference [
	^ RBClassToRename new
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:31'
}
RBSubclassOfClassToRename>>rewriteRule1 [
	^rewriteRule1
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:31'
}
RBSubclassOfClassToRename>>rewriteRule1: anObject [
	^rewriteRule1 := anObject
]

{
	#category : #performing,
	#timestamp : ' 8/31/2017 05:26:31'
}
RBSubclassOfClassToRename>>symbolReference [
	^ #RBClassToRename
]
