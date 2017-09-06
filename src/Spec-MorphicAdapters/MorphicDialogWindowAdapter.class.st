"
I am the adapter used to bridge a DialogWindowModel and a DialogWindow
"
Class {
	#name : #MorphicDialogWindowAdapter,
	#superclass : #MorphicWindowAdapter,
	#category : #Spec-MorphicAdapters,
	#timestamp : '<historical>'
}

{
	#category : #factory,
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicDialogWindowAdapter>>buildWidget [

	^ SpecDialogWindow new
			specWidget: self contentMorph;
			setToolbarFrom: self toolbarBlock;
			model: self model;
			initialize;
			yourself
]

{
	#category : #'spec protocol',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicDialogWindowAdapter>>cancelAction: aBlock [

	^ self widget
		ifNotNil: [:w | w cancelAction: aBlock ]
]

{
	#category : #'widget API',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicDialogWindowAdapter>>contentMorph [

	^ self model contents
]

{
	#category : #'spec protocol',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicDialogWindowAdapter>>okAction: aBlock [

	^ self widget
		ifNotNil: [:w | w okAction: aBlock ]
]

{
	#category : #'spec protocol',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicDialogWindowAdapter>>okButtonEnabled: aBoolean [

	self widget ifNotNil: [ :w | w toolbar okButton enabled: aBoolean ]
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicDialogWindowAdapter>>open [

	self widget openInWorld
]

{
	#category : #'spec protocol',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicDialogWindowAdapter>>toolbar: aToolbar  [

	self widgetDo: [ :w | w toolbar: aToolbar ]
]

{
	#category : #'widget API',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicDialogWindowAdapter>>toolbarBlock [

	^ [ self model toolbar ]
]

{
	#category : #'spec protocol',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicDialogWindowAdapter>>triggerCancelAction [

	self widget ifNotNil: [:w | w toolbar triggerCancelAction ]
]

{
	#category : #'spec protocol',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicDialogWindowAdapter>>triggerOkAction [

	self widget ifNotNil: [:w | w toolbar triggerOkAction ]
]
