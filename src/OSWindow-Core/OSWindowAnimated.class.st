"
I am an animated window who interacts with the OSWindowRenderThread
"
Class {
	#name : #OSWindowAnimated,
	#superclass : #OSWindow,
	#category : #OSWindow-Core-Extras,
	#timestamp : 'MerwanOuddane 8/20/2015 12:20'
}

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowAnimated>>destroy [
	OSWindowRenderThread destroyedWindow: self.
	super destroy
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowAnimated>>initWithAttributes: attributes [
	super initWithAttributes: attributes.
	self registerWindow.
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowAnimated>>registerWindow [
	OSWindowRenderThread createdWindow: self.
]
