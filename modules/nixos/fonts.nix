{ pkgs, ... }:

{
  fonts.packages = with pkgs; [
    inter
    rubik
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-emoji
    fira-code
    jetbrains-mono
    font-awesome
    terminus_font
    victor-mono
    nerd-fonts.jetbrains-mono
    nerd-fonts.fira-code
    nerd-fonts.fantasque-sans-mono
  ];
}
