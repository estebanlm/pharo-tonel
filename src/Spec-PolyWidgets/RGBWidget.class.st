"
I am a Spec widget  allowing a user to choose a Color by its RGB values and providing a preview.

self example

I am composed of a RGBSliders and an ImageModel that display simply a form of the current color.

I provide the following methods
- color a shortcut color to access the current color of the RGBSliders.
- makeNewForm return a fresh copy of the current displayed form.

I provide extentForPreview, a point used to define the size of the preview.
"
Class {
	#name : #RGBWidget,
	#superclass : #ComposableModel,
	#instVars : [
		'preview',
		'sliders',
		'extentForPreview'
	],
	#category : #Spec-PolyWidgets-RGBAndShape,
	#timestamp : 'Spirita 7/28/2016 13:25'
}

{
	#category : #specs,
	#timestamp : ' 8/31/2017 05:26:19'
}
RGBWidget class>>defaultSpec [
	<spec: #default>
	^ SpecLayout composed
		newColumn: [ :column | 
			column
				add: #preview;
				add: #sliders ];
		yourself
]

{
	#category : #example,
	#timestamp : ' 8/31/2017 05:26:19'
}
RGBWidget class>>example [
	| example |
	example := self new.
	example
		title: 'RGBWidget exampe';
		extent: 300 @ 250;
		openDialogWithSpec.
	^ example
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:19'
}
RGBWidget>>color [
 ^ sliders color
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:19'
}
RGBWidget>>initializePresenter [
	sliders whenChangedDo: [ preview image: self makeNewForm ].
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:19'
}
RGBWidget>>initializeWidgets [
	preview := self instantiate: ImageModel.
	sliders := self instantiate: RGBSliders.
	preview image: (Form extent: 30 @ 30 depth: 32).
	preview image: self makeNewForm.
	self focusOrder add: sliders
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:19'
}
RGBWidget>>makeNewForm [
	^ (Form extent: 30 @ 30 depth: 32) fillColor: self color
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
RGBWidget>>preview [
	^ preview
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
RGBWidget>>sliders [
	^ sliders
]

{
	#category : #api-events,
	#timestamp : ' 8/31/2017 05:26:19'
}
RGBWidget>>whenExtentForPreviewChanged: aBlock [
 extentForPreview whenChangedDo: aBlock 
]
