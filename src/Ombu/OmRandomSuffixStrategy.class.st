"
I attach random characters as a suffix to the name (after last _).
"
Class {
	#name : #OmRandomSuffixStrategy,
	#superclass : #OmSuffixAfterDotStrategy,
	#category : #Ombu-Strategies,
	#timestamp : 'MartinDias 1/21/2017 03:05'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
OmRandomSuffixStrategy>>nextSuffix [

	^ UUID new asString36
]
