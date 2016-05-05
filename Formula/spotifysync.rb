class Spotifysync < Formula
  desc "Synced spotify playing"
  url "https://github.com/zklapow/SpotifySync/releases/download/0.0.4/dist.zip"
  sha256 "5615ae196e08019741f5acfa5a6a3dd5b09456b3c544adc4c7922d437b7b39d7"
  version "0.0.4"

  # depends_on "cmake" => :build
  depends_on "homebrew/binary/libspotify"
  depends_on "homebrew/binary/portaudio"

  def install
    system "ls"
    bin.install "release/spotifysyncclient", "release/spotifysync"
    mkdir_p etc/"spotifysync"
    FileUtils.install "release/config.toml", etc/"spotifysync/"
    FileUtils.install "release/spotify_appkey.key", etc/"spotifysync/"
    if !File.exist?(HOMEBREW_PREFIX/"opt/libspotify/lib/libspotify")
      ln_s HOMEBREW_PREFIX/"opt/libspotify/lib/libspotify.dylib", HOMEBREW_PREFIX/"opt/libspotify/lib/libspotify"
    end
    # system "./configure", "--prefix=#{prefix}", "--disable-debug", "--disable-dependency-tracking"
    # system "cmake", ".", *std_cmake_args
    # system "make", "install"
  end
end

