import subprocess

import youtube_dl


def ydl_info():
    ydl_opts = {
        'format': 'bestvideo[height<=720][tbr>1][filesize>0.05M]',
        'outtmpl': '%(id)s.%(ext)s',  # Template for output names.
    }

    # def ydl_info():
    #     ydl_opts = {
    #         'format': 'bestaudio/best',
    #         'outtmpl': '%(id)s.%(ext)s',  # Template for output names.
    #     }

    with youtube_dl.YoutubeDL(ydl_opts) as ydl:
        info = ydl.extract_info(
            'https://www.youtube.com/watch?v=qZjWUkohSQg',
            download=False  # False for just extract the info
        )
    return info


def ffmpeg_cut():
    info = ydl_info()

    URL = info['formats'][-1][
        'url']  # media_url # If there are several media formats then to get media url for the last format:
    START = '00:00:0.00'  # start time remaing to slice the stream
    END = '00:00:03.00'  # end time remaing to slice the stream
    # OUTPUT = os.path.join(args.output, args.name+args.format)
    # print('Output:', OUTPUT)
    # ffmpeg -ss 00:00:15.00 -i "OUTPUT-OF-FIRST URL" -t 00:00:10.00 -c copy out.mp4
    # cmd = "ffmpeg -ss {} -i {} -t {} -c copy {}".format(START, URL, END, OUTPUT)
    # subprocess.call([
    #     'ffmpeg',
    #     '-i',  URL,
    #     '-ss', START,
    #     '-t',  END,
    #     '-c:a', 'copy', OUTPUT, # '-c:v' copies only video and '-c:a' only audio
    # ])
    # return None
    subprocess.call([
        'ffmpeg',
        '-ss', START,
        '-i', URL,
        '-t', END,
        '-c', 'copy', 'out.mp4'
    ])
    return None


if __name__ == '__main__':
    ffmpeg_cut()
