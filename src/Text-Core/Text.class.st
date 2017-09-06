"
I represent a character string that has been marked with abstract changes in character appearance. Actual display is performed in the presence of a TextStyle which indicates, for each abstract code, an actual font to be used.  A Text associates a set of TextAttributes with each character in its character string.  These attributes may be font numbers, emphases such as bold or italic, or hyperling actions.  Font numbers are interpreted relative to whatever textStyle appears, along with the text, in a Paragraph.  Since most characters have the same attributes as their neighbors, the attributes are stored in a RunArray for efficiency.  Each of my instances has
	string		a String
	runs		a RunArray
"
Class {
	#name : #Text,
	#superclass : #ArrayedCollection,
	#instVars : [
		'string',
		'runs'
	],
	#pools : [
		'TextConstants'
	],
	#category : #Text-Core,
	#timestamp : '<historical>'
}

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:16'
}
Text class>>addAttribute: att toArray: others  [
	"Add a new text attribute to an existing set"
	"NOTE: The use of reset and set in this code is a specific
	hack for merging TextKerns."
	att reset.
	^ Array streamContents:
		[:strm | others do:
			[:other | (att dominates: other) ifFalse: [strm nextPut: other]].
		att set ifTrue: [strm nextPut: att]]
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:16'
}
Text class>>fromString: aString  [
  "Answer an instance of me whose characters are those of the argument, aString."

  ^ self
    string: aString
    attributes:{ "No default attributes" }

]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:16'
}
Text class>>fromUser [
	"Answer an instance of me obtained by requesting the user to type a string."
	"Text fromUser"

	^ self fromString:
		(UIManager default request: 'Enter text followed by carriage return')

]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:16'
}
Text class>>initialFont: aStrikeFont stringOrText: aStringOrText [
	"Answer an instance of me whose characters are aString."
	
	^Text string: aStringOrText asString attribute: (TextFontReference toFont: aStrikeFont)
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:16:16'
}
Text class>>initialize	"Text initialize" [
	"Initialize constants shared by classes associated with text display."

	TextSharedInformation at: #CaretForm put:
				(Form extent: 16@5
					fromArray: #(	
						2r00110000000000000000000000000000
						2r00110000000000000000000000000000
					 	2r01111000000000000000000000000000
					 	2r11111100000000000000000000000000
					 	2r11001100000000000000000000000000)
					offset: -3@0).
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:16'
}
Text class>>new: stringSize [

	^self fromString: (String new: stringSize)
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:16'
}
Text class>>streamContents: blockWithArg  [
	| stream |
	stream := TextStream on: (self new: 400).
	blockWithArg value: stream.
	^ stream contents
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:16'
}
Text class>>string: aString attribute: att [
	"Answer an instance of me whose characters are aString.
	att is a TextAttribute."

	^self string: aString attributes: (Array with: att)
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:16'
}
Text class>>string: aString attributes: atts [
	"Answer an instance of me whose characters are those of aString.
	atts is an array of TextAttributes."

	^self string: aString runs: (RunArray new: aString size withAll: atts)
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:16'
}
Text class>>string: aString runs: anArray [
 
	^self basicNew setString: aString setRuns: anArray
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:16:16'
}
Text>>= other [
	"Am I equal to the other Text or String?  
	***** Warning ***** Two Texts are considered equal if they have the same characters in them.  They might have completely different emphasis, fonts, sizes, text actions, or embedded morphs.  If you need to find out if one is a true copy of the other, you must do (text1 = text2 and: [text1 runs = text2 runs])."

	other isText ifTrue:	["This is designed to run fast even for megabytes"
				^ string == other string or: [string = other string]].
	other isString ifTrue: [^ string == other or: [string = other]].
	^ false
]

{
	#category : #emphasis,
	#timestamp : ' 8/31/2017 07:16:16'
}
Text>>addAttribute: att  [
	^ self addAttribute: att from: 1 to: self size
]

