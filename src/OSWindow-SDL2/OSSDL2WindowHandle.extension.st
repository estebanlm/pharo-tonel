Extension {
	#name : #OSSDL2WindowHandle
}

{
	#category : #'*OSWindow-SDL2-OpenGL',
	#timestamp : ' 8/31/2017 05:26:40'
}
OSSDL2WindowHandle>>newOpenGLRenderer [
	^ renderer := OSSDL2GLRenderer new 
		window: self;
		createContext;
		yourself
]
