"
i represent stroke paint for balloon backend
"
Class {
	#name : #AthensBalloonStrokePaint,
	#superclass : #AthensStrokePaint,
	#category : #Athens-Balloon,
	#timestamp : '<historical>'
}

{
	#category : #rendering,
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensBalloonStrokePaint>>athensFillPath: aPath on: aCanvas [

	^ fillPaint strokePath: aPath on: aCanvas strokeWidth: width

]

{
	#category : #rendering,
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensBalloonStrokePaint>>athensFillRectangle: aRect on: aCanvas [

	^ fillPaint strokeRect: aRect on: aCanvas strokeWidth: width
]

{
	#category : #'setting cap styles',
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensBalloonStrokePaint>>capButt [
	self flag:#todo
]

{
	#category : #'setting cap styles',
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensBalloonStrokePaint>>capRound [
	self flag:#todo
]

{
	#category : #'setting cap styles',
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensBalloonStrokePaint>>capSquare [
	self flag:#todo
]

{
	#category : #'setting join styles',
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensBalloonStrokePaint>>joinBevel [
	self flag:#todo
]

{
	#category : #'setting join styles',
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensBalloonStrokePaint>>joinMiter [
	self flag:#todo
]

{
	#category : #'setting join styles',
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensBalloonStrokePaint>>joinRound [
	self flag:#todo
]
