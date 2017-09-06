"
I define a temp that I can store into
"
Class {
	#name : #RFStorePopIntoTempNode,
	#superclass : #RBVariableNode,
	#category : #Reflectivity-Compiler,
	#timestamp : 'MarcusDenker 6/17/2015 10:25'
}

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:26'
}
RFStorePopIntoTempNode>>acceptVisitor: aProgramNodeVisitor [
	^ aProgramNodeVisitor visitStorePopIntoTempNode: self
]
