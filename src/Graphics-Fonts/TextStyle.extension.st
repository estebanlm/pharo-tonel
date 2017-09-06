Extension {
	#name : #TextStyle
}

{
	#category : #'*Graphics-Fonts',
	#timestamp : ' 8/31/2017 05:26:13'
}
TextStyle class>>pixelsPerInch: aNumber [
  "Set the nominal number of pixels per inch to aNumber."
  TextSharedInformation at: #pixelsPerInch put: aNumber asFloat.
  self changed: #textDPIChanged.

]
