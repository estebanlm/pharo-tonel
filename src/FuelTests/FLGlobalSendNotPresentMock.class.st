"
A test mock where a global send is not present
"
Class {
	#name : #FLGlobalSendNotPresentMock,
	#superclass : #Object,
	#category : #FuelTests-Mocks,
	#timestamp : 'TorstenBergmann 2/3/2014 23:22'
}

{
	#category : #serialization,
	#timestamp : ' 8/31/2017 05:26:30'
}
FLGlobalSendNotPresentMock>>fuelAccept: aGeneralMapper [

	^aGeneralMapper visitGlobalSend: self name: #FLKeyNotPresentInSmalltalks selector: #someSelector
]
