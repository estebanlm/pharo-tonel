"
SUnit API documentation for help system
"
Class {
	#name : #SUnitAPIDocumentation,
	#superclass : #SUnitHelp,
	#category : #SUnit-Help,
	#timestamp : 'TorstenBergmann 2/12/2014 23:13'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
SUnitAPIDocumentation class>>bookName [
	^'API Documentation'
]

{
	#category : #defaults,
	#timestamp : ' 8/31/2017 05:26:20'
}
SUnitAPIDocumentation class>>builder [
	^PackageAPIHelpBuilder
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
SUnitAPIDocumentation class>>helpPackages [
	^#('SUnit-Core-Announcements' 'SUnit-Core-Extensions' 'SUnit-Core-Kernel' 'SUnit-Core-Kernel' 'SUnit-Core-Utilities' 'SUnit-Tests' 'SUnit-UI')
]
