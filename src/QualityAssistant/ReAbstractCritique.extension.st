Extension {
	#name : #ReAbstractCritique
}

{
	#category : #'*qualityAssistant',
	#timestamp : ' 8/31/2017 05:26:37'
}
ReAbstractCritique>>color [

	^ ({
	#error -> Color red .
	#warning -> Color yellow .
	#information -> Color blue
	 } asDictionary at: rule severity ifAbsent: [ super color ]) alpha: 0.1

]
