"
I am especially designed to contain a list selection (an index + an object)
"
Class {
	#name : #SelectionValueHolder,
	#superclass : #NewValueHolder,
	#instVars : [
		'index',
		'selection'
	],
	#category : #NewValueHolder,
	#timestamp : 'BenjaminVanRyseghem 1/23/2014 15:18'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:15'
}
SelectionValueHolder class>>index: indexValueHolder selection: selectionValueHolder [

	^ self new
		index: indexValueHolder;
		selection: selectionValueHolder;
		yourself
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
SelectionValueHolder>>index [

	^ index
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
SelectionValueHolder>>index: anIndex [

	index := anIndex.
	self valueChanged: index
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:15'
}
SelectionValueHolder>>initialize [

	super initialize.
	index := 0 asValueHolder.
	selection := nil asValueHolder.
	
	index whenChangedSend: #valueChanged to: self.
	selection whenChangedSend: #valueChanged to: self.
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:15'
}
SelectionValueHolder>>reset [

	self index value: 0.
	self selection value: nil.
	self valueChanged
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
SelectionValueHolder>>selection [

	^ selection
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
SelectionValueHolder>>selection: aSelection [

	selection := aSelection.
	self valueChanged: selection
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
SelectionValueHolder>>value [

	^ {index. selection}
]
