"
Like a Bag, except that items are compared with #== instead of #= .

See the comment of IdentitySet for more information.

"
Class {
	#name : #IdentityBag,
	#superclass : #Bag,
	#category : #Collections-Unordered,
	#timestamp : '<historical>'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:17:00'
}
IdentityBag class>>contentsClass [
	^IdentityDictionary
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 07:17:00'
}
IdentityBag>>asSet [
	^contents keys asIdentitySet
]
