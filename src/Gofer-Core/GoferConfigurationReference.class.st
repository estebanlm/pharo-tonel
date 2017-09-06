"
A GoferPackageReference refers to the latest version of a Monticello package representing a Metacello Configuration.
"
Class {
	#name : #GoferConfigurationReference,
	#superclass : #GoferPackageReference,
	#category : #Gofer-Core,
	#timestamp : '<historical>'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:48'
}
GoferConfigurationReference>>configurationClass [
	^ Smalltalk globals at: self configurationName asSymbol
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:48'
}
GoferConfigurationReference>>configurationName [
	^ 'ConfigurationOf', name
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:48'
}
GoferConfigurationReference>>isConfigurationReference [
	^ true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:48'
}
GoferConfigurationReference>>name [
	^ self configurationName 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:48'
}
GoferConfigurationReference>>packageName [
	^ self configurationName
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:48'
}
GoferConfigurationReference>>project [
	^ self configurationClass project
]
