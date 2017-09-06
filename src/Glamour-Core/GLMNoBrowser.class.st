"
A NoBrowser is a browser without behavior and that does not require a container pane. The root pane is always placed in a NoBrowser.
Given that it has no behavior, a NoBrowser is a singleton to avoid multiple unnecessary instances.
"
Class {
	#name : #GLMNoBrowser,
	#superclass : #GLMLoggedObject,
	#classInstVars : [
		'uniqueInstance'
	],
	#category : #Glamour-Core,
	#timestamp : 'TudorGirba 2/4/2011 20:22'
}

{
	#category : #'class initialization',
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMNoBrowser class>>initialize [

	self initializeUniqueInstance
]

{
	#category : #'class initialization',
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMNoBrowser class>>initializeUniqueInstance [

	uniqueInstance := self basicNew initialize
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMNoBrowser class>>new [

	^self uniqueInstance
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMNoBrowser class>>uniqueInstance [

	^uniqueInstance
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMNoBrowser>>innerPortEvent: aPortEvent  [
	"Needed for simulating a browser"
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMNoBrowser>>lastActivePresentation: aPresentation [

]
