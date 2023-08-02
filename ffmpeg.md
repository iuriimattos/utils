  ffmpeg -i .\20230616_155604.mp4 -vcodec libvpx-vp9 -b:v 1M -acodec libvorbis output_file_name.mp4

  ffmpeg -an -i 2023_08_02_18_15_14.mp4 -vcodec libx264 -pix_fmt yuv420p -profile:v baseline -level 3 output_file_name.mp4
