"
I am an error signalled when a variable is redeclared. For instance when a method is created wich has a temporary or argument with the same name as an instance variable.
"
Class {
	#name : #DuplicatedVariableError,
	#superclass : #Error,
	#instVars : [
		'superclass',
		'variable'
	],
	#category : #Kernel-Exceptions,
	#timestamp : '<historical>'
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:33'
}
DuplicatedVariableError>>isResumable [
        ^true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
DuplicatedVariableError>>superclass [
        "The superclass in which the variable is defined"
        ^superclass
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
DuplicatedVariableError>>superclass: aSuperclass [
        "The superclass in which the variable is defined"
        superclass := aSuperclass
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
DuplicatedVariableError>>variable [
        "Name of the duplicate variable"
        ^variable
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
DuplicatedVariableError>>variable: aVariable [
        "Name of the duplicate variable"
        variable := aVariable
]
