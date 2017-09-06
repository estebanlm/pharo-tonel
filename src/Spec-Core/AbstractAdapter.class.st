"
I am an abstract class.

I'm the superclass of all the adapters used to link a Spec widget model to a framework specific widget (by example ButtonModel <-> PluggableButtonMorph).

The current implementation installs my instances as dependent of the model and my changed: method propagates updates to the widget I create (via my buildWidget method). This implementation is not optimal. 

In the future my instances should just be responsible to create a widget and install all the communication between the model and the widget. I should not be a middle man. 
"
Class {
	#name : #AbstractAdapter,
	#superclass : #Model,
	#instVars : [
		'model',
		'widget',
		'selector'
	],
	#category : #Spec-Core,
	#timestamp : 'StephaneDucasse 2/27/2015 20:31'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractAdapter class>>adapt: aComposableModel [
	
	^ self new
		adapt: aComposableModel;
		yourself
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractAdapter>>adapt: aComposableModel [

	model := aComposableModel.
	aComposableModel addDependent: self.

	widget := self buildWidget.
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractAdapter>>add: aWidget [

	self subclassResponsibility
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractAdapter>>asWidget [

	^ self widget
]

{
	#category : #factory,
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractAdapter>>buildWidget [

	^ self subclassResponsibility
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractAdapter>>hRigid [

	self subclassResponsibility
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractAdapter>>hShrinkWrap [

	self subclassResponsibility
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractAdapter>>hSpaceFill [

	self subclassResponsibility
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractAdapter>>isRedrawable [
	"This must be overriden in the adapter representing your container"
	
	^ false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractAdapter>>isSpecAdapter [

	^ true
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractAdapter>>layout: aLayout [

	self subclassResponsibility
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractAdapter>>model [
	^ model
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractAdapter>>removeSubWidgets [

	self subclassResponsibility
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractAdapter>>selector [
	
	^ selector
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractAdapter>>selector: anObject [
	
	selector := anObject
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractAdapter>>takeKeyboardFocus [
	
	self widget ifNotNil: [:w | w takeKeyboardFocus ]
]

{
	#category : #updating,
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractAdapter>>update: aSymbol [

	self changed: aSymbol
]

{
	#category : #updating,
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractAdapter>>update: aSymbol with: anArray [

	self perform: aSymbol withArguments: anArray
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractAdapter>>useProportionalLayout [

	self subclassResponsibility
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractAdapter>>vRigid [

	self subclassResponsibility
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractAdapter>>vShrinkWrap [

	self subclassResponsibility
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractAdapter>>vSpaceFill [

	self subclassResponsibility
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractAdapter>>when: anAnnouncement do: aBlock [

	self subclassResponsibility
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractAdapter>>widget [
	^ widget
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractAdapter>>widgetDo: aBlock [

	^ self widget ifNotNil: aBlock
]
