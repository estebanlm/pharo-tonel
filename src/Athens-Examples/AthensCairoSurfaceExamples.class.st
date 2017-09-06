"
self example1
"
Class {
	#name : #AthensCairoSurfaceExamples,
	#superclass : #AthensSurfaceExamples,
	#category : #Athens-Examples,
	#timestamp : 'FernandoOlivero 4/18/2012 13:59'
}

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensCairoSurfaceExamples class>>exampleInterop [

"
self exampleInterop

Test the interoperability with bitblt.
A cairo image surface bits are exposed to bitblt operations via surface plugin.
"
	| surf |
	
	surf := self newSurface: 100@100.

	surf asForm getCanvas fillRectangle: (0@0 corner: 50@50) color: Color red.
	surf markDirty. 
	
	surf drawDuring: [:can |
		can pathTransform loadIdentity.
		can pathTransform translateX: 30 Y: 30.
		can pathTransform rotateByDegrees: 35.
		can setPaint: (Color red).
		
		can setShape: (-20@ -20 corner: 20@ 20).
		2 timesRepeat: [ can draw. can setPaint: (Color green alpha:0.5)]
	].
	Display getCanvas drawImage: 	surf asForm  at: 0@0

]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensCairoSurfaceExamples class>>newSurface: extent [
	
	^ AthensCairoSurface extent: extent
]
