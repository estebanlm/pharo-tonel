"
I keep the context of the ocompletion. 
I do the same as my parent but for this specific algorithm
"
Class {
	#name : #NOCContext,
	#superclass : #NECContext,
	#category : #NECompletion-OCompletion,
	#timestamp : '<historical>'
}

{
	#category : #'model creation',
	#timestamp : ' 8/31/2017 05:26:21'
}
NOCContext>>createModel [
	| aModel |
	
	aModel := NOCModel
		class: theClass
		temporaries: self temporaries
		additionals: controller additionals
		variables: variables
		selectors: selectors.
	aModel
		context: self.
		
	^ aModel 
]

{
	#category : #'model creation',
	#timestamp : ' 8/31/2017 05:26:21'
}
NOCContext>>nextModel  [
	"Provide a next lookup model. 
	 It is defining a chain of responsibility, translating the model to eCompletion, to ensure having results"
	^ super createModel
]
