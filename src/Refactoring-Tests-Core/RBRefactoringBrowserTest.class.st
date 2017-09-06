"

"
Class {
	#name : #RBRefactoringBrowserTest,
	#superclass : #TestCase,
	#category : #Refactoring-Tests-Core,
	#timestamp : ''
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:31'
}
RBRefactoringBrowserTest class>>isAbstract [
	^ self name = #RBRefactoringBrowserTest
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:31'
}
RBRefactoringBrowserTest>>convertInterval: anInterval for: aString  [
	"Convert the interval to ignore differences in end of line conventions."

	^anInterval
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:31'
}
RBRefactoringBrowserTest>>executeRefactoring: aRefactoring  [
	aRefactoring primitiveExecute.
	RBParser parseExpression: aRefactoring storeString
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:31'
}
RBRefactoringBrowserTest>>objectClassVariable [
	^Object classPool keys detect: [:each | true]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:31'
}
RBRefactoringBrowserTest>>proceedThroughWarning: aBlock  [
	aBlock on: RBRefactoringWarning do: [ :ex | ex resume ]
]
