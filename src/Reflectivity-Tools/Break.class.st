"
I am a Breakpoint signal.

use class Breakpoint to insert me reflectively
"
Class {
	#name : #Break,
	#superclass : #Halt,
	#category : #Reflectivity-Tools-Breakpoints,
	#timestamp : 'MarcusDenker 11/13/2015 11:08'
}

{
	#category : #break,
	#timestamp : ' 8/31/2017 05:26:28'
}
Break class>>break  [
	<debuggerCompleteToSender>
	self signal
]
