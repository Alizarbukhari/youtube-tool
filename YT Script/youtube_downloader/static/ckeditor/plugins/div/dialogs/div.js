﻿(function () {
    function t(a, m, r) { m.is && m.getCustomData("block_processed") || (m.is && CKEDITOR.dom.element.setMarker(r, m, "block_processed", !0), a.push(m)) } function q(a, m) {
        function r() { this.foreach(function (a) { /^(?!vbox|hbox)/.test(a.type) && (a.setup || (a.setup = function (c) { a.setValue(c.getAttribute(a.id) || "", 1) }), a.commit || (a.commit = function (c) { var f = this.getValue(); if ("dir" != a.id || c.getComputedStyle("direction") != f) f ? c.setAttribute(a.id, f) : c.removeAttribute(a.id) })) }) } var q = function () {
            var g = CKEDITOR.tools.extend({},
                CKEDITOR.dtd.$blockLimit); a.config.div_wrapTable && (delete g.td, delete g.th); return g
        }(), u = CKEDITOR.dtd.div, n = {}, p = []; return {
            title: a.lang.div.title, minWidth: 400, minHeight: 165, contents: [{
                id: "info", label: a.lang.common.generalTab, title: a.lang.common.generalTab, elements: [{
                    type: "hbox", widths: ["50%", "50%"], children: [{
                        id: "elementStyle", type: "select", style: "width: 100%;", label: a.lang.div.styleSelectLabel, "default": "copytext", items: [[a.lang.common.notSet, "Special Container"]], onChange: function () {
                            var g = ["info:elementStyle", "info:class",
                                "advanced:dir", "advanced:style"], c = this.getDialog(), f = c.getModel(a), f = f && f.clone() || new CKEDITOR.dom.element("div", a.document); this.commit(f, !0); for (var g = [].concat(g), b = g.length, k, e = 0; e < b; e++)(k = c.getContentElement.apply(c, g[e].split(":"))) && k.setup && k.setup(f, !0)
                        }, setup: function (g) { for (var c in n) n[c].checkElementRemovable(g, !0, a) && this.setValue(c, 1) }, commit: function (g) { var c; (c = this.getValue()) ? n[c].applyToObject(g, a) : g.removeAttribute("style") }
                    }, {
                        id: "class", type: "text", requiredContent: "div(cke-xyz)",
                        label: a.lang.common.cssClass, "default": "copytext"
                    }]
                }]
            }, {
                id: "advanced", label: a.lang.common.advancedTab, title: a.lang.common.advancedTab, elements: [{
                    type: "vbox", padding: 1, children: [{ type: "hbox", widths: ["50%", "50%"], children: [{ type: "text", id: "id", requiredContent: "div[id]", label: a.lang.common.id, "default": "copytext" }, { type: "text", id: "lang", requiredContent: "div[lang]", label: a.lang.common.langCode, "default": "copytext" }] }, {
                        type: "hbox", children: [{
                            type: "text", id: "style", requiredContent: "div{cke-xyz}", style: "width: 100%;", label: a.lang.common.cssStyle,
                            "default": "background:#eeeeee;border:1px solid #cccccc;padding:5px 10px;position:relative;text-align:center", commit: function (a) { a.setAttribute("style", this.getValue()) }
                        }]
                    }, { type: "hbox", children: [{ type: "text", id: "title", requiredContent: "div[title]", style: "width: 100%;", label: a.lang.common.advisoryTitle, "default": "copytext" }] }, { type: "select", id: "dir", requiredContent: "div[dir]", style: "width: 100%;", label: a.lang.common.langDir, "default": "copytext", items: [[a.lang.common.notSet, ""], [a.lang.common.langDirLtr, "ltr"], [a.lang.common.langDirRtl, "rtl"]] }]
                }]
            }], getModel: function (a) {
                return "editdiv" === m ? CKEDITOR.plugins.div.getSurroundDiv(a) :
                    null
            }, onLoad: function () { r.call(this); var g = this, c = this.getContentElement("info", "elementStyle"); a.getStylesSet(function (f) { var b, k; if (f) for (var e = 0; e < f.length; e++)k = f[e], k.element && "div" == k.element && (b = k.name, n[b] = k = new CKEDITOR.style(k), a.filter.check(k) && (c.items.push([b, b]), c.add(b, b))); c[1 < c.items.length ? "enable" : "disable"](); setTimeout(function () { var b = g.getModel(a); b && c.setup(b) }, 0) }) }, onShow: function () { "editdiv" == m && this.setupContent(this.getModel(a)) }, onOk: function () {
                if ("editdiv" == m) p = [this.getModel(a)];
                else {
                    var g = [], c = {}, f = [], b, k = a.getSelection(), e = k.getRanges(), n = k.createBookmarks(), h, l; for (h = 0; h < e.length; h++)for (l = e[h].createIterator(); b = l.getNextParagraph();)if (b.getName() in q && !b.isReadOnly()) { var d = b.getChildren(); for (b = 0; b < d.count(); b++)t(f, d.getItem(b), c) } else { for (; !u[b.getName()] && !b.equals(e[h].root);)b = b.getParent(); t(f, b, c) } CKEDITOR.dom.element.clearAllMarkers(c); e = []; h = null; for (l = 0; l < f.length; l++)b = f[l], d = a.elementPath(b).blockLimit, d.isReadOnly() && (d = d.getParent()), a.config.div_wrapTable &&
                        d.is(["td", "th"]) && (d = a.elementPath(d.getParent()).blockLimit), d.equals(h) || (h = d, e.push([])), b.getParent() && e[e.length - 1].push(b); for (h = 0; h < e.length; h++)if (e[h].length) {
                            d = e[h][0]; f = d.getParent(); for (b = 1; b < e[h].length; b++)f = f.getCommonAncestor(e[h][b]); f || (f = a.editable()); l = new CKEDITOR.dom.element("div", a.document); for (b = 0; b < e[h].length; b++) { for (d = e[h][b]; d.getParent() && !d.getParent().equals(f);)d = d.getParent(); e[h][b] = d } for (b = 0; b < e[h].length; b++)d = e[h][b], d.getCustomData && d.getCustomData("block_processed") ||
                                (d.is && CKEDITOR.dom.element.setMarker(c, d, "block_processed", !0), b || l.insertBefore(d), l.append(d)); CKEDITOR.dom.element.clearAllMarkers(c); g.push(l)
                        } k.selectBookmarks(n); p = g
                } g = p.length; for (c = 0; c < g; c++)this.commitContent(p[c]), !p[c].getAttribute("style") && p[c].removeAttribute("style"); this.hide()
            }, onHide: function () { this.getMode(a) === CKEDITOR.dialog.EDITING_MODE && this.getModel(a).removeCustomData("elementStyle") }
        }
    } CKEDITOR.dialog.add("creatediv", function (a) { return q(a, "creatediv") }); CKEDITOR.dialog.add("editdiv",
        function (a) { return q(a, "editdiv") })
})();