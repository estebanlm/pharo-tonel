Extension {
	#name : #ComposableModel
}

{
	#category : #'*OSWindow-Core',
	#timestamp : ' 8/31/2017 05:26:40'
}
ComposableModel>>openExternalWindowWithSpec [
    "Build the widget using the default spec and display it into the world"

    ^ self openExternalWindowWithSpec: self defaultSpecSelector.

]

{
	#category : #'*OSWindow-Core',
	#timestamp : ' 8/31/2017 05:26:40'
}
ComposableModel>>openExternalWindowWithSpec: aSpec [
    "Build the widget using the spec name provided as argument and display it into the world"

    ^ self openExternalWindowWithSpecLayout: (self retrieveSpec: aSpec)
]

{
	#category : #'*OSWindow-Core',
	#timestamp : ' 8/31/2017 05:26:40'
}
ComposableModel>>openExternalWindowWithSpecLayout: aSpec [
    "Build the widget using the spec name provided as argument and display it into the world"

    (window value notNil and: [ self needRebuild not ])
        ifTrue: [
            window value rebuildWithSpecLayout: aSpec ]
        ifFalse: [ 
            window value: (OSWindowWorldMorphModel new model: self).
            window value openWithSpecLayout: aSpec.
            self takeKeyboardFocus ].
        
    ^ window value

]
