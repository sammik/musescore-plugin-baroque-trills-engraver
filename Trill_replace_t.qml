/* 
 * GNU General Public License v3.0
 * author: sammik (C) 2022
 * https://github.com/sammik/musescore-plugin-baroque-trills-engraver
 */
import QtQuick 2.0
import MuseScore 3.0

MuseScore {
    menuPath: "Plugins.Baroque Trills.Create 't'"
    description: "Replace default trill with baroque 'Muffat' ones"
    version: "1"
    onRun: {
        cmd("select-all");
        curScore.startCmd();
        var els = curScore.selection.elements;
        for (var i in els) {
            var el = els[i];
            if (el.type == Element.ARTICULATION && el.symbol == SymId.ornamentTrill && el.visible == true) {
                el.visible = false;
                var note = el.parent.notes[el.parent.notes.length - 1];
                var nY = note.posY;
                var sym = newElement(Element.SYMBOL);
                sym.symbol = "ornamentShakeMuffat1";
                note.add(sym);
                sym.offsetY = nY > 0 ? -1 - nY : -1;
            }
        }
        curScore.endCmd();
        cmd("escape");
        Qt.quit()
    }
}
