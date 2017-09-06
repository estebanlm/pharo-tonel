Extension {
	#name : #RBAssignmentNode
}

{
	#category : #'*Reflectivity-Examples',
	#timestamp : ' 8/31/2017 05:26:45'
}
RBAssignmentNode>>tagType: anObject [
	"record the type of the assigned value"
	variable propertyAt: #types ifAbsentPut: Set new.
	(variable propertyAt: #types) add: anObject class.
]
