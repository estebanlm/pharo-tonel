"

"
Class {
	#name : #GTPlayBindingThemer,
	#superclass : #GLMBrickThemerModule,
	#category : #GT-Playground,
	#timestamp : ''
}

{
	#category : #rows,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTPlayBindingThemer>>borderColor [

	^ self themer popupThemer borderColor
]

{
	#category : #rows,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTPlayBindingThemer>>borderWidth [

	^ 1
]

{
	#category : #empty-text,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTPlayBindingThemer>>emptyTextColor [

	^ self themer textLightColor
]

{
	#category : #empty-text,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTPlayBindingThemer>>emptyTextFontSize [

	^ Smalltalk ui theme textFont pointSize
]

{
	#category : #empty-text,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTPlayBindingThemer>>emptyTextPadding [

	^ 15
]

{
	#category : #icons,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTPlayBindingThemer>>goIcon [

	^ GLMUIThemeExtraIcons glamorousGo
]

{
	#category : #icons,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTPlayBindingThemer>>inspectIcon [

	^ GLMUIThemeExtraIcons glamorousInspect
]

{
	#category : #rows,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTPlayBindingThemer>>padding [

	^ 5
]

{
	#category : #icons,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTPlayBindingThemer>>removeIcon [

	^ GLMUIThemeExtraIcons glamorousRemove
]

{
	#category : #rows,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTPlayBindingThemer>>selectedColor [

	^ Color veryVeryLightGray alpha: 0.5
]
