"

"
Class {
	#name : #GLMPagerWidgetThemer,
	#superclass : #Object,
	#category : #Glamour-Morphic-Pager-Theme,
	#timestamp : ''
}

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPagerWidgetThemer>>defaultScrollButtonStyleFor: aButton [

	aButton checkedIcon: GLMUIThemeExtraIcons glamorousGrayCircleEmpty.
	aButton checkedFocusedIcon: GLMUIThemeExtraIcons glamorousGrayCircle.
	
	aButton normalImage: GLMUIThemeExtraIcons glamorousGrayCircleEmpty.
	aButton selectedImage: GLMUIThemeExtraIcons glamorousGrayCircle.
	aButton checkedImage: aButton checkedIcon.
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPagerWidgetThemer>>previewPaneStyleFor: aMorph [

	aMorph borderColor: (Color lightGray)
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPagerWidgetThemer>>selectedPaneStyleFor: aMorph [

	aMorph borderColor: (Color transparent)
]
