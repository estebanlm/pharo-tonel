Extension {
	#name : #Class
}

{
	#category : #'*System-Changes',
	#timestamp : ' 8/31/2017 07:17:01'
}
Class>>removeFromChanges [
	"References to the receiver, a class, and its metaclass should no longer be included in the system ChangeSet."

	ChangeSet current removeClassAndMetaClassChanges: self
]
