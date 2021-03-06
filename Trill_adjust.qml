/* 
 * GNU General Public License v3.0
 * author: sammik (C) 2022
 * https://github.com/sammik/musescore-plugin-baroque-trills-engraver
 */
import QtQuick 2.0
import MuseScore 3.0

MuseScore {
    menuPath: "Plugins.Baroque Trills.Adjust Positions"
    description: "Adjust positions of baroque trills"
    version: "1.1"
    onRun: {
        
        cmd("select-all");
        curScore.startCmd();
        var els = curScore.selection.elements;
        for (var i in els) {
            var el = els[i];
            if (el.type == Element.SYMBOL && el.symbol == SymId.ornamentShake3 || el.symbol == SymId.ornamentShakeMuffat1 || el.symbol == SymId.ornamentTremblementCouperin) {
                var note = el.parent;
                var nY = note.posY;
                if (el.symbol == SymId.ornamentTremblementCouperin) {
                    el.offsetY = nY > 1 ? -1 - nY : -2;
                }
                else {
                    el.offsetY = nY > 0.5 ? -1 - nY : -1.5;
                }
            }
        }
        curScore.endCmd();
        cmd("escape");
        Qt.quit()
    }
}
