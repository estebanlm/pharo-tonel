"
I am the start of a literal array, normal literal arrays
#() or byte arrays #[].

"
Class {
	#name : #RBLiteralArrayToken,
	#superclass : #RBValueToken,
	#category : #AST-Core-Tokens,
	#timestamp : 'NicolaiHess 8/22/2016 15:47'
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBLiteralArrayToken>>isForByteArray [
	^value last = $[
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBLiteralArrayToken>>isLiteralArrayToken [
	^true
]
