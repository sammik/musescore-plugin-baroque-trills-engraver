/* 
 * GNU General Public License v3.0
 * author: sammik (C) 2022
 * https://github.com/sammik/musescore-plugin-baroque-trills-engraver
 */
import QtQuick 2.0
import MuseScore 3.0

MuseScore {
    menuPath: "Plugins.Baroque Trills.Restore default Trills"
    description: "Replace baroque trills with default ones"
    version: "1"
    onRun: {
        
        cmd("select-all");
        curScore.startCmd();
        var els = curScore.selection.elements;
        for (var i in els) {
            var el = els[i];
            if (el.type == Element.SYMBOL && el.symbol == SymId.ornamentShake3 || el.symbol == SymId.ornamentShakeMuffat1) {
                console.log(el.symbol)
                removeElement(el);
            }
            if (el.type == Element.ARTICULATION && el.symbol == SymId.ornamentTrill) {
                el.visible = true;
            }
        }
        curScore.endCmd();
        cmd("escape");
        Qt.quit()
    }
}
