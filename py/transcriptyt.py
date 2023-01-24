from youtube_transcript_api import YouTubeTranscriptApi
from youtube_transcript_api.formatters import TextFormatter
# https://www.youtube.com/watch?v=XPTO
# https://www.youtube.com/watch?v=FOO
# https://www.youtube.com/watch?v=BAR
video_ids = ['XPTO','FOO','BAR']
for video_id in video_ids:
    transcript_list = YouTubeTranscriptApi.list_transcripts(video_id)
    transcript = transcript_list.find_transcript(['pt'])
    formatter = TextFormatter()
    txt_formatted = formatter.format_transcript(transcript.translate('pt').fetch())
    with open(video_id+'.txt', 'w', encoding='utf-8') as txt_file:
        txt_file.write(txt_formatted)
        txt_file.close()
