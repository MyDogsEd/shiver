mkdir "C:\Program Files (x86)\Steam\steamapps\sourcemods\shiver"
xcopy "..\game\mod_hl2mp" "C:\Program Files (x86)\Steam\steamapps\sourcemods\shiver" /e /y
"C:\Program Files (x86)\Steam\steamapps\common\Source SDK Base 2013 Multiplayer\hl2.exe" -steam -game "..\..\sourcemods\shiver"
