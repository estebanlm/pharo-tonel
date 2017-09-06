"
#define LF_FACESIZE 32
typedef struct tagLOGFONT { 
  LONG lfHeight; 
  LONG lfWidth; 
  LONG lfEscapement; 
  LONG lfOrientation; 
  LONG lfWeight; 
  BYTE lfItalic; 
  BYTE lfUnderline; 
  BYTE lfStrikeOut; 
  BYTE lfCharSet; 
  BYTE lfOutPrecision; 
  BYTE lfClipPrecision; 
  BYTE lfQuality; 
  BYTE lfPitchAndFamily; 
  TCHAR lfFaceName[LF_FACESIZE]; 
} LOGFONT, *PLOGFONT;
"
Class {
	#name : #LOGFONTA,
	#superclass : #Alien,
	#type : #bytes,
	#category : #Alien-Win32,
	#timestamp : ''
}

{
	#category : #constants,
	#timestamp : ' 8/31/2017 05:26:09'
}
LOGFONTA class>>DEFAULTCHARSET "actually DEFAULT_CHARSET" [
	^1
	
"
#define ANSI_CHARSET            0
#define DEFAULT_CHARSET         1
#define SYMBOL_CHARSET          2
#define SHIFTJIS_CHARSET        128
#define HANGEUL_CHARSET         129
#define HANGUL_CHARSET          129
#define GB2312_CHARSET          134
#define CHINESEBIG5_CHARSET     136
#define OEM_CHARSET             255
#define JOHAB_CHARSET           130
#define HEBREW_CHARSET          177
#define ARABIC_CHARSET          178
#define GREEK_CHARSET           161
#define TURKISH_CHARSET         162
#define VIETNAMESE_CHARSET      163
#define THAI_CHARSET            222
#define EASTEUROPE_CHARSET      238
#define RUSSIAN_CHARSET         204
#define MAC_CHARSET             77
#define BALTIC_CHARSET          186
"
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:09'
}
LOGFONTA class>>dataSize [
	^60

"
#define LF_FACESIZE 32
typedef struct tagLOGFONT { 
  LONG lfHeight; 
  LONG lfWidth; 
  LONG lfEscapement; 
  LONG lfOrientation; 
  LONG lfWeight; 
  BYTE lfItalic; 
  BYTE lfUnderline; 
  BYTE lfStrikeOut; 
  BYTE lfCharSet; 
  BYTE lfOutPrecision; 
  BYTE lfClipPrecision; 
  BYTE lfQuality; 
  BYTE lfPitchAndFamily; 
  TCHAR lfFaceName[LF_FACESIZE]; 
} LOGFONT, *PLOGFONT;"
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:09'
}
LOGFONTA>>lfCharset "^<Integer>" [
	self unsignedByteAt: 24
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:09'
}
LOGFONTA>>lfCharset: charset "<Integer>" [
	self unsignedByteAt: 24 put: charset
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:09'
}
LOGFONTA>>lfFaceName [
	^self strcpyFrom: 29
]
