Extension {
	#name : #Matrix
}

{
	#category : #'*Random-Core',
	#timestamp : ' 8/31/2017 07:16:42'
}
Matrix>>atRandom [
	"Return the contents of the receiver in a random order."
	^ contents atRandom

]

{
	#category : #'*Random-Core',
	#timestamp : ' 8/31/2017 07:16:42'
}
Matrix>>atRandom: aGenerator [
	^ contents atRandom: aGenerator
]
