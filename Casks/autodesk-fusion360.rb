cask "autodesk-fusion360" do
  # NOTE: "360" is not a version number, but an intrinsic part of the product name
  version :latest
  sha256 :no_check

  url "https://dl.appstreaming.autodesk.com/production/installers/Fusion%20360%20Client%20Downloader.dmg"
  name "Autodesk Fusion 360"
  homepage "https://www.autodesk.com/products/fusion-360"

  installer script: "Install Autodesk Fusion 360.app/Contents/MacOS/Fusion 360 Client Downloader"

  uninstall quit: [
      "com.autodesk.fusion360",
      "com.autodesk.dls.streamer.scriptapp.Autodesk-Fusion-360",
    ],
    script: {
      executable: "#{staged_path}/Install Autodesk Fusion 360.app/Contents/MacOS/streamer",
      args: [
        "-p", "uninstall",
        "-a", "73e72ada57b7480280f7a6f4a289729f",
        "-s", "production",
        "--quiet"
      ],
    },
    delete: [
      "~/Applications/Autodesk Fusion 360.app",
      "~/Applications/Remove Autodesk Fusion 360.app",
    ]
end
