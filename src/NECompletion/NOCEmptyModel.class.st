"
I implement a null object pattern related to NOCModel in order to mark the end of possible completions in the answer list. 


"
Class {
	#name : #NOCEmptyModel,
	#superclass : #Object,
	#category : #NECompletion-OCompletion,
	#timestamp : '<historical>'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
NOCEmptyModel>>entries [
	^ Array new
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
NOCEmptyModel>>entryCount  [
	^ 0
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
NOCEmptyModel>>narrowString: string [

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
NOCEmptyModel>>narrowWith: string  [

]
