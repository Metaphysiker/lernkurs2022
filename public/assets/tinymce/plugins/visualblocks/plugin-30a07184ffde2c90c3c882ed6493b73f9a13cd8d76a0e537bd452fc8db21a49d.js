!function(){"use strict";var t=tinymce.util.Tools.resolve("tinymce.PluginManager");const o=(t,o,s)=>{t.dom.toggleClass(t.getBody(),"mce-visualblocks"),s.set(!s.get()),((t,o)=>{t.dispatch("VisualBlocks",{state:o})})(t,s.get())},s=t=>t.options.get("visualblocks_default_state"),e=(t,o)=>s=>{s.setActive(o.get());const e=t=>s.setActive(t.state);return t.on("VisualBlocks",e),()=>t.off("VisualBlocks",e)};t.add("visualblocks",((t,l)=>{(t=>{(0,t.options.register)("visualblocks_default_state",{processor:"boolean",default:!1})})(t);const i=(t=>{let o=!1;return{get:()=>o,set:t=>{o=t}}})();((t,s,e)=>{t.addCommand("mceVisualBlocks",(()=>{o(t,0,e)}))})(t,0,i),((t,o)=>{const s=()=>t.execCommand("mceVisualBlocks");t.ui.registry.addToggleButton("visualblocks",{icon:"visualblocks",tooltip:"Show blocks",onAction:s,onSetup:e(t,o)}),t.ui.registry.addToggleMenuItem("visualblocks",{text:"Show blocks",icon:"visualblocks",onAction:s,onSetup:e(t,o)})})(t,i),((t,e,l)=>{t.on("PreviewFormats AfterPreviewFormats",(o=>{l.get()&&t.dom.toggleClass(t.getBody(),"mce-visualblocks","afterpreviewformats"===o.type)})),t.on("init",(()=>{s(t)&&o(t,0,l)}))})(t,0,i)}))}();