{
	#category : #emphasis,
	#timestamp : ' 8/31/2017 07:16:16'
}
Text>>addAttribute: att from: start to: stop  [
	"Set the attribute for characters in the interval start to stop."
	self runs: (runs copyReplaceFrom: start to: stop
			with: ((runs copyFrom: start to: stop)
				mapValues:
				[:attributes | Text addAttribute: att toArray: attributes]))

]

{
	#category : #emphasis,
	#timestamp : ' 8/31/2017 07:16:16'
}
Text>>alignmentAt: characterIndex ifAbsent: aBlock [
	| attributes emph |
	self size = 0 ifTrue: [^aBlock value].
	emph := nil.
	attributes := runs at: characterIndex.
	attributes do:[:att | (att isKindOf: TextAlignment) ifTrue: [emph := att]].
	^ emph ifNil: aBlock ifNotNil: [emph alignment]
]

{
	#category : #emphasis,
	#timestamp : ' 8/31/2017 07:16:16'
}
Text>>allBold  [
	"Force this whole text to be bold."
	string size = 0 ifTrue: [^self].
	self makeBoldFrom: 1 to: string size
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:16'
}
Text>>append: stringOrText [

	self replaceFrom: string size + 1
				to: string size with: stringOrText
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 07:16:16'
}
Text>>asNumber [
	"Answer the number created by interpreting the receiver as the textual 
	representation of a number."

	^string asNumber
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 07:16:16'
}
Text>>asOctetStringText [

	string class == WideString ifTrue: [
		^ self class string: string asOctetString runs: self runs copy.
	].
	^self.

]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 07:16:16'
}
Text>>asString [
	"Answer a String representation of the textual receiver."

	^string
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 07:16:16'
}
Text>>asStringOrText	 [
	"Answer the receiver itself."

	^self
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 07:16:16'
}
Text>>asText	 [
	"Answer the receiver itself."

	^self
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:16'
}
Text>>at: index [

	^string at: index
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:16'
}
Text>>at: index put: character [

	^string at: index put: character
]

