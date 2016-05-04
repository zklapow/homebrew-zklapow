class SpotifySync < Formula
  desc "Synced spotify playing"
  url "https://github.com/zklapow/SpotifySync/releases/download/v0.0.1/dist.zip"
  sha256 "97b165652d8b885ff96b6985f46915760a5255c65a330b2b6219e3111e995b68"

  # depends_on "cmake" => :build
  depends_on "libspotify"
  depends_on "portaudio"
  depends_on "golang" => :build

  def install
    system "ls"
    # system "./configure", "--prefix=#{prefix}", "--disable-debug", "--disable-dependency-tracking"
    # system "cmake", ".", *std_cmake_args
    # system "make", "install"
  end
end

