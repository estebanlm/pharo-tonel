"

"
Class {
	#name : #Slice,
	#superclass : #KomitableObject,
	#category : #Komitter-Models,
	#timestamp : ''
}

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:22'
}
Slice>>commitOn: aSubmitter [

	aSubmitter commitSlice: self
]
