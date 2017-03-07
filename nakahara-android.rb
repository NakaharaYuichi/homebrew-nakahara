# Documentation: https://github.com/Homebrew/homebrew/blob/master/share/doc/homebrew/Formula-Cookbook.md
#                http://www.rubydoc.info/github/Homebrew/homebrew/master/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class NakaharaAndroid < Formula
  desc "create develop environment for android"
  homepage "http://www.google.com" # dummy
  url "http://www.google.com" # dummy
  version "1.1.0"

  def need_sdk_list
    [
      "tools",
      "platform-tools",
      "build-tools-21.1.2",
      "build-tools-22.0.1",
      "build-tools-23.0.2",
      "build-tools-23.0.3",
      "build-tools-24.0.0",
      "build-tools-24.0.1",
      "android-23",
      "android-22",
      "android-21",
      "android-20",
      "android-19",
      "android-18",
      "android-17",
      "android-16",
      "android-15",
      "android-14",
      "extra-android-m2repository",
      "extra-android-support",
      "extra-google-google_play_services",
      "extra-google-m2repository",
    ]
  end
  depends_on "android-sdk" => :build
  depends_on "android-ndk" => :recommended
  depends_on "ant" => :recommended
  depends_on "gradle" => :recommended

  def install
    args = need_sdk_list().join(",")
    system "echo y | #{HOMEBREW_PREFIX}/bin/android update sdk --all --no-ui --filter #{args}"
    system "touch #{prefix}/dummy"
  end

  def caveats; <<-EOS.undent
    You must install JDK and setup JAVA_HOME environment variable.
      brew cask install java
      export JAVA_HOME=`/usr/libexec/java_home -v 1.8`
      export STUDIO_JDK=${JAVA_HOME} # for Android Studio

    You may need to add the following to your .bashrc:
      export ANDROID_HOME=#{HOMEBREW_PREFIX}/opt/android-sdk
      export ANDROID_SDK_ROOT=${ANDROID_HOME}
      export ANDROID_NDK_ROOT=#{HOMEBREW_PREFIX}/opt/android-ndk
      export NDK_ROOT=${ANDROID_NDK_ROOT}
    EOS
  end
end

