"
I am a representation of a commit.

I am abstracted from Monticello to be able to be reused with other frameworks
"
Class {
	#name : #Komit,
	#superclass : #KomitableObject,
	#category : #Komitter-Models,
	#timestamp : '<historical>'
}

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:22'
}
Komit>>commitOn: aSubmitter [

	aSubmitter commitKomit: self
]
