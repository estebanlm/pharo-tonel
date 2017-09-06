"
A GLMBandBrick is a simple Brick with height that shrinks to wrap subbricks.
Usually used within scroll panes
"
Class {
	#name : #GLMBandBrick,
	#superclass : #GLMBrick,
	#category : #Glamour-Morphic-Brick-Widgets-Core,
	#timestamp : 'AliakseiSyrel 3/22/2015 11:35'
}

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBandBrick class>>exampleOpen [
	
	self gtExample openInBrickWindowLabeled: 'Band example'
]

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBandBrick class>>gtExample [
	<gtExample>
	<label: 'Example with subbricks'>
	
	^ self new
		hSpaceFill;
		vSpaceFill;
		with: [ :b | |count|
			count := 10.
			1 to: count do: [ :index | 
				b addBrickBack: (
					GLMLabelBrick new
						text: (index asString, ' of ', count asString);
						textPosition: #center;
						color: Color random muchLighter;
						height: 40;
						hSpaceFill ) ] ]
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBandBrick>>initialize [
	super initialize.
	
	self
		useVerticalLinearLayout;
		vShrinkWrap
]
