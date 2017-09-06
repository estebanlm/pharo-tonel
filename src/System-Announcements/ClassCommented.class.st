"
This announcement will be emitted when a class or a trait comment changes
"
Class {
	#name : #ClassCommented,
	#superclass : #ClassAnnouncement,
	#instVars : [
		'newStamp',
		'newComment',
		'classCommented',
		'oldComment',
		'oldStamp'
	],
	#category : #System-Announcements-System-Classes,
	#timestamp : '<historical>'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:17:00'
}
ClassCommented class>>class: aClass oldComment: oldComment newComment: newComment oldStamp: oldStamp newStamp: newStamp [
	^self new
			classCommented: aClass;
			oldComment: oldComment;
			oldStamp: oldStamp;
			newComment: newComment;
			newStamp: newStamp;
			yourself
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:17:00'
}
ClassCommented class>>classCommented: aClass [
	self flag: #fixMePlease. "nils? no way! "
	^self class: aClass oldComment: nil newComment: nil oldStamp: nil newStamp: nil
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:00'
}
ClassCommented>>classAffected [
	^self classCommented
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:00'
}
ClassCommented>>classCommented [
	^classCommented
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:00'
}
ClassCommented>>classCommented: aClass [
	classCommented := aClass
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:00'
}
ClassCommented>>newComment [
	^newComment
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:00'
}
ClassCommented>>newComment: aNewComment [
	newComment := aNewComment
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:00'
}
ClassCommented>>newStamp [
	^newStamp
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:00'
}
ClassCommented>>newStamp: aNewStamp [
	newStamp := aNewStamp
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:00'
}
ClassCommented>>oldComment [
	^ oldComment
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:00'
}
ClassCommented>>oldComment: andOldComment [
	oldComment := andOldComment
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:00'
}
ClassCommented>>oldStamp [
	^ oldStamp
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:00'
}
ClassCommented>>oldStamp: anOldStamp [
	oldStamp := anOldStamp
]
