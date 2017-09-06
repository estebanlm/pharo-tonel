"
In addition to my superclass, I provide an API to execute the #step method every #stepTime.
"
Class {
	#name : #TickingWindowModel,
	#superclass : #WindowModel,
	#category : #Spec-Core-Support,
	#timestamp : 'StephaneDucasse 3/7/2014 10:45'
}

{
	#category : #specs,
	#timestamp : ' 8/31/2017 05:26:18'
}
TickingWindowModel class>>adapterName [

	^ #TickingWindowAdapter
]

{
	#category : #specs,
	#timestamp : ' 8/31/2017 05:26:18'
}
TickingWindowModel class>>defaultSpec [
	<spec>
	
	^ #(TickingWindowAdapter
		adapt: #(model))
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:18'
}
TickingWindowModel>>step [
	self model step.
]

{
	#category : #stepping,
	#timestamp : ' 8/31/2017 05:26:18'
}
TickingWindowModel>>stepTime [
	^ self model stepTime
]
