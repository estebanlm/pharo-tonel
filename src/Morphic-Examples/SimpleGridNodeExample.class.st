"
Example for a simple grid node
"
Class {
	#name : #SimpleGridNodeExample,
	#superclass : #MorphTreeNodeModel,
	#category : #Morphic-Examples-MorphTreeWidget,
	#timestamp : 'TorstenBergmann 2/3/2014 23:55'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
SimpleGridNodeExample>>age [
	^ self item age
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
SimpleGridNodeExample>>age: anInteger [
	self item age: anInteger.
	self changed: #age
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:14'
}
SimpleGridNodeExample>>ageMorph [
	^ ( self theme  
				newTextEntryIn: World
				for: self 
				get: #age
				set: #age:
				class: Integer
				getEnabled: nil
				help: nil) color: Color transparent
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
SimpleGridNodeExample>>firstName [
	^ self item firstName
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
SimpleGridNodeExample>>firstName: aString [
	self item firstName: aString.
	self changed: #firstName
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:14'
}
SimpleGridNodeExample>>firstNameMorph [
	^ ( self theme  
				newTextEntryIn: World
				for: self 
				get: #firstName
				set: #firstName:
				class: String
				getEnabled: nil
				help: nil) color: Color transparent
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
SimpleGridNodeExample>>married [
	^ self item married
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
SimpleGridNodeExample>>married: aBoolean [
	self item married: aBoolean.
	self changed: #married
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:14'
}
SimpleGridNodeExample>>marriedMorph [
	^ ( self theme  
			newCheckboxIn: World
			for: self 
			getSelected: #married
			setSelected: #married:
			getEnabled: nil
			label: '' 
			help: nil) color: Color transparent
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
SimpleGridNodeExample>>secondName [
	^ self item secondName
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
SimpleGridNodeExample>>secondName: aString [
	self item secondName: aString.
	self changed: #secondName
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:14'
}
SimpleGridNodeExample>>secondNameMorph [
	^ ( self theme  
				newTextEntryIn: World
				for: self 
				get: #secondName
				set: #secondName:
				class: String
				getEnabled: nil
				help: nil) color: Color transparent
]
