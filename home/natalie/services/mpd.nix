{ pkgs, ... }:
let 
  dir = "~/music";
in {
  extraConfig = ''
    audio_output {
      type "pipewire"
      name "PipeWire Output"
    }
  '';
  network = {
    startWhenNeeded = true;
  };
  #dataDir = dir;
  #playlistDirectory = "${dir}/playlists";
  #musicDirectory = "${dir}/music";
}
