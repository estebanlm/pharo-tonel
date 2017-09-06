"
I'm a specialized error that is invoked when trying to load a method for a non existing class. 

By default this exception is not resumable but it can be set and used for example as follow:


	[ FileStream fileIn: aFile ]
		on: MissingClassError
		do: [ :exception | 
				exception defineClass. 
				exception asResumable.
				exception resume. ]
			
			
So we give the possibility to compile and resume compution.
The method defineClass defines a simple class inheriting from Object (or from the class specified using #superclassName:)
The idea is that if later the effective class is loaded its definition will override  this one. 
"
Class {
	#name : #MissingClassError,
	#superclass : #Error,
	#instVars : [
		'resumable',
		'className',
		'superclassName'
	],
	#category : #CodeImport,
	#timestamp : '<historical>'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:32'
}
MissingClassError class>>className: aString [

	^ self new className: aString; yourself
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 07:16:32'
}
MissingClassError>>asResumable [
	"When sent to the receiver, this one turns into a resumable exception allowing for example to define missing class on the fly."
	resumable := true.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:32'
}
MissingClassError>>className: aString [

	className := aString
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 07:16:32'
}
MissingClassError>>defineClass [

	Smalltalk compiler evaluate: 
		self superclassName,  ' subclass: #', className, 
	' instanceVariableNames: ''''
	classVariableNames: ''''
	poolDictionaries: ''''
	category: ''Stub-Classes'''
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:32'
}
MissingClassError>>isResumable [
	"Determine whether an exception is resumable. By default not but can be resumable using accessors at exception raising time."

	^ resumable ifNil: [ super isResumable ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:32'
}
MissingClassError>>superclassName [

	^ superclassName ifNil: [ superclassName := 'Object' ]

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:32'
}
MissingClassError>>superclassName: aString [

	superclassName := aString

]
