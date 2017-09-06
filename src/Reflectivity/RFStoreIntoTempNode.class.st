"
I define a temp that I can store into
"
Class {
	#name : #RFStoreIntoTempNode,
	#superclass : #RBVariableNode,
	#category : #Reflectivity-Compiler,
	#timestamp : 'MarcusDenker 6/17/2015 15:01'
}

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:26'
}
RFStoreIntoTempNode>>acceptVisitor: aProgramNodeVisitor [
	^ aProgramNodeVisitor visitStoreIntoTempNode: self
]
