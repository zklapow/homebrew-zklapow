class Spotifysync < Formula
  desc "Synced spotify playing"
  url "https://github.com/zklapow/SpotifySync/releases/download/v0.0.5/dist.zip"
  sha256 "c92f268e7e85e5fa0f3d5963671959aa02582d9592d42f8a3b40be394cb7d3c8"
  version "0.0.5"

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

