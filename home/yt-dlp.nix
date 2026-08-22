{ pkgs, ... }:
{
  programs.yt-dlp = {
    enable = true;

    settings = {
      format = "bestaudio";
      extract-audio = true;
      audio-format = "mp3";
      audio-quality = 0;

      embed-metadata = true;
      embed-thumbnail = true;
      embed-chapters = true;

      parse-metadata = [
        "%(uploader|)s:%(meta_artist)s"
        "%(webpage_url)s:%(meta_comment)s"
      ];

      output = "~/Music/Downloads/%(title)s.%(ext)s";
    };
  };

  home.packages = [
    pkgs.picard
    pkgs.ffmpeg
  ];
}
