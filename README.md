# cbonsai 🎄

<img src="image.png" align="right" width="400px">

`cbonsai` is a bonsai tree generator, written in `C` using `ncurses`. It intelligently creates, colors, and positions a bonsai tree, and is entirely configurable via CLI options-- see [usage](#usage). There are 2 modes of operation: `static` (see finished bonsai tree), and `live` (see growth step-by-step).

## 🎄 Christmas Edition Fork

**This is a fork of the original [cbonsai by jallbrit](https://gitlab.com/jallbrit/cbonsai)** with added ornament features! 

This version adds Christmas-themed ornaments to your bonsai trees, perfect for the holiday season. You can now decorate your terminal trees with customizable ornaments, adjustable frequency, and custom colors.

**New Features:**
- `-o, --ornament=LIST` - Add custom ornament characters (like `*`, `@`, `O`, `🎄`, `⭐`, etc.)
- `-f, --frequency=INT` - Control ornament frequency (0-100%)
- `-O, --ornament-color=INT` - Set custom ornament colors

Try it: `cbonsai -l -o "🎄,⭐,🎁,🔔" -f 25 -O 9`

---

## Installation

### Nix / NixOS

You can build and run `cbonsai` using the Nix flake:

```bash
# Run directly without installing
nix run github:castrozan/cbonsai
```

## Usage

```
Usage: cbonsai [OPTION]...

cbonsai is a beautifully random bonsai tree generator.

Options:
  -l, --live             live mode: show each step of growth
  -t, --time=TIME        in live mode, wait TIME secs between
                           steps of growth (must be larger than 0) [default: 0.03]
  -i, --infinite         infinite mode: keep growing trees
  -w, --wait=TIME        in infinite mode, wait TIME between each tree
                           generation [default: 4.00]
  -S, --screensaver      screensaver mode; equivalent to -liWC and
                           quit on any keypress
  -m, --message=STR      attach message next to the tree
  -b, --base=INT         ascii-art plant base to use, 0 is none
  -c, --leaf=LIST        list of comma-delimited strings randomly chosen
                           for leaves
  -k, --color=LIST       list of 4 comma-delimited color indices (0-255) for
                           each of dark leaves, dark wood, light leaves, and
                           light wood, in that order [default: 2,3,10,11]
  -M, --multiplier=INT   branch multiplier; higher -> more
                           branching (0-20) [default: 5]
  -L, --life=INT         life; higher -> more growth (0-200) [default: 32]
  -p, --print            print tree to terminal when finished
  -s, --seed=INT         seed random number generator
  -W, --save=FILE        save progress to file [default: ~/.cache/cbonsai]
  -C, --load=FILE        load progress from file [default: ~/.cache/cbonsai]
  -v, --verbose          increase output verbosity
  -h, --help             show help
```

## Inspiration & Credits

This project wouldn't be here if it weren't for its *roots*! 

**This Christmas Edition fork** is based on the original [cbonsai by jallbrit](https://gitlab.com/jallbrit/cbonsai), which is a newer version of [bonsai.sh](https://gitlab.com/jallbrit/bonsai.sh), which was written in `bash` and was itself a port of [this bonsai tree generator](https://avelican.github.io/bonsai/) written in `javascript`.

All credit for the core bonsai generation algorithm and original codebase goes to [jallbrit](https://gitlab.com/jallbrit) and the original contributors. This fork simply adds festive ornament decorations to bring some holiday cheer to your terminal! 🎄✨
