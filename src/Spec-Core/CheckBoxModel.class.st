"
A CheckBoxModel is a spec model for Checkbox.
See AbstractFormButtonModel

self example

You can also have a look at CheckBoxExample for a full example of how to use them.

I provide the following methods
todo
- labelOnLeft and labelOnRight
- labelClickable
"
Class {
	#name : #CheckBoxModel,
	#superclass : #AbstractFormButtonModel,
	#category : #Spec-Core-Widgets,
	#timestamp : 'Spirita 6/29/2016 11:33'
}

{
	#category : #specs,
	#timestamp : ' 8/31/2017 05:26:18'
}
CheckBoxModel class>>adapterName [

	^ #CheckBoxAdapter
]

{
	#category : #specs,
	#timestamp : ' 8/31/2017 05:26:18'
}
CheckBoxModel class>>defaultSpec [
	<spec>
	
	^ #(CheckBoxAdapter
		adapt: #(model))
]

{
	#category : #specs,
	#timestamp : ' 8/31/2017 05:26:18'
}
CheckBoxModel class>>title [

	^ 'Checkbox Button'
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
CheckBoxModel>>labelOnLeft [

	^ self changed: #labelOnLeft with: #()
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
CheckBoxModel>>labelOnRight [

	^ self changed: #labelOnRight with: #()
]
