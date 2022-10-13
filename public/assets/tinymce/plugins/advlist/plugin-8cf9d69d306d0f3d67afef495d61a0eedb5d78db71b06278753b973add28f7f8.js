!function(){"use strict";var t=tinymce.util.Tools.resolve("tinymce.PluginManager");const e=(t,e,r)=>{const s="UL"===e?"InsertUnorderedList":"InsertOrderedList";t.execCommand(s,!1,!1===r?null:{"list-style-type":r})},r=t=>e=>e.options.get(t),s=r("advlist_number_styles"),n=r("advlist_bullet_styles"),l=t=>null==t,i=t=>!l(t);var o=tinymce.util.Tools.resolve("tinymce.util.Tools");class a{constructor(t,e){this.tag=t,this.value=e}static some(t){return new a(!0,t)}static none(){return a.singletonNone}fold(t,e){return this.tag?e(this.value):t()}isSome(){return this.tag}isNone(){return!this.tag}map(t){return this.tag?a.some(t(this.value)):a.none()}bind(t){return this.tag?t(this.value):a.none()}exists(t){return this.tag&&t(this.value)}forall(t){return!this.tag||t(this.value)}filter(t){return!this.tag||t(this.value)?this:a.none()}getOr(t){return this.tag?this.value:t}or(t){return this.tag?this:t}getOrThunk(t){return this.tag?this.value:t()}orThunk(t){return this.tag?this:t()}getOrDie(t){if(this.tag)return this.value;throw new Error(null!=t?t:"Called getOrDie on None")}static from(t){return i(t)?a.some(t):a.none()}getOrNull(){return this.tag?this.value:null}getOrUndefined(){return this.value}each(t){this.tag&&t(this.value)}toArray(){return this.tag?[this.value]:[]}toString(){return this.tag?`some(${this.value})`:"none()"}}a.singletonNone=new a(!1);const u=t=>i(t)&&/^(TH|TD)$/.test(t.nodeName),d=t=>l(t)||"default"===t?"":t,g=(t,e)=>r=>{const s=s=>{r.setActive(((t,e,r)=>{const s=((t,e)=>{for(let r=0;r<t.length;r++)if(e(t[r]))return r;return-1})(e.parents,u),n=-1!==s?e.parents.slice(0,s):e.parents,l=o.grep(n,(t=>e=>i(e)&&/^(OL|UL|DL)$/.test(e.nodeName)&&((t,e)=>t.dom.isChildOf(e,t.getBody()))(t,e))(t));return l.length>0&&l[0].nodeName===r})(t,s,e)),r.setEnabled(!((t,e)=>{const r=t.dom.getParent(e,"ol,ul,dl");return((t,e)=>null!==e&&"false"===t.dom.getContentEditableParent(e))(t,r)})(t,s.element))};return t.on("NodeChange",s),()=>t.off("NodeChange",s)},h=(t,r,s,n,l,i)=>{i.length>1?((t,r,s,n,l,i)=>{t.ui.registry.addSplitButton(r,{tooltip:s,icon:"OL"===l?"ordered-list":"unordered-list",presets:"listpreview",columns:3,fetch:t=>{t(o.map(i,(t=>{const e="OL"===l?"num":"bull",r="disc"===t||"decimal"===t?"default":t,s=d(t),n=(t=>t.replace(/\-/g," ").replace(/\b\w/g,(t=>t.toUpperCase())))(t);return{type:"choiceitem",value:s,icon:"list-"+e+"-"+r,text:n}})))},onAction:()=>t.execCommand(n),onItemAction:(r,s)=>{e(t,l,s)},select:e=>{const r=(t=>{const e=t.dom.getParent(t.selection.getNode(),"ol,ul"),r=t.dom.getStyle(e,"listStyleType");return a.from(r)})(t);return r.map((t=>e===t)).getOr(!1)},onSetup:g(t,l)})})(t,r,s,n,l,i):((t,r,s,n,l,i)=>{t.ui.registry.addToggleButton(r,{active:!1,tooltip:s,icon:"OL"===l?"ordered-list":"unordered-list",onSetup:g(t,l),onAction:()=>t.queryCommandState(n)||""===i?t.execCommand(n):e(t,l,i)})})(t,r,s,n,l,d(i[0]))};t.add("advlist",(t=>{t.hasPlugin("lists")?((t=>{const e=t.options.register;e("advlist_number_styles",{processor:"string[]",default:"default,lower-alpha,lower-greek,lower-roman,upper-alpha,upper-roman".split(",")}),e("advlist_bullet_styles",{processor:"string[]",default:"default,circle,square".split(",")})})(t),(t=>{h(t,"numlist","Numbered list","InsertOrderedList","OL",s(t)),h(t,"bullist","Bullet list","InsertUnorderedList","UL",n(t))})(t),(t=>{t.addCommand("ApplyUnorderedListStyle",((r,s)=>{e(t,"UL",s["list-style-type"])})),t.addCommand("ApplyOrderedListStyle",((r,s)=>{e(t,"OL",s["list-style-type"])}))})(t)):console.error("Please use the Lists plugin together with the Advanced List plugin.")}))}();