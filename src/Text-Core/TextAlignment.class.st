"
I'm a Text attribute that tells how content should be aligned.

TextMorph new 
  newContents: (Text streamContents: [:aStream| 
										aStream
 											nextPutAll: 'Left flush' asText; 
											cr;
											nextPutAll: ('Centered' asText addAttribute: TextAlignment centered); 
 											cr;
											nextPutAll: ('Right flush' asText addAttribute: TextAlignment rightFlush); 
 											cr ]);
  openInWindowLabeled: 'TextAlignment demo'
"
Class {
	#name : #TextAlignment,
	#superclass : #TextAttribute,
	#instVars : [
		'alignment'
	],
	#pools : [
		'TextConstants'
	],
	#category : #Text-Core,
	#timestamp : '<historical>'
}

{
	#category : #utils,
	#timestamp : ' 8/31/2017 07:16:16'
}
TextAlignment class>>alignmentSymbol: alignmentCode [
	^#(leftFlush rightFlush centered justified) at: (alignmentCode + 1)
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:16'
}
TextAlignment class>>centered [
	^self new alignment: Centered
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:16'
}
TextAlignment class>>justified [
	^self new alignment: Justified
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:16'
}
TextAlignment class>>leftFlush [
	^self new alignment: LeftFlush
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:16'
}
TextAlignment class>>rightFlush [
	^self new alignment: RightFlush
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:16'
}
TextAlignment>>= other  [
	^ (other class == self class) 
		and: [other alignment = alignment]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:16'
}
TextAlignment>>alignment [
	^alignment
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:16'
}
TextAlignment>>alignment: aNumber [
	alignment := aNumber.
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:16'
}
TextAlignment>>dominates: other [
	"There can be only one..."
	^self class == other class
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:16'
}
TextAlignment>>hash [
	"#hash is re-implemented because #= is re-implemented"
	^ alignment hash
]

{
	#category : #utils,
	#timestamp : ' 8/31/2017 07:16:16'
}
TextAlignment>>writeScanOn: strm [

	strm nextPut: $a.
	alignment printOn: strm.
]
