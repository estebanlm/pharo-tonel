"
A GoferPackageReference refers to the latest version of a Monticello package.
"
Class {
	#name : #GoferPackageReference,
	#superclass : #GoferReference,
	#category : #Gofer-Core,
	#timestamp : 'lr 12/9/2009 22:47'
}

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:48'
}
GoferPackageReference>>matches: aResolvedReference [
	^ self packageName = aResolvedReference packageName
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:48'
}
GoferPackageReference>>packageName [
	^ name
]
