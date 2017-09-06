"
Contributed by Bob Arning as part of the ObjectExplorer package.

"
Class {
	#name : #ListItemWrapper,
	#superclass : #Model,
	#instVars : [
		'item',
		'model'
	],
	#category : #Morphic-Widgets-List,
	#timestamp : '<historical>'
}

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:14'
}
ListItemWrapper class>>with: anObject [

	^self new setItem: anObject
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:14'
}
ListItemWrapper class>>with: anObject model: aModel [

	^self new setItem: anObject model: aModel
]

{
	#category : #dropping/grabbing,
	#timestamp : ' 8/31/2017 05:26:14'
}
ListItemWrapper>>acceptDroppingObject: anotherItem [

	^item acceptDroppingObject: anotherItem
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 05:26:14'
}
ListItemWrapper>>asString [

	^item asString
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
ListItemWrapper>>balloonText [

	^nil
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:14'
}
ListItemWrapper>>canBeDragged [

	^true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
ListItemWrapper>>contents [

	^Array new
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:14'
}
ListItemWrapper>>handlesMouseOver: evt [

	^false
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
ListItemWrapper>>hasContents [

	^self contents isEmpty not
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:14'
}
ListItemWrapper>>hasEquivalentIn: aCollection [
	^ aCollection anySatisfy: [ :each | each withoutListWrapper = item withoutListWrapper ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
ListItemWrapper>>highlightingColor [
	^ self theme selectionColor
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
ListItemWrapper>>icon [
	"Answer a form to be used as icon"
	^ nil
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
ListItemWrapper>>item [
	"Answer the item. It is useful!"
	
	^item
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
ListItemWrapper>>item: newItem [
	item := newItem
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
ListItemWrapper>>model [
	"Answer the model. It is useful!"
	
	^model
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
ListItemWrapper>>preferredColor [
	^ nil
]

{
	#category : #dropping/grabbing,
	#timestamp : ' 8/31/2017 05:26:14'
}
ListItemWrapper>>sendSettingMessageTo: aModel [

	aModel 
		perform: (self settingSelector ifNil: [^self])
		with: self withoutListWrapper

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
ListItemWrapper>>setItem: anObject [

	item := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
ListItemWrapper>>setItem: anObject model: aModel [

	item := anObject.
	model := aModel.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
ListItemWrapper>>setItemFromBlock: aBlock [

	self setItem: aBlock value
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
ListItemWrapper>>settingSelector [

	^nil
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:14'
}
ListItemWrapper>>wantsDroppedObject: anotherItem [

	^false
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 05:26:14'
}
ListItemWrapper>>withoutListWrapper [

	^item withoutListWrapper
]
