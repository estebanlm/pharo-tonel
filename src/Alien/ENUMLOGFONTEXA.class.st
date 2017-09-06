"
#define LF_FULLFACESIZE 64
typedef struct tagENUMLOGFONTEX {
  LOGFONT  elfLogFont;
  TCHAR  elfFullName[LF_FULLFACESIZE];
  TCHAR  elfStyle[LF_FACESIZE];
  TCHAR  elfScript[LF_FACESIZE];
} ENUMLOGFONTEX, *LPENUMLOGFONTEX;

"
Class {
	#name : #ENUMLOGFONTEXA,
	#superclass : #LOGFONTA,
	#type : #bytes,
	#category : #Alien-Win32,
	#timestamp : 'eem 11/28/2007 14:31'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:09'
}
ENUMLOGFONTEXA class>>dataSize [
	^188
	
"
#define LF_FULLFACESIZE 64
typedef struct tagENUMLOGFONTEX {
  LOGFONT  elfLogFont;
  TCHAR  elfFullName[LF_FULLFACESIZE];
  TCHAR  elfStyle[LF_FACESIZE];
  TCHAR  elfScript[LF_FACESIZE];
} ENUMLOGFONTEX, *LPENUMLOGFONTEX;

"
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:09'
}
ENUMLOGFONTEXA>>elfFullName [
	^self strcpyFrom: 61
]
