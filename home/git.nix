# https://www.youtube.com/watch?v=G3NJzFX6XhY
{
  programs.git = {
    enable = true;
    userName = "JNetherwood-Imig";
    userEmail = "jacksonni752@gmail.com";
  };

  home.shellAliases = {
    ga = "git add";
    gc = "git commit";
    gp = "git pull";
    gu = "git push";
    gl = "git log";
    gd = "git diff";
    gs = "git status";
    gb = "git switch";
    gt = "git stash";
  };
}
