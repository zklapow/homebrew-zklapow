class Spotifysync < Formula
  desc "Synced spotify playing"
  url "https://github.com/zklapow/SpotifySync/releases/download/v0.0.6/dist.zip"
  sha256 "9ade5956db0f2f35599559531dd59e775db7222da9920eb0687ab5bc7e4ce857"
  version "0.0.6"

  # depends_on "cmake" => :build
  depends_on "libspotify"
  depends_on "portaudio"

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

