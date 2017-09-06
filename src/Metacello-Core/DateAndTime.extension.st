Extension {
	#name : #DateAndTime
}

{
	#category : #'*Metacello-Core',
	#timestamp : ' 8/31/2017 07:16:49'
}
DateAndTime>>setTimestampInMetacelloConfig: aMetacelloConfig [
    aMetacelloConfig setTimestampWithString: self printString
]

{
	#category : #'*Metacello-Core',
	#timestamp : ' 8/31/2017 07:16:49'
}
DateAndTime>>setTimestampInMetacelloVersion: aMetacelloVersionSpec [

	aMetacelloVersionSpec setTimestamp: 
		(aMetacelloVersionSpec project valueHolderSpec
			value: self printString;
			yourself)
]
