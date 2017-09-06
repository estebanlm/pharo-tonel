"
This class represents the abstract leaf structure of items stored in History tree. Composite nodes of such trees are made of HistoryNode instances. For a particular use, this class need to be subclassed. See for example UndoRedoRecord
"
Class {
	#name : #HistoryLeaf,
	#superclass : #Object,
	#category : #System-History,
	#timestamp : 'AlainPlantec 12/14/2010 23:06'
}

{
	#category : #adding,
	#timestamp : ' 8/31/2017 05:26:16'
}
HistoryLeaf>>addItem: anHistoryItem  [
	^ false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:16'
}
HistoryLeaf>>isComposite [
	^ false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:16'
}
HistoryLeaf>>opened [
	^ false
]
