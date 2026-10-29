{ pkgs, config, ... }:

let
  # Rosé Pine (main) palette
  c = {
    base = "#191724";
    surface = "#1f1d2e";
    overlay = "#26233a";
    muted = "#6e6a86";
    subtle = "#908caa";
    text = "#e0def4";
    love = "#eb6f92";
    gold = "#f6c177";
    rose = "#ebbcba";
    pine = "#31748f";
    foam = "#9ccfd8";
    iris = "#c4a7e7";
    hlLow = "#21202e";
    hlMed = "#403d52";
    hlHigh = "#524f67";
  };
in
{
  services.mpd = {
    enable = true;
    musicDirectory = "${config.home.homeDirectory}/Music";
    extraConfig = ''
      audio_output {
        type "pipewire"
        name "PipeWire"
      }
    '';
  };

  # optional: lets media keys / noctalia control mpd
  services.mpd-mpris.enable = true;

  programs.rmpc = {
    enable = true;

    config = ''
      #![enable(implicit_some)]
      #![enable(unwrap_newtypes)]
      #![enable(unwrap_variant_newtypes)]
      (
          address: "127.0.0.1:6600",
          theme: Some("rose-pine"),
          cache_dir: Some("${config.xdg.cacheHome}/rmpc"),
      )
    '';
  };

  xdg.configFile."rmpc/themes/rose-pine.ron".text = ''
    #![enable(implicit_some)]
    #![enable(unwrap_newtypes)]
    #![enable(unwrap_variant_newtypes)]
    (
        default_album_art_path: None,
        show_song_table_header: true,
        draw_borders: true,
        browser_column_widths: [20, 38, 42],
        text_color: "${c.text}",
        background_color: "${c.base}",
        header_background_color: "${c.base}",
        modal_background_color: "${c.surface}",
        modal_backdrop: true,
        tab_bar: (
            enabled: true,
            active_style: (fg: "${c.base}", bg: "${c.iris}", modifiers: "Bold"),
            inactive_style: (fg: "${c.subtle}", bg: "${c.surface}"),
        ),
        highlighted_item_style: (fg: "${c.gold}", modifiers: "Bold"),
        current_item_style: (fg: "${c.base}", bg: "${c.rose}", modifiers: "Bold"),
        borders_style: (fg: "${c.hlHigh}"),
        highlight_border_style: (fg: "${c.iris}"),
        symbols: (
            song: "󰝚 ",
            dir: " ",
            playlist: "󰲸 ",
            marker: "* ",
            ellipsis: "...",
            song_style: None,
            dir_style: (fg: "${c.foam}"),
            playlist_style: (fg: "${c.iris}"),
        ),
        progress_bar: (
            symbols: ["█", "█", "█"],
            track_style: (fg: "${c.overlay}"),
            elapsed_style: (fg: "${c.iris}"),
            thumb_style: (fg: "${c.rose}", bg: "${c.overlay}"),
        ),
        scrollbar: (
            symbols: ["│", "█", "▲", "▼"],
            track_style: (fg: "${c.hlMed}"),
            ends_style: (fg: "${c.hlMed}"),
            thumb_style: (fg: "${c.iris}"),
        ),
        song_table_format: [
            (prop: (kind: Property(Track), style: (fg: "${c.muted}"), default: (kind: Text("-"))), width: "4", alignment: Right),
            (prop: (kind: Property(Title), style: (fg: "${c.text}"), default: (kind: Property(Filename))), width: "40%"),
            (prop: (kind: Property(Artist), style: (fg: "${c.foam}"), default: (kind: Text("Unknown"))), width: "30%"),
            (prop: (kind: Property(Album), style: (fg: "${c.subtle}"), default: (kind: Text("Unknown Album"))), width: "30%"),
            (prop: (kind: Property(Duration), style: (fg: "${c.gold}"), default: (kind: Text("-"))), width: "8", alignment: Right),
        ],
        layout: Split(
            direction: Vertical,
            panes: [
                (size: "3", pane: Pane(Tabs)),
                (size: "4", borders: "ALL", pane: Pane(Header)),
                (size: "100%", pane: Pane(TabContent)),
                (size: "3", borders: "ALL", pane: Pane(ProgressBar)),
            ],
        ),
        header: (
            rows: [
                (
                    left: [(kind: Property(Song(Title)), style: (fg: "${c.text}", modifiers: "Bold"),
                        default: (kind: Text("No Song"), style: (fg: "${c.muted}", modifiers: "Bold")))],
                    center: [(kind: Property(Song(Artist)), style: (fg: "${c.foam}", modifiers: "Bold"),
                        default: (kind: Text("Unknown Artist"), style: (fg: "${c.muted}", modifiers: "Bold")))],
                    right: [(kind: Property(Status(StateV2(playing_label: "Playing", paused_label: "Paused", stopped_label: "Stopped"))), style: (fg: "${c.iris}", modifiers: "Bold"))]
                ),
                (
                    left: [(kind: Property(Status(Elapsed)), style: (fg: "${c.subtle}")),
                           (kind: Text("/"), style: (fg: "${c.muted}")),
                           (kind: Property(Status(Duration)), style: (fg: "${c.subtle}"))],
                    center: [(kind: Property(Song(Album)), style: (fg: "${c.rose}"),
                        default: (kind: Text("Unknown Album"), style: (fg: "${c.muted}")))],
                    right: [(kind: Property(Status(RepeatV2(on_label: "rep", off_label: "rep", on_style: (fg: "${c.gold}", modifiers: "Bold"), off_style: (fg: "${c.muted}")))), style: (fg: "${c.gold}")),
                            (kind: Property(Status(RandomV2(on_label: "rnd", off_label: "rnd", on_style: (fg: "${c.gold}", modifiers: "Bold"), off_style: (fg: "${c.muted}")))), style: (fg: "${c.gold}"))]
                ),
            ],
        ),
    )
  '';
}
