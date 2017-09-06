"
This trait contains the necessary methods to manipulate correctly a RubScrolledTextMorph via a model.
Should be use in the model class of the architecture. 

The interactionModel can represents your model or a model of the higher level (AbstractNautilusUI for the text area of Nautilus for example).

"
Trait {
	#name : #TViewModel,
	#traits : '{}',
	#classTraits : '{}',
	#category : #Rubric-Editing-Core-Support,
	#timestamp : 'FranckWarlouzet 6/29/2015 10:15'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
TViewModel>>announcer [
	"Define #announcer if needed"
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
TViewModel>>interactionModel [
	^ self
]
