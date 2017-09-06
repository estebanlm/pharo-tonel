"
Notify that no changes have to be merged
"
Class {
	#name : #MCNoChangesException,
	#superclass : #Exception,
	#category : #Monticello-Versioning,
	#timestamp : 'TorstenBergmann 2/5/2014 13:53'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCNoChangesException>>defaultAction [
	self inform: 'No changes'
]
