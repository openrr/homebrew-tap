# This file is @generated by formula.sh.
# It is not intended for manual editing.
class UrdfViz < Formula
  desc "URDF visualizer"
  homepage "https://github.com/openrr/urdf-viz"
  version "0.43.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/openrr/urdf-viz/releases/download/v0.43.0/urdf-viz-x86_64-apple-darwin.tar.gz"
      sha256 "c78502937c4cd399d2da2842d78858b2b77effcf011f126dd0f54735228490fc"
    end
  end
  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/openrr/urdf-viz/releases/download/v0.43.0/urdf-viz-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "118365557e26e168cb8a64b4cfaf66685b07bacb4ae5948c0b1d87ca7ba1d75d"
    end
  end

  def install
    bin.install "urdf-viz"
  end

  test do
    system "#{bin}/urdf-viz", "--version"
  end
end
