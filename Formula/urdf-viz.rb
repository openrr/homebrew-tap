# This file is @generated by formula.sh.
# It is not intended for manual editing.
class UrdfViz < Formula
  desc "URDF visualizer"
  homepage "https://github.com/openrr/urdf-viz"
  version "0.30.0"
  license "Apache-2.0"
  bottle :unneeded

  if OS.mac?
    url "https://github.com/openrr/urdf-viz/releases/download/v0.30.0/urdf-viz-x86_64-apple-darwin.tar.gz"
    sha256 "4d510ff39db6576ef8e05db8834371e29f0a58844d8c8ae629901586d2170ee7"
  end
  if OS.linux?
    url "https://github.com/openrr/urdf-viz/releases/download/v0.30.0/urdf-viz-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "f6ffca32843e41a3a80cf75d02ea6950416d309e6aa08b9733307394d1115317"
  end

  def install
    bin.install "urdf-viz"
  end

  test do
    system "#{bin}/urdf-viz", "--version"
  end
end
