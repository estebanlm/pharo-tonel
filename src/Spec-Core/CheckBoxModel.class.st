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
	#category : #Spec-Core-Widgets
}

{ #category : #specs }
CheckBoxModel class >> adapterName [

	^ #CheckBoxAdapter
]

{ #category : #specs }
CheckBoxModel class >> defaultSpec [
	<spec>
	
	^ #(CheckBoxAdapter
		adapt: #(model))
]

{ #category : #specs }
CheckBoxModel class >> title [

	^ 'Checkbox Button'
]

{ #category : #api }
CheckBoxModel >> labelOnLeft [

	^ self changed: #labelOnLeft with: #()
]

{ #category : #api }
CheckBoxModel >> labelOnRight [

	^ self changed: #labelOnRight with: #()
]
