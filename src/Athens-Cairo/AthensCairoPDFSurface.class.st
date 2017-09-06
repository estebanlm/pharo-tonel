"
i am a concrete implementation of Athens surface which using cairo graphics library for rendering for generating PDF files
as output.

<currently it is not functional and need more testing and coding>
"
Class {
	#name : #AthensCairoPDFSurface,
	#superclass : #AthensCairoSurface,
	#category : #Athens-Cairo,
	#timestamp : '<historical>'
}

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoPDFSurface class>>createPDF: fileName width: width_in_points height: height_in_points [

	<primitive: #primitiveNativeCall module: #NativeBoostPlugin>
	
	^self nbCall: #(AthensCairoPDFSurface cairo_pdf_surface_create (String fileName,
                                                      double width_in_points,
                                                      double height_in_points) )

]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoPDFSurface class>>extent: anExtent fileName: fileName [

	^ (self createPDF: fileName width: anExtent x height: anExtent y) initialize
]

{
	#category : #'finalize resources',
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoPDFSurface class>>finalizeResourceData: handle [

	self destroySurfaceHandle: handle.

]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoPDFSurface class>>registerSurface: surface [
	"do not register my instances with SurfacePlugin"
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoPDFSurface>>resourceData [
	^ handle value 
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoPDFSurface>>showPage [

	<primitive: #primitiveNativeCall module: #NativeBoostPlugin>
	
	^self nbCall: #( void cairo_surface_show_page (self) )
]
