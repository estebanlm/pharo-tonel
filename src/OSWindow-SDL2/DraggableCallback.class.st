"
I represent a callback to make the window draggable from any chosen rectangle. Useful for undecorated windows.

Warning : Only available with SDL 2.0.4 or higher !
"
Class {
	#name : #DraggableCallback,
	#superclass : #FFICallback,
	#pools : [
		'SDL2Constants'
	],
	#category : #OSWindow-SDL2-Bindings,
	#timestamp : 'Matthieu 5/28/2015 14:52'
}

{
	#category : #'callback spec',
	#timestamp : ' 8/31/2017 05:26:40'
}
DraggableCallback class>>fnSpec [

	^'int ( SDL_Window aWindow, SDL_Point* pt, void* data )'
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:40'
}
DraggableCallback class>>on: aBlock [
	^ self 
		signature: self fnSpec
		block: aBlock
]
