"
I am an abstract class used to group a series of examples.
My subclasses should define each example within a method and annotated the method with the pragma #glmBrowser:input: 
"
Class {
	#name : #GLMExamples,
	#superclass : #Object,
	#category : #Glamour-Examples,
	#timestamp : 'AndreiChis 8/28/2014 17:00'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMExamples class>>allExamples  [
	^ Pragma allNamed: #glmBrowser:input: in: self
]

{
	#category : #opening,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMExamples class>>open [
	^ GLMExamplesBrowser new 
		title: self title;
		openOn: self
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMExamples class>>title [
	^ 'Examples'
]
