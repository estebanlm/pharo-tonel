Extension {
	#name : #TClass
}

{
	#category : #'*Nautilus',
	#timestamp : ' 8/31/2017 05:26:22'
}
TClass>>dropIn: aRPackage forNautilusUI: aNautilusUI [
	aRPackage addClass: self theNonMetaClass.
	ActiveHand shiftPressed
		ifTrue: [ aNautilusUI selectedClass: nil.
			aNautilusUI updateClassView ]
		ifFalse: [ aNautilusUI selectedPackage: aRPackage.
			aNautilusUI selectedClass: self.
			aNautilusUI updatePackageGroupAndClassList ]
]
