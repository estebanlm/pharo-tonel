Extension {
	#name : #TextStyle
}

{
	#category : #'*Rubric',
	#timestamp : ' 8/31/2017 05:26:20'
}
TextStyle>>privateTabsArray: anArray [
	"DefaultTab := anArray first.
	DefaultTabsArray := anArray."
	tabsArray := anArray.
	marginTabsArray := tabsArray collect: [ :t | Array with: t with: t ]

]

{
	#category : #'*Rubric',
	#timestamp : ' 8/31/2017 05:26:20'
}
TextStyle>>rubTabWidth [
	 ^ tabsArray first
]
