Extension {
	#name : #Integer
}

{
	#category : #'*Metacello-Core',
	#timestamp : ' 8/31/2017 07:16:49'
}
Integer>>metacelloIntegerLessThanSelf: anInteger [

	^anInteger < self
]

{
	#category : #'*Metacello-Core',
	#timestamp : ' 8/31/2017 07:16:49'
}
Integer>>metacelloSemanticIntegerLessThanSelf: anInteger [
    ^ anInteger < self
]

{
	#category : #'*Metacello-Core',
	#timestamp : ' 8/31/2017 07:16:49'
}
Integer>>metacelloSemanticStringLessThanSelf: aString [
    "string version components are always '<' integer component"

    ^ true
]

{
	#category : #'*Metacello-Core',
	#timestamp : ' 8/31/2017 07:16:49'
}
Integer>>metacelloSemanticVersionComponentLessThan: aMetacelloVersonComponent [
    ^ aMetacelloVersonComponent metacelloSemanticIntegerLessThanSelf: self
]

{
	#category : #'*Metacello-Core',
	#timestamp : ' 8/31/2017 07:16:49'
}
Integer>>metacelloStringLessThanSelf: aString [
	"string version components are always '<' integer component"
	
	^true
]

{
	#category : #'*Metacello-Core',
	#timestamp : ' 8/31/2017 07:16:49'
}
Integer>>metacelloVersionComponentLessThan: aMetacelloVersonComponent [

	^aMetacelloVersonComponent metacelloIntegerLessThanSelf: self
]
