"
Athens example using Ballon as surface

 
"
Class {
	#name : #AthensBalloonSurfaceExamples,
	#superclass : #AthensSurfaceExamples,
	#category : #Athens-Examples,
	#timestamp : 'TorstenBergmann 2/12/2014 22:18'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensBalloonSurfaceExamples class>>newSurface: extent [
	
	^ AthensBalloonSurface extent: extent
]
