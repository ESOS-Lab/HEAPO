#ifndef __DW_FLTKIMGBUF_HH__
#define __DW_FLTKIMGBUF_HH__

#ifndef __INCLUDED_FROM_DW_FLTK_CORE_HH__
#   error Do not include this file directly, use "fltkcore.hh" instead.
#endif

namespace dw {
namespace fltk {

class FltkImgbuf: public core::Imgbuf
{
private:
   FltkImgbuf *root;
   int refCount;
   bool deleteOnUnref;
   lout::container::typed::List <FltkImgbuf> *scaledBuffers;

   int width, height;
   Type type;

//{
   int bpp;
   uchar *rawdata;
//}

   // This is just for testing drawing, it has to be replaced by
   // the image buffer.
   lout::misc::BitSet *copiedRows;

   FltkImgbuf (Type type, int width, int height, FltkImgbuf *root);
   //void init (Type type, int width, int height, FltkImgbuf *root); // POS (Changhun Jung)
   int scaledY(int ySrc);
   int isRoot() { return (root == NULL); }
   void detachScaledBuf (FltkImgbuf *scaledBuf);

protected:
   ~FltkImgbuf ();

public:
   FltkImgbuf (Type type, int width, int height);

   void init (Type type, int width, int height, FltkImgbuf *root); // POS (Changhun Jung)

   void setCMap (int *colors, int num_colors);
   inline void scaleRow (int row, const core::byte *data);
   void newScan ();
   void copyRow (int row, const core::byte *data);
   core::Imgbuf* getScaledBuf (int width, int height);
   void getRowArea (int row, dw::core::Rectangle *area);
   int  getRootWidth ();
   int  getRootHeight ();
   void ref ();
   void unref ();
   
   // POS (Changhun Jung)
   inline void unref_copied()
   {
		#if 0   
	    for (Iterator <FltkImgbuf> it = scaledBuffers->iterator(); it.hasNext(); ) {
	      FltkImgbuf *sb = it.getNext ();
	      sb->scaleRow(row, data);
	    }
		#endif	   
		this->copiedRows = NULL;		
   }
   
   inline void copyBits()
   {
		copiedRows->copyBitsImpl();
   }

   void copyBitsAll();


   bool lastReference ();
   void setDeleteOnUnref (bool deleteOnUnref);
   bool isReferred ();

   void draw (::fltk::Widget *target, int xRoot, int yRoot,
              int x, int y, int width, int height);
};

} // namespace dw
} // namespace fltk

#endif // __DW_FLTK_IMGBUF_HH__
