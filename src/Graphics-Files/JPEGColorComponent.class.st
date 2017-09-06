"
I represent a single component of color in JPEG YCbCr color space.  I can accept a list of blocks in my component from the current MCU, then stream the samples from this block for use in color conversion.  I also store the running DC sample value for my component, used by the Huffman decoder.

The following layout is fixed for the JPEG primitives to work:
	currentX 		<SmallInteger>
	currentY 		<SmallInteger>
	hSampleFactor 	<SmallInteger>
	vSampleFactor 	<SmallInteger>
	mcuBlocks 		<Array of: <IntegerArray of: DCTSize2 * Integer>>
	widthInBlocks 	<SmallInteger>
	heightInBlocks 	<SmallInteger>
	dctSize 			<SmallInteger>
	mcuWidth 		<SmallInteger>
	mcuHeight 		<SmallInteger>
	priorDCValue 	<SmallInteger>

"
Class {
	#name : #JPEGColorComponent,
	#superclass : #Object,
	#instVars : [
		'currentX',
		'currentY',
		'hSampleFactor',
		'vSampleFactor',
		'mcuBlocks',
		'widthInBlocks',
		'heightInBlocks',
		'dctSize',
		'mcuWidth',
		'mcuHeight',
		'priorDCValue',
		'id',
		'qTableIndex',
		'dcTableIndex',
		'acTableIndex'
	],
	#category : #Graphics-Files,
	#timestamp : '<historical>'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
JPEGColorComponent>>acTableIndex [

	^acTableIndex
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
JPEGColorComponent>>acTableIndex: anInteger  [
	acTableIndex := anInteger
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
JPEGColorComponent>>dcTableIndex [

	^dcTableIndex
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
JPEGColorComponent>>dcTableIndex: anInteger  [
	dcTableIndex := anInteger
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
JPEGColorComponent>>heightInBlocks [

	^heightInBlocks
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
JPEGColorComponent>>heightInBlocks: anInteger  [
	heightInBlocks := anInteger
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
JPEGColorComponent>>id [

	^id
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
JPEGColorComponent>>id: anObject  [
	id := anObject
]

{
	#category : #'sample streaming',
	#timestamp : ' 8/31/2017 05:26:13'
}
JPEGColorComponent>>initializeSampleStreamBlocks: aCollection  [
	mcuBlocks := aCollection.
	self resetSampleStream
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
JPEGColorComponent>>mcuWidth: mw mcuHeight: mh dctSize: ds  [
	mcuWidth := mw.
	mcuHeight := mh.
	dctSize := ds.
	hSampleFactor := mcuWidth // widthInBlocks.
	vSampleFactor := mcuHeight // heightInBlocks
]

{
	#category : #'sample streaming',
	#timestamp : ' 8/31/2017 05:26:13'
}
JPEGColorComponent>>nextSample [
	| dx dy blockIndex sampleIndex sample |
	dx := currentX // hSampleFactor.
	dy := currentY // vSampleFactor.
	blockIndex := dy // dctSize * widthInBlocks + (dx // dctSize) + 1.
	sampleIndex := dy \\ dctSize * dctSize + (dx \\ dctSize) + 1.
	sample := (mcuBlocks at: blockIndex) at: sampleIndex.
	currentX := currentX + 1.
	currentX < (mcuWidth * dctSize) ifFalse: 
		[ currentX := 0.
		currentY := currentY + 1 ].
	^ sample
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
JPEGColorComponent>>priorDCValue: aNumber  [
	priorDCValue := aNumber
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
JPEGColorComponent>>qTableIndex [
	^qTableIndex
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
JPEGColorComponent>>qTableIndex: anInteger  [
	qTableIndex := anInteger
]

{
	#category : #'sample streaming',
	#timestamp : ' 8/31/2017 05:26:13'
}
JPEGColorComponent>>resetSampleStream [
	currentX := 0.
	currentY := 0
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
JPEGColorComponent>>totalMcuBlocks [

	^ heightInBlocks * widthInBlocks
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
JPEGColorComponent>>updateDCValue: aNumber  [
	priorDCValue := priorDCValue + aNumber.
	^ priorDCValue
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
JPEGColorComponent>>widthInBlocks [

	^widthInBlocks
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
JPEGColorComponent>>widthInBlocks: anInteger  [
	widthInBlocks := anInteger
]
