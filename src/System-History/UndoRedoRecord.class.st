"
An UndoRedoRecord is a leaf of an history tree. It  holds undo and redo commands. Such a command is represented by a MessageSend. 

Instance Variables
	redoMessage:		<MessageSend>
	undoMessage:		<MessageSend>

redoMessage
	- The command which is performed for redoing

undoMessage
	- The command which is performed for undoing

"
Class {
	#name : #UndoRedoRecord,
	#superclass : #HistoryLeaf,
	#instVars : [
		'redoMessage',
		'undoMessage'
	],
	#category : #System-History,
	#timestamp : 'AlainPlantec 12/14/2010 23:26'
}

{
	#category : #compatibility,
	#timestamp : ' 8/31/2017 05:26:16'
}
UndoRedoRecord class>>do: doMessageSend undo: undoMessageSend [
	^ self redo: doMessageSend undo: undoMessageSend
]

{
	#category : #compatibility,
	#timestamp : ' 8/31/2017 05:26:16'
}
UndoRedoRecord class>>doArray: doArray undoArray: undoArray [
	^ self redoArray: doArray undoArray: undoArray
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:16'
}
UndoRedoRecord class>>redo: doMessageSend undo: undoMessageSend [

	| anUndoRecord |
	anUndoRecord := self new.
	anUndoRecord redoMessage: doMessageSend.
	anUndoRecord undoMessage: undoMessageSend.
	^anUndoRecord.
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:16'
}
UndoRedoRecord class>>redoArray: doArray undoArray: undoArray [
	" doArray and undoArray are constructed as follow: #(receiver selector arguments) "
	| anUndoRecord |
	anUndoRecord := self new.
	anUndoRecord redoMessage: (MessageSend 
		receiver: 	(doArray first) 
		selector: 	(doArray second) 
		arguments: 	(doArray third)).
	undoArray 
		ifNotNil: [ 
			anUndoRecord undoMessage: (MessageSend 
				receiver: 	(undoArray first) 
				selector: 	(undoArray second) 
				arguments: 	(undoArray third))].
	^anUndoRecord.
]

{
	#category : #compatibility,
	#timestamp : ' 8/31/2017 05:26:16'
}
UndoRedoRecord>>do [
	^self redo
]

{
	#category : #compatibility,
	#timestamp : ' 8/31/2017 05:26:16'
}
UndoRedoRecord>>doMessage [

	^ self redoMessage
]

{
	#category : #compatibility,
	#timestamp : ' 8/31/2017 05:26:16'
}
UndoRedoRecord>>doMessage: aMessageSend [
	^ self redoMessage: aMessageSend

]

{
	#category : #redo-undo,
	#timestamp : ' 8/31/2017 05:26:16'
}
UndoRedoRecord>>redo [
	^self redoMessage value.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:16'
}
UndoRedoRecord>>redoMessage [

	^ redoMessage
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:16'
}
UndoRedoRecord>>redoMessage: aMessageSend [

	redoMessage := aMessageSend
]

{
	#category : #redo-undo,
	#timestamp : ' 8/31/2017 05:26:16'
}
UndoRedoRecord>>undo [
	^self undoMessage
		ifNotNil: [self undoMessage value].
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:16'
}
UndoRedoRecord>>undoMessage [

	^ undoMessage
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:16'
}
UndoRedoRecord>>undoMessage: aMessageSend [

	undoMessage := aMessageSend
]
