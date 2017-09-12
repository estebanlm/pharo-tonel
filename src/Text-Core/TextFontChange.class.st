"
A TextFontChange encodes a font change applicable over a given range of text.  The font number is interpreted relative to the textStyle governing display of this text.
"
Class {
	#name : #TextFontChange,
	#superclass : #TextAttribute,
	#instVars : [
		'fontNumber'
	],
	#category : #Text-Core
}

{ #category : #private }
TextFontChange class >> defaultFontChange [
  "Answer a TextFontChange that represents the default font"

  | defaultFontStyle fontIndex |

  defaultFontStyle := TextStyle default.
  fontIndex := defaultFontStyle ifNil: [1] ifNotNil: [defaultFontStyle defaultFontIndex].

  ^ self new fontNumber: fontIndex.

]

{ #category : #'as yet unclassified' }
TextFontChange class >> font1 [
	^ self new fontNumber: 1
]

{ #category : #'as yet unclassified' }
TextFontChange class >> font2 [
	^ self new fontNumber: 2
]

{ #category : #'as yet unclassified' }
TextFontChange class >> font3 [
	^ self new fontNumber: 3
]

{ #category : #'as yet unclassified' }
TextFontChange class >> font4 [
	^ self new fontNumber: 4
]

{ #category : #'as yet unclassified' }
TextFontChange class >> fontNumber: n [
	^ self new fontNumber: n
]

{ #category : #'as yet unclassified' }
TextFontChange >> = other [ 
	^ (other class == self class) 
		and: [other fontNumber = fontNumber]
]

{ #category : #'as yet unclassified' }
TextFontChange >> dominates: other [
	^ other isKindOf: TextFontChange
]

{ #category : #'as yet unclassified' }
TextFontChange >> fontNumber [
	^ fontNumber
]

{ #category : #'as yet unclassified' }
TextFontChange >> fontNumber: int [
	fontNumber := int
]

{ #category : #'as yet unclassified' }
TextFontChange >> forFontInStyle: aTextStyle do: aBlock [
	aBlock value: (aTextStyle fontAt: fontNumber)
]

{ #category : #'as yet unclassified' }
TextFontChange >> hash [
	"#hash is re-implemented because #= is re-implemented"
	^fontNumber hash
]

{ #category : #printing }
TextFontChange >> printOn: strm [
	super printOn: strm.
	strm nextPutAll: ' font: '; print: fontNumber
]

{ #category : #'as yet unclassified' }
TextFontChange >> writeScanOn: strm [

	strm nextPut: $f.
	fontNumber printOn: strm.
]
