#!/usr/bin/env bash
#
# snarfed from https://gist.github.com/mxmerz/92e97cd27857a9ba787b
# smemsh: added '-e' for bash echo
#

# ANSI Start Codes

# Styles.
Normal="\x1b[0m"
Bold="\x1b[1m"
Faint="\x1b[2m"
Italic="\x1b[3m"
Underline="\x1b[4m"
Blink_Slow="\x1b[5m"
Blink_Rapid="\x1b[6m"
Inverse="\x1b[7m"
Conceal="\x1b[8m"
Crossed_Out="\x1b[9m"
# Text colors.
Black="\x1b[30m"
Red="\x1b[31m"
Green="\x1b[32m"
Yellow="\x1b[33m"
Blue="\x1b[34m"
Magenta="\x1b[35m"
Cyan="\x1b[36m"
White="\x1b[37m"
# Background colors.
Bg_Black="\x1b[40m"
Bg_Red="\x1b[41m"
Bg_Green="\x1b[42m"
Bg_Yellow="\x1b[43m"
Bg_Blue="\x1b[44m"
Bg_Magenta="\x1b[45m"
Bg_Cyan="\x1b[46m"
Bg_White="\x1b[47m"
# Resets
NoStyle="\x1b[0m"
NoUnderline="\x1b[24m"
NoInverse="\x1b[27m"
NoColor="\x1b[39m"

Colors1="None $Black""Black""$NoColor $Red""Red""$NoColor $Green""Green""$NoColor $Yellow""Yellow""$NoColor"
Colors2="$Blue""Blue""$NoColor $Magenta""Magenta""$NoColor $Cyan""Cyan""$NoColor $White""White""$NoColor"
AllColors="$Colors1 $Colors2 $NoStyle"

Bg_Black_All="$Bg_Black$AllColors"
Bg_Red_All="$Bg_Red$AllColors"
Bg_Green_All="$Bg_Green$AllColors"
Bg_Yellow_All="$Bg_Yellow$AllColors"
Bg_Blue_All="$Bg_Blue$AllColors"
Bg_Magenta_All="$Bg_Magenta$AllColors"
Bg_Cyan_All="$Bg_Cyan$AllColors"
Bg_White_All="$Bg_White$AllColors"

# Test Table
echo -e "Background: | Style:      | Text Colors:"
echo -e "------------|-------------|----------------------------------------------------"
echo -e "            | Normal      | "$Normal$AllColors
echo -e "            | Bold        | "$Bold$AllColors
echo -e "            | Faint       | "$Faint$AllColors
echo -e "            | Italic      | "$Italic$AllColors
echo -e "            | Underline   | "$Underline$AllColors
echo -e "            | Blink_Slow  | "$Blink_Slow$AllColors
echo -e "            | Blink_Rapid | "$Blink_Rapid$AllColors
echo -e "            | Inverse     | "$Inverse$AllColors
echo -e "            | Conceal     | "$Conceal$AllColors
echo -e "            | Crossed_Out | "$Crossed_Out$AllColors
echo -e "BG Black    | Normal      | "$Normal$Bg_Black_All
echo -e "BG Red      | Normal      | "$Normal$Bg_Red_All
echo -e "BG Green    | Normal      | "$Normal$Bg_Green_All
echo -e "BG Yellow   | Normal      | "$Normal$Bg_Yellow_All
echo -e "BG Blue     | Normal      | "$Normal$Bg_Blue_All
echo -e "BG Magenta  | Normal      | "$Normal$Bg_Magenta_All
echo -e "BG Cyan     | Normal      | "$Normal$Bg_Cyan_All
echo -e "BG White    | Normal      | "$Normal$Bg_White_All