{
	#category : #emphasis,
	#timestamp : ' 8/31/2017 07:16:16'
}
Text>>attributesAt: characterIndex  [
	"Answer the code for characters in the run beginning at characterIndex."
	"NB: no senders any more (supplanted by #attributesAt:forStyle: but retained for the moment in order not to break user code that may exist somewhere that still calls this"
	| attributes |
"	self size = 0
		ifTrue: [^ Array with: (TextFontChange new fontNumber: 1)]."
	self size = 0 ifTrue: [ ^#()].
	attributes := runs at: characterIndex.
	^ attributes
]

{
	#category : #emphasis,
	#timestamp : ' 8/31/2017 07:16:16'
}
Text>>attributesAt: characterIndex do: aBlock [
	"Answer the code for characters in the run beginning at characterIndex."
	"NB: no senders any more (supplanted by #attributesAt:forStyle: but retained for the moment in order not to break user code that may exist somewhere that still calls this"
	self size = 0 ifTrue:[^self].
	(runs at: characterIndex) do: aBlock
]

{
	#category : #emphasis,
	#timestamp : ' 8/31/2017 07:16:16'
}
Text>>attributesAt: characterIndex forStyle: aTextStyle [
	"Answer the code for characters in the run beginning at characterIndex."
	| attributes |
	self size = 0
		ifTrue: [^ Array with: (TextFontChange new fontNumber: aTextStyle defaultFontIndex)].  "null text tolerates access"
	attributes := runs at: characterIndex.
	^ attributes
]

{
	#category : #copying,
	#timestamp : ' 8/31/2017 07:16:16'
}
Text>>copyFrom: start to: stop  [
	"Answer a copied subrange of the receiver."

	| realStart realStop |
	stop > self size
		ifTrue: [realStop := self size]		"handle selection at end of string"
		ifFalse: [realStop := stop].
	start < 1
		ifTrue: [realStart := 1]			"handle selection before start of string"
		ifFalse: [realStart := start].
	^self class 
		string: (string copyFrom: realStart to: realStop)
		runs: (runs copyFrom: realStart to: realStop)
]

{
	#category : #copying,
	#timestamp : ' 8/31/2017 07:16:16'
}
Text>>copyReplaceFrom: start to: stop with: aTextOrString [

	| txt |
	txt := aTextOrString asText.	"might be a string"
	^self class 
             string: (string copyReplaceFrom: start to: stop with: txt string)
             runs: (runs copyReplaceFrom: start to: stop with: txt runs)

]

{
	#category : #copying,
	#timestamp : ' 8/31/2017 07:16:16'
}
Text>>copyReplaceTokens: oldSubstring with: newSubstring  [
	"Replace all occurrences of oldSubstring that are surrounded
	by non-alphanumeric characters"
	^ (self string copyReplaceAll: oldSubstring with: newSubstring asTokens: true) asText
	"'File asFile Files File''s File' copyReplaceTokens: 'File' with: 'Snick'"
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 07:16:16'
}
Text>>copyWithoutExternalReferences [

	^ self copy  
		removeAttributesThat: [:attr | attr mayHaveExternalReferences ] replaceAttributesThat: [:attr | false ] by: [:attr | ];
		yourself.
]

{
	#category : #copying,
	#timestamp : ' 8/31/2017 07:16:16'
}
Text>>deepCopy [

	^ self copy "Both string and runs are assumed to be read-only"
]

{
	#category : #emphasis,
	#timestamp : ' 8/31/2017 07:16:16'
}
Text>>emphasisAt: characterIndex [
	"Answer the fontfor characters in the run beginning at characterIndex."
	| attributes |
	self size = 0 ifTrue: [^ 0].	"null text tolerates access"
	attributes := runs at: characterIndex.
	^attributes inject: 0 into:
		[:emph :att | emph bitOr: att emphasisCode].
]

{
	#category : #'paragraph support',
	#timestamp : ' 8/31/2017 07:16:16'
}
Text>>encompassLine: anInterval [
	^string encompassLine: anInterval
]

{
	#category : #'paragraph support',
	#timestamp : ' 8/31/2017 07:16:16'
}
Text>>encompassParagraph: anInterval [

	^string encompassParagraph: anInterval
]

{
	#category : #emphasis,
	#timestamp : ' 8/31/2017 07:16:16'
}
Text>>find: attribute [
	"Return the first interval over which this attribute applies"
	| begin end |
	begin := 0.
	runs withStartStopAndValueDo:
		[:start :stop :attributes |
		(attributes includes: attribute)
			ifTrue: [begin = 0 ifTrue: [begin := start].
					end := stop]
			ifFalse: [begin > 0 ifTrue: [^ begin to: end]]].
	begin > 0 ifTrue: [^ begin to: end].
	^ nil
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:16'
}
Text>>findString: aString startingAt: start  [
	"Answer the index of substring within the receiver, starting at index 
	start. If the receiver does not contain substring, answer 0."

	^string findString: aString asString startingAt: start
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:16'
}
Text>>findString: aString startingAt: start caseSensitive: caseSensitive [
	"Answer the index of substring within the receiver, starting at index 
	start. If the receiver does not contain substring, answer 0."

	^string findString: aString asString startingAt: start caseSensitive: caseSensitive
]

{
	#category : #emphasis,
	#timestamp : ' 8/31/2017 07:16:16'
}
Text>>fontAt: characterIndex [
	^self fontAt: characterIndex withStyle: TextStyle default
]

{
	#category : #emphasis,
	#timestamp : ' 8/31/2017 07:16:16'
}
Text>>fontAt: characterIndex withStyle: aTextStyle [
	"Answer the fontfor characters in the run beginning at characterIndex."
	| attributes font |
	self size = 0 ifTrue: [^ aTextStyle defaultFont].	"null text tolerates access"
	attributes := runs at: characterIndex.
	font := aTextStyle defaultFont.  "default"
	attributes do: 
		[:att | att forFontInStyle: aTextStyle do: [:f | font := f]].
	^ font
]

{
	#category : #emphasis,
	#timestamp : ' 8/31/2017 07:16:16'
}
Text>>fontNumberAt: characterIndex  [
	"Answer the fontNumber for characters in the run beginning at characterIndex."
	| attributes fontNumber |
	self size = 0 ifTrue: [^1].	"null text tolerates access"
	attributes := runs at: characterIndex.
	fontNumber := 1.
	attributes do: [:att | (att isMemberOf: TextFontChange) ifTrue: [fontNumber := att fontNumber]].
	^ fontNumber
	
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:16'
}
Text>>hasWideCharacterFrom: start to: stop [
	^string hasWideCharacterFrom: start to: stop
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:16:16'
}
Text>>hash [
	"#hash is implemented, because #= is implemented.  We are now equal to a string with the same characters.  Hash must reflect that."

	^ string hash
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:16:16'
}
Text>>howManyMatch: aString [

	^ self string howManyMatch: aString
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:16'
}
Text>>includesSubstring: substring [
	^ substring isEmpty or: [ (self findString: substring startingAt: 1) > 0 ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:16'
}
Text>>includesSubstring: aString caseSensitive: caseSensitive [
	
	^ (self findString: aString startingAt: 1 caseSensitive: caseSensitive) > 0
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:16'
}
Text>>initialStyle [
	^TextStyle default
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:16:16'
}
Text>>isText [
	^ true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:16'
}
Text>>lineCount [

	^ string lineCount
]

{
	#category : #emphasis,
	#timestamp : ' 8/31/2017 07:16:16'
}
Text>>makeAllColor: color [
	| attribute |
	attribute := TextColor color: color.

	^ self addAttribute: attribute from: 1 to: self size
]

{
	#category : #emphasis,
	#timestamp : ' 8/31/2017 07:16:16'
}
Text>>makeBoldFrom: start to: stop [

	^ self addAttribute: TextEmphasis bold from: start to: stop
]

{
	#category : #emphasis,
	#timestamp : ' 8/31/2017 07:16:16'
}
Text>>makeColor: color from: start to: stop [
	| attribute |
	attribute := TextColor color: color.

	^ self addAttribute: attribute from: start to: stop
]

{
	#category : #copying,
	#timestamp : ' 8/31/2017 07:16:16'
}
Text>>postCopy [
	super postCopy.
	string := string copy.
	runs := runs copy
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:16'
}
Text>>prepend: stringOrText [

	self replaceFrom: 1 to: 0 with: stringOrText
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:16'
}
Text>>printOn: aStream [
	self printNameOn: aStream.
	aStream nextPutAll: ' for '; print: string
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:16'
}
Text>>rangeOf: attribute startingAt: index [
"Answer an interval that gives the range of attribute at index position  index. An empty interval with start value index is returned when the attribute is not present at position index.  "
   ^string size = 0
      ifTrue: [index to: index - 1]
	 ifFalse: [runs rangeOf: attribute startingAt: index]
]

{
	#category : #emphasis,
	#timestamp : ' 8/31/2017 07:16:16'
}
Text>>removeAttribute: att  [
	^ self removeAttribute: att from: 1 to: self size
]

{
	#category : #emphasis,
	#timestamp : ' 8/31/2017 07:16:16'
}
Text>>removeAttribute: att from: start to: stop  [
	"Remove the attribute over the interval start to stop."
	self runs: (runs copyReplaceFrom: start to: stop
			with: ((runs copyFrom: start to: stop)
				mapValues:
				[:attributes | attributes copyWithout: att]))

]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 07:16:16'
}
Text>>removeAttributesThat: removalBlock replaceAttributesThat: replaceBlock by: convertBlock [
	"Enumerate all attributes in the receiver. Remove those passing removalBlock and replace those passing replaceBlock after converting it through convertBlock"
	| added removed |
	"Deliberately optimized for the no-op default."
	added := removed := nil.
	runs withStartStopAndValueDo: [ :start :stop :attribs | 
		attribs do: [ :attrib | | new |
			(removalBlock value: attrib) ifTrue:[
				removed ifNil:[removed := Array new writeStream].
				removed nextPut: {start. stop. attrib}.
			] ifFalse:[
				(replaceBlock value: attrib) ifTrue:[
					removed ifNil:[removed := Array new writeStream].
					removed nextPut: {start. stop. attrib}.
					new := convertBlock value: attrib.
					added ifNil:[added := Array new writeStream].
					added nextPut: {start. stop. new}.
				].
			].
		].
	].
	(added isNil and:[removed isNil]) ifTrue:[^self].
	"otherwise do the real work"
	removed ifNotNil:[removed contents do:[:spec|
		self removeAttribute: spec last from: spec first to: spec second]].
	added ifNotNil:[added contents do:[:spec|
		self addAttribute: spec last from: spec first to: spec second]].
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:16'
}
Text>>replaceFrom: start to: stop with: aText [

	| txt |
	txt := aText asText.	"might be a string"
	string := string copyReplaceFrom: start to: stop with: txt string.
	runs := runs copyReplaceFrom: start to: stop with: txt runs
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 07:16:16'
}
Text>>replaceFrom: start to: stop with: replacement startingAt: repStart  [
 	"This destructively replaces elements from start to stop in the receiver starting at index, repStart, in replacementCollection. Do it to both the string and the runs."
 
 	| rep newRepRuns |
 	rep := replacement asText.	"might be a string"
 	string replaceFrom: start to: stop with: rep string startingAt: repStart.
 	newRepRuns := rep runs copyFrom: repStart to: repStart + stop - start.
	runs := runs copyReplaceFrom: start to: stop with: newRepRuns
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 07:16:16'
}
Text>>reversed [
 
 	"Answer a copy of the receiver with element order reversed."
 
 	^ self class string: string reversed runs: runs reversed.
 
   "  It is assumed that  self size = runs size  holds. "
]

{
	#category : #emphasis,
	#timestamp : ' 8/31/2017 07:16:16'
}
Text>>runLengthFor: characterIndex  [
	"Answer the count of characters remaining in run beginning with 
	characterIndex."

	^runs runLengthAt: characterIndex
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:16'
}
Text>>runs [

	^runs
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:16'
}
Text>>runs: anArray [
	anArray size = string size
		ifFalse:
			[^self error: 'Some code is setting text attributes length not matching the string size'].
	runs := anArray
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:16'
}
Text>>setString: aString setRuns: anArray [

	string := aString.
	runs := anArray
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:16'
}
Text>>setString: aString setRunsChecking: aRunArray [
	"Check runs and do the best you can to make them fit..."

	string := aString.
	"check the runs"
	aRunArray ifNil: [^ aString asText].
	(aRunArray isKindOf: RunArray) ifFalse: [^ aString asText].
	aRunArray runs size = aRunArray values size ifFalse: [^ aString asText].
	aRunArray size = aString size ifFalse: [^ aString asText].
	
	runs := aRunArray.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:16'
}
Text>>size [

	^string size
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:16'
}
Text>>storeOn: aStream [

	aStream nextPutAll: '(Text string: ';
		store: string;
		nextPutAll: ' runs: ';
		store: runs;
		nextPut: $)
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:16'
}
Text>>string [
	"Answer the string representation of the receiver."

	^string
]

{
	#category : #attributes,
	#timestamp : ' 8/31/2017 07:16:16'
}
Text>>unembellished  [
	"Return true if the only emphases are the default font and bold"
	| font1 bold |
	font1 := TextFontChange defaultFontChange.
	bold := TextEmphasis bold.
	runs withStartStopAndValueDo:
		[:start :stop :emphArray |
		emphArray do:
			[:emph | (font1 = emph or: [bold = emph]) ifFalse: [^ false]]].
	^ true
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 07:16:16'
}
Text>>withSqueakLineEndings [
	"Answer a copy of myself in which all sequences of <CR><LF> or <LF> have been changed to <CR>"
	| newText |
	(string includes: Character lf) ifFalse: [ ^self copy ].
	newText := self copyReplaceAll: String crlf with: String cr.
	(newText asString includes: Character lf) ifFalse: [ ^newText ].
	^newText copyReplaceAll: String lf with: String cr.
]
