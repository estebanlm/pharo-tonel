Extension {
	#name : #Trait
}

{
	#category : #'*Polymorph-Widgets-Themes',
	#timestamp : ' 8/31/2017 05:26:15'
}
Trait>>systemIconName [

	<localTraitMethod> 
    "This method is supposed to be local in Trait because of a good reason.
    We use this pragma to test if Trait does not contain some accidental 
    local selectors."

	^ #traitIcon
]
