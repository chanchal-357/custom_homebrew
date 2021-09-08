# PLEASE DO NOT EDIT THIS FILE. EDIT Templates/adoptopenjdk.rb.tmpl
cask "adoptopenjdk8" do
  version "8,265:b01"
  sha256 "db8b19f943bf96774a805b646b2c0ddd532123391e2e3873fe3720558e6091fe"

  # github.com/AdoptOpenJDK was verified as official when first introduced to the cask
  url "https://github.com/AdoptOpenJDK/openjdk8-binaries/releases/download/jdk8u265-b01/OpenJDK8U-jdk_x64_mac_hotspot_8u265b01.pkg"
  appcast "https://github.com/adoptopenjdk/openjdk#{version.before_comma}-binaries/releases/latest"
  name "AdoptOpenJDK 8"
  homepage "https://adoptopenjdk.net/"

  pkg "OpenJDK8U-jdk_x64_mac_hotspot_8u265b01.pkg"

  postflight do
    system_command "/usr/sbin/pkgutil", args: ["--pkg-info", "net.adoptopenjdk.8.jdk"], print_stdout: true
  end

  uninstall pkgutil: "net.adoptopenjdk.8.jdk"
end