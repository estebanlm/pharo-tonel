"
I attach a timestamp as a suffix to the name (after last _).
"
Class {
	#name : #OmTimeStampSuffixStrategy,
	#superclass : #OmSuffixAfterDotStrategy,
	#category : #Ombu-Strategies,
	#timestamp : 'MartinDias 1/21/2017 03:04'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
OmTimeStampSuffixStrategy>>nextSuffix [

	^ DateAndTime now asNanoSeconds printStringHex
]
