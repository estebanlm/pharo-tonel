Extension {
	#name : #SystemNavigation
}

{
	#category : #'*NautilusCommon',
	#timestamp : ' 8/31/2017 05:26:22'
}
SystemNavigation>>browsedEnvironment: aBrowserEnvironment [

	environment := aBrowserEnvironment asSystemNavigationEnvironment
]
