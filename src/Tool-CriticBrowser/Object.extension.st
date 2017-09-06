Extension {
	#name : #Object
}

{
	#category : #'*Tool-CriticBrowser',
	#timestamp : ' 8/31/2017 05:26:37'
}
Object>>populateCBMenu: aMenu [

	aMenu add: 'Browse' target: self selector: #browse
]
