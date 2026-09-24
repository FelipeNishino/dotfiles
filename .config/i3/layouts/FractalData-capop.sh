#!/bin/sh

i3FDCapop_main() {
    i3FDCapop_dir="$HOME/Projects/FractalData/FractalAbbottCapOp/"
    i3-msg workspace code
    i3-msg append_layout $HOME/.config/i3/layouts/FractalData.json
    (dex "$HOME/.local/share/applications/afdaifkr.desktop") &
    (alacritty --class "Alacritty,nvim-coding" --working-directory "$i3FDCapop_dir" --hold -e zsh -c nvim . )&
    (alacritty --class "Alacritty,lazygit" --working-directory "$i3FDCapop_dir" -e zsh -c lazygit) &
    (alacritty --class "Alacritty,frontend-runner" --working-directory "$i3FDCapop_dir" --hold -e npm start) &
    (alacritty --class "Alacritty,backend-runner" --working-directory "$i3FDCapop_dir" --hold -e dotnet run) &
    (alacritty --class "Alacritty,project-term" --working-directory "$i3FDCapop_dir") &
    (alacritty --class "Alacritty,nvim-coding" --hold -e zsh -c 'nvim .') &
}

i3FDCapop_main "$@"
