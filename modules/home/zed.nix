{
  ...
}:

{
  programs.zed-editor = {
    enable = true;
    extensions = [
      "nix"
      "toml"
      "rust"
      "cpp"
      "php"
      "html"
      "js"
      "catppuccin-icons"
      "copilot"
      "base16"
    ];
    userSettings = {
      hour_format = "hour24";
      vim_mode = false;
      show_edit_predictions = true;
      show_completions_on_input = true;
      assistant = {
        enabled = true;
        provider = "copilot";
      };
    };
  };
}
