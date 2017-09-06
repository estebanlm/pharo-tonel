"
I'm a style module related to a rubric text fields and its componenets
"
Trait {
	#name : #GLMBrickRubricStyle,
	#traits : '{}',
	#classTraits : '{}',
	#category : #Glamour-Morphic-Brick-Theme,
	#timestamp : 'AliakseiSyrel 1/30/2015 11:50'
}

{
	#category : #brick-rubric,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickRubricStyle>>rubricBackgroundColor [

	^ self contentBackgroundColor
]

{
	#category : #brick-rubric,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickRubricStyle>>rubricBorderColor [

	^ Color transparent
]

{
	#category : #brick-rubric,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickRubricStyle>>rubricBorderWidth [

	^ 0
]

{
	#category : #brick-rubric,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickRubricStyle>>rubricCursorColor [

	^ self rubricTextColor
]

{
	#category : #brick-rubric,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickRubricStyle>>rubricTextBackgroundColor [

	^ Color transparent
]

{
	#category : #brick-rubric,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickRubricStyle>>rubricTextColor [

	^ self textColor
]

{
	#category : #brick-rubric,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickRubricStyle>>rubricTextFamilyName [
	
	^ StandardFonts codeFont familyName
]

{
	#category : #brick-rubric,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickRubricStyle>>rubricTextFontSize [
	
	^ StandardFonts codeFont pointSize
]
