using Microsoft.EntityFrameworkCore.Metadata.Internal;
using Microsoft.EntityFrameworkCore;

namespace MultimediaService.Context
{
    public class Multimedia
    {
        public int Id { get; set; }
        public string FileName { get; set; }
        public string FilePath { get; set; }
        public string CompressedPath { get; set; }
        public DateTime UploadDate { get; set; }
    }
    public class Image : Multimedia;
    public class Audio : Multimedia;
    public class Video : Multimedia;
}
