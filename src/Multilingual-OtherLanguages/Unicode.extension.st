Extension {
	#name : #Unicode
}

{
	#category : #'*Multilingual-OtherLanguages',
	#timestamp : ' 8/31/2017 05:26:15'
}
Unicode class>>isJapanese: code [

	^ code > 255 and: [(JISX0208 charFromUnicode: code) notNil].

]

{
	#category : #'*Multilingual-OtherLanguages',
	#timestamp : ' 8/31/2017 05:26:15'
}
Unicode class>>isKorean: code [

	^ code > 255 and: [(KSX1001 charFromUnicode: code) notNil]


]

{
	#category : #'*Multilingual-OtherLanguages',
	#timestamp : ' 8/31/2017 05:26:15'
}
Unicode class>>isSimplifiedChinese: code [

	^ code > 255 and: [(GB2312 charFromUnicode: code) notNil]



]

{
	#category : #'*Multilingual-OtherLanguages',
	#timestamp : ' 8/31/2017 05:26:15'
}
Unicode class>>isTraditionalChinese: code [

	^ false.

]

{
	#category : #'*Multilingual-OtherLanguages',
	#timestamp : ' 8/31/2017 05:26:15'
}
Unicode class>>isUnifiedKanji: code [
	^ ((((code between: 16r2E80 and: 16rA4CF)
		or: [ code between: 16rF900 and: 16rFAFF ])
			or: [ code between: 16rFE30 and: 16rFE4F ]) 
				or: [ code between: 16rFF00 and: 16rFFEF ])
					or: [ code between: 16r20000 and: 16r2FA1F ]
]
