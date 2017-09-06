Extension {
	#name : #GLMMorphicRenderer
}

{
	#category : #'*Glamour-FastTable',
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMMorphicRenderer>>renderFastListPresentation: aPresentation  [
	^ GLMMorphicFastListRenderer render: aPresentation from: self
]

{
	#category : #'*Glamour-FastTable',
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMMorphicRenderer>>renderFastTablePresentation: aPresentation  [
	^ GLMMorphicFastTableRenderer render: aPresentation from: self
]

{
	#category : #'*Glamour-FastTable',
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMMorphicRenderer>>renderFastTreePresentation: aPresentation  [
	^ GLMMorphicFastTreeRenderer render: aPresentation from: self
]

{
	#category : #'*Glamour-FastTable',
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMMorphicRenderer>>renderFastTreeWithColumnsPresentation: aPresentation  [
	^ GLMMorphicFastTreeWithColumnsRenderer render: aPresentation from: self
]
