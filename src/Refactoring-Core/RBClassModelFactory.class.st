"
None of the classes inside this package should be directly accessed. They should be accessed via myself. I'm a class factory. 

I'm an important design point: I will let future evolution of the system to be experimented without the needs to change all the users. Then once the experiments and a good solution is found it may be the time to remove me and to think that I'm an overengineered solution. Right now I'm a change enabler. For example people can try to use Ring models to model RBmodel. 
"
Class {
	#name : #RBClassModelFactory,
	#superclass : #Object,
	#classVars : [
		'RBclass',
		'RBmetaclass',
		'RBmethod',
		'RBnamespace'
	],
	#category : #Refactoring-Core-Model,
	#timestamp : 'StephaneDucasse 9/8/2016 09:58'
}

{
	#category : #'factory access',
	#timestamp : ' 8/31/2017 05:26:24'
}
RBClassModelFactory class>>rbClass [
 
	^ RBclass ifNil: [ RBclass := RBClass ]
]

{
	#category : #'factory access',
	#timestamp : ' 8/31/2017 05:26:24'
}
RBClassModelFactory class>>rbMetaclass [
 
	^ RBmetaclass ifNil: [ RBmetaclass := RBMetaclass ]
]

{
	#category : #'factory access',
	#timestamp : ' 8/31/2017 05:26:24'
}
RBClassModelFactory class>>rbMethod [
 
	^ RBmethod ifNil: [ RBmethod := RBMethod ]
]

{
	#category : #'factory access',
	#timestamp : ' 8/31/2017 05:26:24'
}
RBClassModelFactory class>>rbNamespace [
 
	^ RBnamespace ifNil: [ RBnamespace := RBNamespace ]
]

{
	#category : #'factory customisation',
	#timestamp : ' 8/31/2017 05:26:24'
}
RBClassModelFactory class>>setRBClass: aClass [

	RBclass := aClass
]

{
	#category : #'factory customisation',
	#timestamp : ' 8/31/2017 05:26:24'
}
RBClassModelFactory class>>setRBMetaclass: aClass [

	RBmetaclass := aClass
]

{
	#category : #'factory customisation',
	#timestamp : ' 8/31/2017 05:26:24'
}
RBClassModelFactory class>>setRBMethod: aClass [

	RBmethod := aClass
]

{
	#category : #'factory customisation',
	#timestamp : ' 8/31/2017 05:26:24'
}
RBClassModelFactory class>>setRBNamespace: aClass [
 
	RBnamespace := aClass
]
