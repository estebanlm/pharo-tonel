"
A StickynessBugz is for mantis #5500 rectangles and ellipses don't act sticky when rotated even when they are..

Instance Variables

"
Class {
	#name : #StickynessBugsTest,
	#superclass : #MorphicUIBugTest,
	#category : #Morphic-Tests-Bugs,
	#timestamp : 'wiz 11/24/2006 00:24'
}

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:43'
}
StickynessBugsTest>>testForTiltedStickyness [
	"self new testForTiltedStickyness"

	"self run: #testForTiltedStickyness"

	| m |
	m := Morph new openCenteredInWorld.
	cases := Array with: m.	"save for tear down."
	self assert: m topRendererOrSelf isSticky not.
	m beSticky.
	self assert: m topRendererOrSelf isSticky.
	m addFlexShell.
	cases := Array with: m topRendererOrSelf.
	m topRendererOrSelf rotationDegrees: 45.0.
	self assert: m topRendererOrSelf isSticky.
	m beUnsticky.
	self assert: m topRendererOrSelf isSticky not.
	m topRendererOrSelf delete.
	^ true
]
