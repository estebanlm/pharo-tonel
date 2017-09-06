"
My hierarchy is used to render a Hiedra ruler.
"
Class {
	#name : #HiRenderingElement,
	#superclass : #Object,
	#category : #Hiedra-Rendering,
	#timestamp : 'MartinDias 3/18/2016 21:21'
}

{
	#category : #controlling,
	#timestamp : ' 8/31/2017 05:26:27'
}
HiRenderingElement>>ifNode: nodeBlock ifLink: linkBlock [

	^ self subclassResponsibility
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:27'
}
HiRenderingElement>>isLink [

	^ self subclassResponsibility
]
