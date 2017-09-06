"
STONTestUser2 extends STONTestUser with explicit implementations of #fromSton: and #stonOn:
"
Class {
	#name : #STONTestUser2,
	#superclass : #STONTestUser,
	#category : #STON-Tests,
	#timestamp : 'SvenVanCaekenberghe 2/10/2012 20:20'
}

{
	#category : #ston-core,
	#timestamp : ' 8/31/2017 05:26:46'
}
STONTestUser2 class>>stonName [
	^ #TestUser2
]

{
	#category : #ston-core,
	#timestamp : ' 8/31/2017 05:26:46'
}
STONTestUser2>>fromSton: stonReader [
	stonReader parseMapDo: [ :key :value |
		key = #username ifTrue: [ username := value ].
		key = #password ifTrue: [ password := value ].
		key = #enabled ifTrue: [ enabled := value ] ]
	
]

{
	#category : #ston-core,
	#timestamp : ' 8/31/2017 05:26:46'
}
STONTestUser2>>stonOn: stonWriter	 [
	stonWriter writeObject: self streamMap: [ :dictionary |
		dictionary
			at: #username put: username;
			at: #password put: password;
			at: #enabled put: enabled ]
]
