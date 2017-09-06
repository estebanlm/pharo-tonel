Extension {
	#name : #PluggableTextMorph
}

{
	#category : #'*NodeNavigation',
	#timestamp : ' 8/31/2017 05:26:40'
}
PluggableTextMorph>>standOutHorizontalScope [

	self handleEdit: [NNavNavigation new navigate: textMorph editor direction: NNavDirectionSibling ] 
]

{
	#category : #'*NodeNavigation',
	#timestamp : ' 8/31/2017 05:26:40'
}
PluggableTextMorph>>standOutIntoFirstScope [
	self handleEdit: [NNavNavigation new navigate: textMorph editor direction: NNavDirectionFirstChild ]
]

{
	#category : #'*NodeNavigation',
	#timestamp : ' 8/31/2017 05:26:40'
}
PluggableTextMorph>>standOutIntoScope [
	self handleEdit: [NNavNavigation new navigate: textMorph editor direction:  NNavDirectionChild]
]

{
	#category : #'*NodeNavigation',
	#timestamp : ' 8/31/2017 05:26:40'
}
PluggableTextMorph>>standOutOverScope [
	self handleEdit: [NNavNavigation new navigate: textMorph editor direction:  NNavDirectionParent] 
]

{
	#category : #'*NodeNavigation',
	#timestamp : ' 8/31/2017 05:26:40'
}
PluggableTextMorph>>standOutPreviousChild [
	self handleEdit: [
		NNavNavigation new 
			navigate: textMorph editor 
			direction: NNavDirectionPreviousBrother 
	]
]

{
	#category : #'*NodeNavigation',
	#timestamp : ' 8/31/2017 05:26:40'
}
PluggableTextMorph>>standOutPreviousSelection [
	self handleEdit: [
		NNavNavigation new 
			navigate: textMorph editor 
			direction: NNavDirectionPreviousSelection  
	]
]
