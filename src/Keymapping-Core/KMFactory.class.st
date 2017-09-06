"
I am a class used to access some of the main classes of Keymapping. See my class side to have an idea of what can I give you.
"
Class {
	#name : #KMFactory,
	#superclass : #Object,
	#category : #Keymapping-Core,
	#timestamp : 'GuillermoPolito 2/24/2011 23:43'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMFactory class>>keymapContainer [
	^ KMRepository default
]
