"

"
Class {
	#name : #BitBltClipBugsTest,
	#superclass : #TestCase,
	#category : #Graphics-Tests-Primitives,
	#timestamp : ''
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:43'
}
BitBltClipBugsTest>>testDrawingWayOutside [
	| f1 bb f2 |
	f1 := Form extent: 100 @ 100 depth: 1.
	f2 := Form extent: 100 @ 100 depth: 1.
	bb := BitBlt toForm: f1.
	bb combinationRule: 3.
	bb sourceForm: f2.
	bb destOrigin: SmallInteger maxVal squared asPoint.
	bb
		width: 100;
		height: 100.
	bb copyBits
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:43'
}
BitBltClipBugsTest>>testDrawingWayOutside2 [
	| f1 bb f2 |
	f1 := Form extent: 100 @ 100 depth: 1.
	f2 := Form extent: 100 @ 100 depth: 1.
	bb := BitBlt toForm: f1.
	bb combinationRule: 3.
	bb sourceForm: f2.
	bb destOrigin: 0 @ 0.
	bb
		width: SmallInteger maxVal squared;
		height: SmallInteger maxVal squared.
	bb copyBits
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:43'
}
BitBltClipBugsTest>>testDrawingWayOutside3 [
	| f1 bb f2 |
	f1 := Form extent: 100 @ 100 depth: 1.
	f2 := Form extent: 100 @ 100 depth: 1.
	bb := BitBlt toForm: f1.
	bb combinationRule: 3.
	bb sourceForm: f2.
	bb destOrigin: SmallInteger maxVal squared asPoint.
	bb
		width: SmallInteger maxVal squared;
		height: SmallInteger maxVal squared.
	bb copyBits
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:43'
}
BitBltClipBugsTest>>testDrawingWayOutside4 [
	| f1 bb f2 |
	f1 := Form extent: 100 @ 100 depth: 1.
	f2 := Form extent: 100 @ 100 depth: 1.
	bb := BitBlt toForm: f1.
	bb combinationRule: 3.
	bb sourceForm: f2.
	bb destOrigin: SmallInteger maxVal squared asPoint.
	bb
		width: 100;
		height: 100.
	bb sourceOrigin: SmallInteger maxVal squared asPoint.
	bb copyBits
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:43'
}
BitBltClipBugsTest>>testDrawingWayOutside5 [
	| f1 bb f2 |
	f1 := Form extent: 100 @ 100 depth: 1.
	f2 := Form extent: 100 @ 100 depth: 1.
	bb := BitBlt toForm: f1.
	bb combinationRule: 3.
	bb sourceForm: f2.
	bb destOrigin: 0 @ 0.
	bb
		width: SmallInteger maxVal squared;
		height: SmallInteger maxVal squared.
	bb sourceOrigin: SmallInteger maxVal squared asPoint.
	bb copyBits
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:43'
}
BitBltClipBugsTest>>testDrawingWayOutside6 [
	| f1 bb f2 |
	f1 := Form extent: 100 @ 100 depth: 1.
	f2 := Form extent: 100 @ 100 depth: 1.
	bb := BitBlt toForm: f1.
	bb combinationRule: 3.
	bb sourceForm: f2.
	bb destOrigin: SmallInteger maxVal squared asPoint.
	bb
		width: SmallInteger maxVal squared;
		height: SmallInteger maxVal squared.
	bb sourceOrigin: SmallInteger maxVal squared asPoint.
	bb copyBits
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:43'
}
BitBltClipBugsTest>>testFillingWayOutside [
	| f1 bb |
	f1 := Form extent: 100 @ 100 depth: 1.
	bb := BitBlt toForm: f1.
	bb combinationRule: 3.
	bb fillColor: Color black.
	bb destOrigin: SmallInteger maxVal squared asPoint.
	bb
		width: 100;
		height: 100.
	bb copyBits
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:43'
}
BitBltClipBugsTest>>testFillingWayOutside2 [
	| f1 bb |
	f1 := Form extent: 100 @ 100 depth: 1.
	bb := BitBlt toForm: f1.
	bb combinationRule: 3.
	bb fillColor: Color black.
	bb destOrigin: 0 @ 0.
	bb
		width: SmallInteger maxVal squared;
		height: SmallInteger maxVal squared.
	bb copyBits
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:43'
}
BitBltClipBugsTest>>testFillingWayOutside3 [
	| f1 bb |
	f1 := Form extent: 100 @ 100 depth: 1.
	bb := BitBlt toForm: f1.
	bb combinationRule: 3.
	bb fillColor: Color black.
	bb destOrigin: SmallInteger maxVal squared asPoint.
	bb
		width: SmallInteger maxVal squared;
		height: SmallInteger maxVal squared.
	bb copyBits
]
