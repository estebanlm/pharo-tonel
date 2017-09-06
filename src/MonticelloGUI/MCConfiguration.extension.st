Extension {
	#name : #MCConfiguration
}

{
	#category : #'*MonticelloGUI',
	#timestamp : ' 8/31/2017 05:26:23'
}
MCConfiguration>>browse [

	^ (MCConfigurationBrowser new configuration: self) show
]
