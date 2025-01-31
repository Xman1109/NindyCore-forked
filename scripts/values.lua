if not nindycore then nindycore = {} end
if not nindycore.core then nindycore.core = {} end
if not nindycore.core.constants then nindycore.core.constants = {} end
if not nindycore.core.gui then nindycore.core.gui = {} end
if not nindycore.core.gui.titles then nindycore.core.gui.titles = {} end
if not nindycore.core.gui.fonts then nindycore.core.gui.fonts = {} end
if not nindycore.core.gui.styles then nindycore.core.gui.styles = {} end
if not nindycore.core.gui.colors then nindycore.core.gui.colors = {} end
if not nindycore.core.sprites then nindycore.core.sprites = {} end

require("constants")
require("functions")
require("gui")

nindycore.core.sprites = {
    ["blank32"] = nindycore.core.add_mod_tag("Sprite-blank32"),
}

nindycore.core.gui.fonts = {
    ["14"] = nindycore.core.add_mod_tag("Font-14"),
    ["16"] = nindycore.core.add_mod_tag("Font-16"),
    ["B-14"] = nindycore.core.add_mod_tag("Font-B-14"),
    ["SB-14"] = nindycore.core.add_mod_tag("Font-SB-14"),
    ["SB-20"] = nindycore.core.add_mod_tag("Font-SB-20"),
    ["H-18"] = nindycore.core.add_mod_tag("Font-H-18"),
    ["LP-14"] = nindycore.core.add_mod_tag("Font-LP-14"),
}

nindycore.core.gui.styles = {
    ["F-1"] = nindycore.core.add_mod_tag("Style-F-1"),
    ["SP-1"] = nindycore.core.add_mod_tag("Style-SP-1"),
    ["B-1"] = nindycore.core.add_mod_tag("Style-B-1"),
    ["B-2"] = nindycore.core.add_mod_tag("Style-B-2"),
    ["B-3"] = nindycore.core.add_mod_tag("Style-B-3"),
}

nindycore.core.gui.titles = {
    ["tooltip"] = nindycore.core.add_mod_tag("Title-tooltip"),
    ["main"] = nindycore.core.add_mod_tag("Title-main"),
    ["info"] = nindycore.core.add_mod_tag("Title-info"),
    ["option"] = nindycore.core.add_mod_tag("Title-option"),
}

nindycore.core.gui.colors = {
    ["white"] = {r=255, g=255, b=255},
    ["red"] = {r=231, g=5, b=5},
    ["green"] = {r=92, g=232, b=54},
    ["blue"] = {r=108, g=144, b=229},
    ["orange"] = {r=255, g=131, b=0},
    ["yellow"] = {r=244, g=208, b=63},
    ["purple"] = {r=155, g=0, b=168}
}

