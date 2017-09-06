"
This is an action that is supposed to work in any context (e.g., Morphic or Seaside)
"
Class {
	#name : #GLMGenericAction,
	#superclass : #GLMAction,
	#category : #Glamour-Core,
	#timestamp : '<historical>'
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMGenericAction>>worksWithMorphic [
	^ true
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMGenericAction>>worksWithSeaside [
	^ true
]
