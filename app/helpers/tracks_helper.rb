module TracksHelper
  include ERB::Util

  def ugly_lyrics(lyrics)
    separate_lines = lyrics.split(/\n/)
    separate_lines.map! do |line|
      line = "&#9835; #{line}".chomp
    end
    "<pre>#{separate_lines.join("\n")}</pre".html_safe
  end
end
