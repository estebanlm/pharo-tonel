"
int CALLBACK EnumFontFamExProc(
  ENUMLOGFONTEX *lpelfe,    // logical-font data
  NEWTEXTMETRICEX *lpntme,  // physical-font data
  DWORD FontType,           // type of font
  LPARAM lParam             // application-defined data
);

"
Class {
	#name : #EnumFontFamExProc,
	#superclass : #Alien,
	#type : #bytes,
	#category : #Alien-Win32,
	#timestamp : 'eem 11/28/2007 14:00'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:09'
}
EnumFontFamExProc class>>dataSize [
	^16
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:09'
}
EnumFontFamExProc>>FontType [
	"DWORD FontType,           // type of font"
	^self unsignedLongAt: 9
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:09'
}
EnumFontFamExProc>>lParam [
	"LPARAM lParam             // application-defined data"
	^self unsignedLongAt: 13
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:09'
}
EnumFontFamExProc>>logicalFontData [
	"Convenience for ENUMLOGFONTEX *lpelfe,    // logical-font data"
	^ENUMLOGFONTEXA atAddress: (self unsignedLongAt: 1)
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:09'
}
EnumFontFamExProc>>lpelfe [
	"ENUMLOGFONTEX *lpelfe,    // logical-font data"
	^self unsignedLongAt: 1
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:09'
}
EnumFontFamExProc>>lpntme [
	"NEWTEXTMETRICEX *lpntme,  // physical-font data"
	^self unsignedLongAt: 5
]
