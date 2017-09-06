"
This is the default strategy that does nothing (an implementation of the Null pattern)
"
Class {
	#name : #GLMNoStrategy,
	#superclass : #GLMTransmissionStrategy,
	#category : #Glamour-Core,
	#timestamp : 'tg 2/20/2010 14:53'
}

{
	#category : #transmitting,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMNoStrategy>>transmitIn: aContext [
	"do nothing else then was already done by the transmission"
]
