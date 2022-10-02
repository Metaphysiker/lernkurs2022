!function(){"use strict";var t=tinymce.util.Tools.resolve("tinymce.PluginManager");const e=t=>e=>(t=>{const e=typeof t;return null===t?"null":"object"===e&&Array.isArray(t)?"array":"object"===e&&(n=r=t,(o=String).prototype.isPrototypeOf(n)||(null===(s=r.constructor)||void 0===s?void 0:s.name)===o.name)?"string":e;var n,r,o,s})(e)===t,n=t=>e=>typeof e===t,r=e("string"),o=e("object"),s=e("array"),i=n("boolean"),a=t=>!(t=>null==t)(t),l=n("function"),d=n("number"),c=()=>{},u=(t,e)=>t===e,m=t=>e=>!t(e),p=()=>!1;class g{constructor(t,e){this.tag=t,this.value=e}static some(t){return new g(!0,t)}static none(){return g.singletonNone}fold(t,e){return this.tag?e(this.value):t()}isSome(){return this.tag}isNone(){return!this.tag}map(t){return this.tag?g.some(t(this.value)):g.none()}bind(t){return this.tag?t(this.value):g.none()}exists(t){return this.tag&&t(this.value)}forall(t){return!this.tag||t(this.value)}filter(t){return!this.tag||t(this.value)?this:g.none()}getOr(t){return this.tag?this.value:t}or(t){return this.tag?this:t}getOrThunk(t){return this.tag?this.value:t()}orThunk(t){return this.tag?this:t()}getOrDie(t){if(this.tag)return this.value;throw new Error(null!=t?t:"Called getOrDie on None")}static from(t){return a(t)?g.some(t):g.none()}getOrNull(){return this.tag?this.value:null}getOrUndefined(){return this.value}each(t){this.tag&&t(this.value)}toArray(){return this.tag?[this.value]:[]}toString(){return this.tag?`some(${this.value})`:"none()"}}g.singletonNone=new g(!1);const h=Array.prototype.slice,f=Array.prototype.indexOf,y=Array.prototype.push,v=(t,e)=>{return n=t,r=e,f.call(n,r)>-1;var n,r},C=(t,e)=>{for(let n=0,r=t.length;n<r;n++)if(e(t[n],n))return!0;return!1},b=(t,e)=>{const n=t.length,r=new Array(n);for(let o=0;o<n;o++){const n=t[o];r[o]=e(n,o)}return r},S=(t,e)=>{for(let n=0,r=t.length;n<r;n++)e(t[n],n)},N=(t,e)=>{const n=[];for(let r=0,o=t.length;r<o;r++){const o=t[r];e(o,r)&&n.push(o)}return n},L=(t,e,n)=>(S(t,((t,r)=>{n=e(n,t,r)})),n),O=(t,e,n)=>{for(let r=0,o=t.length;r<o;r++){const o=t[r];if(e(o,r))return g.some(o);if(n(o,r))break}return g.none()},k=(t,e)=>O(t,e,p),T=(t,e)=>(t=>{const e=[];for(let n=0,r=t.length;n<r;++n){if(!s(t[n]))throw new Error("Arr.flatten item "+n+" was not an array, input: "+t);y.apply(e,t[n])}return e})(b(t,e)),A=t=>{const e=h.call(t,0);return e.reverse(),e},w=(t,e)=>e>=0&&e<t.length?g.some(t[e]):g.none(),D=t=>w(t,0),E=t=>w(t,t.length-1),B=(t,e)=>{const n=[],r=l(e)?t=>C(n,(n=>e(n,t))):t=>v(n,t);for(let e=0,o=t.length;e<o;e++){const o=t[e];r(o)||n.push(o)}return n},x=(t,e,n=u)=>t.exists((t=>n(t,e))),I=(t,e,n)=>t.isSome()&&e.isSome()?g.some(n(t.getOrDie(),e.getOrDie())):g.none(),P=t=>{if(null==t)throw new Error("Node cannot be null or undefined");return{dom:t}},M=(t,e)=>{const n=(e||document).createElement(t);return P(n)},R=P,U=(t,e)=>t.dom===e.dom;"undefined"!=typeof window?window:Function("return this;")();const $=t=>t.dom.nodeName.toLowerCase(),_=t=>1===(t=>t.dom.nodeType)(t),H=t=>e=>_(e)&&$(e)===t,j=t=>g.from(t.dom.parentNode).map(R),F=t=>b(t.dom.childNodes,R),K=(t,e)=>{const n=t.dom.childNodes;return g.from(n[e]).map(R)},V=t=>K(t,0),z=t=>K(t,t.dom.childNodes.length-1),Q=(t,e,n)=>{let r=t.dom;const o=l(n)?n:p;for(;r.parentNode;){r=r.parentNode;const t=R(r);if(e(t))return g.some(t);if(o(t))break}return g.none()},q=(t,e,n)=>((t,e,n,r,o)=>r(n)?g.some(n):l(o)&&o(n)?g.none():e(n,r,o))(0,Q,t,e,n),W=(t,e)=>{j(t).each((n=>{n.dom.insertBefore(e.dom,t.dom)}))},Z=(t,e)=>{t.dom.appendChild(e.dom)},G=(t,e)=>{S(e,(e=>{Z(t,e)}))},J=t=>{t.dom.textContent="",S(F(t),(t=>{X(t)}))},X=t=>{const e=t.dom;null!==e.parentNode&&e.parentNode.removeChild(e)};var Y=tinymce.util.Tools.resolve("tinymce.dom.RangeUtils"),tt=tinymce.util.Tools.resolve("tinymce.dom.TreeWalker"),et=tinymce.util.Tools.resolve("tinymce.util.VK");const nt=t=>b(t,R),rt=Object.keys,ot=(t,e)=>{const n=rt(t);for(let r=0,o=n.length;r<o;r++){const o=n[r];e(t[o],o)}},st=(t,e)=>{const n=t.dom;ot(e,((t,e)=>{((t,e,n)=>{if(!(r(n)||i(n)||d(n)))throw console.error("Invalid call to Attribute.set. Key ",e,":: Value ",n,":: Element ",t),new Error("Attribute value was not simple");t.setAttribute(e,n+"")})(n,e,t)}))},it=t=>L(t.dom.attributes,((t,e)=>(t[e.name]=e.value,t)),{}),at=t=>(t=>R(t.dom.cloneNode(!0)))(t),lt=(t,e)=>{const n=((t,e)=>{const n=M(e),r=it(t);return st(n,r),n})(t,e);((t,e)=>{const n=(t=>g.from(t.dom.nextSibling).map(R))(t);n.fold((()=>{j(t).each((t=>{Z(t,e)}))}),(t=>{W(t,e)}))})(t,n);const r=F(t);return G(n,r),X(t),n};var dt=tinymce.util.Tools.resolve("tinymce.dom.DOMUtils"),ct=tinymce.util.Tools.resolve("tinymce.util.Tools");const ut=t=>e=>a(e)&&e.nodeName.toLowerCase()===t,mt=t=>e=>a(e)&&t.test(e.nodeName),pt=t=>a(t)&&3===t.nodeType,gt=t=>a(t)&&1===t.nodeType,ht=mt(/^(OL|UL|DL)$/),ft=mt(/^(OL|UL)$/),yt=ut("ol"),vt=mt(/^(LI|DT|DD)$/),Ct=mt(/^(DT|DD)$/),bt=mt(/^(TH|TD)$/),St=ut("br"),Nt=(t,e)=>a(e)&&e.nodeName in t.schema.getTextBlockElements(),Lt=(t,e)=>a(t)&&t.nodeName in e,Ot=(t,e,n)=>{const r=t.isEmpty(e);return!(n&&t.select("span[data-mce-type=bookmark]",e).length>0)&&r},kt=(t,e)=>t.isChildOf(e,t.getRoot()),Tt=t=>e=>e.options.get(t),At=Tt("lists_indent_on_tab"),wt=Tt("forced_root_block"),Dt=Tt("forced_root_block_attrs"),Et=(t,e)=>{const n=t.dom,r=t.schema.getBlockElements(),o=n.createFragment(),s=wt(t),i=Dt(t);let a,l,d=!1;for(l=n.create(s,i),Lt(e.firstChild,r)||o.appendChild(l);a=e.firstChild;){const t=a.nodeName;d||"SPAN"===t&&"bookmark"===a.getAttribute("data-mce-type")||(d=!0),Lt(a,r)?(o.appendChild(a),l=null):(l||(l=n.create(s,i),o.appendChild(l)),l.appendChild(a))}return!d&&l&&l.appendChild(n.create("br",{"data-mce-bogus":"1"})),o},Bt=dt.DOM,xt=H("dd"),It=H("dt"),Pt=(t,e)=>{var n;xt(e)?lt(e,"dt"):It(e)&&(n=e,g.from(n.dom.parentElement).map(R)).each((n=>((t,e,n)=>{const r=Bt.select('span[data-mce-type="bookmark"]',e),o=Et(t,n),s=Bt.createRng();s.setStartAfter(n),s.setEndAfter(e);const i=s.extractContents();for(let e=i.firstChild;e;e=e.firstChild)if("LI"===e.nodeName&&t.dom.isEmpty(e)){Bt.remove(e);break}t.dom.isEmpty(i)||Bt.insertAfter(i,e),Bt.insertAfter(o,e);const a=n.parentElement;a&&Ot(t.dom,a)&&(t=>{const e=t.parentNode;e&&ct.each(r,(t=>{e.insertBefore(t,n.parentNode)})),Bt.remove(t)})(a),Bt.remove(n),Ot(t.dom,e)&&Bt.remove(e)})(t,n.dom,e.dom)))},Mt=t=>{It(t)&&lt(t,"dd")},Rt=(t,e)=>{if(pt(t))return{container:t,offset:e};const n=Y.getNode(t,e);return pt(n)?{container:n,offset:e>=t.childNodes.length?n.data.length:0}:n.previousSibling&&pt(n.previousSibling)?{container:n.previousSibling,offset:n.previousSibling.data.length}:n.nextSibling&&pt(n.nextSibling)?{container:n.nextSibling,offset:0}:{container:t,offset:e}},Ut=t=>{const e=t.cloneRange(),n=Rt(t.startContainer,t.startOffset);e.setStart(n.container,n.offset);const r=Rt(t.endContainer,t.endOffset);return e.setEnd(r.container,r.offset),e},$t=["OL","UL","DL"],_t=$t.join(","),Ht=(t,e)=>{const n=e||t.selection.getStart(!0);return t.dom.getParent(n,_t,Kt(t,n))},jt=t=>{const e=t.selection.getSelectedBlocks();return N(((t,e)=>{const n=ct.map(e,(e=>t.dom.getParent(e,"li,dd,dt",Kt(t,e))||e));return B(n)})(t,e),vt)},Ft=(t,e)=>{const n=t.dom.getParents(e,"TD,TH");return n.length>0?n[0]:t.getBody()},Kt=(t,e)=>{const n=t.dom.getParents(e,t.dom.isBlock),r=k(n,(e=>{return n=t.schema,!ht(r=e)&&!vt(r)&&C($t,(t=>n.isValidChild(r.nodeName,t)));var n,r}));return r.getOr(t.getBody())},Vt=(t,e)=>{const n=t.dom.getParents(e,"ol,ul",Kt(t,e));return E(n)},zt=(t,e)=>{const n=b(e,(e=>Vt(t,e).getOr(e)));return B(n)},Qt=t=>/\btox\-/.test(t.className),qt=(t,e)=>O(t,ht,bt).exists((t=>t.nodeName===e&&!Qt(t))),Wt=(t,e)=>null!==e&&"false"===t.dom.getContentEditableParent(e),Zt=(t,e)=>{const n=t.dom.getParent(e,"ol,ul,dl");return Wt(t,n)},Gt=(t,e)=>{const n=t.selection.getNode();return e({parents:t.dom.getParents(n),element:n}),t.on("NodeChange",e),()=>t.off("NodeChange",e)},Jt=(t,e,n)=>t.dispatch("ListMutation",{action:e,element:n}),Xt=(Yt=/^\s+|\s+$/g,t=>t.replace(Yt,""));var Yt;const te=(t,e,n)=>{((t,e,n)=>{if(!r(n))throw console.error("Invalid call to CSS.set. Property ",e,":: Value ",n,":: Element ",t),new Error("CSS value must be a string: "+n);(t=>void 0!==t.style&&l(t.style.getPropertyValue))(t)&&t.style.setProperty(e,n)})(t.dom,e,n)},ee=(t,e)=>{Z(t.item,e.list)},ne=(t,e)=>{const n={list:M(e,t),item:M("li",t)};return Z(n.list,n.item),n},re=t=>((t,e)=>{const n=t.dom;if(1!==n.nodeType)return!1;{const t=n;if(void 0!==t.matches)return t.matches(e);if(void 0!==t.msMatchesSelector)return t.msMatchesSelector(e);if(void 0!==t.webkitMatchesSelector)return t.webkitMatchesSelector(e);if(void 0!==t.mozMatchesSelector)return t.mozMatchesSelector(e);throw new Error("Browser lacks native selectors")}})(t,"OL,UL"),oe=t=>V(t).exists(re),se=t=>t.depth>0,ie=t=>t.isSelected,ae=t=>{const e=F(t),n=z(t).exists(re)?e.slice(0,-1):e;return b(n,at)},le=t=>(S(t,((e,n)=>{((t,e)=>{const n=t[e].depth,r=t=>t.depth===n&&!t.dirty,o=t=>t.depth<n;return O(A(t.slice(0,e)),r,o).orThunk((()=>O(t.slice(e+1),r,o)))})(t,n).fold((()=>{e.dirty&&(t=>{t.listAttributes=((t,e)=>{const n={};var r;return((t,e,n,r)=>{ot(t,((t,o)=>{(e(t,o)?n:r)(t,o)}))})(t,e,(r=n,(t,e)=>{r[e]=t}),c),n})(t.listAttributes,((t,e)=>"start"!==e))})(e)}),(t=>{return r=t,(n=e).listType=r.listType,void(n.listAttributes={...r.listAttributes});var n,r}))})),t),de=(t,e,n,r)=>V(r).filter(re).fold((()=>{e.each((t=>{U(t.start,r)&&n.set(!0)}));const o=((t,e,n)=>j(t).filter(_).map((r=>({depth:e,dirty:!1,isSelected:n,content:ae(t),itemAttributes:it(t),listAttributes:it(r),listType:$(r)}))))(r,t,n.get());e.each((t=>{U(t.end,r)&&n.set(!1)}));const s=z(r).filter(re).map((r=>ce(t,e,n,r))).getOr([]);return o.toArray().concat(s)}),(r=>ce(t,e,n,r))),ce=(t,e,n,r)=>T(F(r),(r=>(re(r)?ce:de)(t+1,e,n,r))),ue=(t,e)=>{const n=le(e);return((t,e)=>{const n=L(e,((e,n)=>n.depth>e.length?((t,e,n)=>{const r=((t,e,n)=>{const r=[];for(let o=0;o<n;o++)r.push(ne(t,e.listType));return r})(t,n,n.depth-e.length);var o;return(t=>{for(let e=1;e<t.length;e++)ee(t[e-1],t[e])})(r),((t,e)=>{for(let e=0;e<t.length-1;e++)te(t[e].item,"list-style-type","none");E(t).each((t=>{st(t.list,e.listAttributes),st(t.item,e.itemAttributes),G(t.item,e.content)}))})(r,n),o=r,I(E(e),D(o),ee),e.concat(r)})(t,e,n):((t,e,n)=>{const r=e.slice(0,n.depth);return E(r).each((e=>{const r=((t,e,n)=>{const r=M("li",t);return st(r,e),G(r,n),r})(t,n.itemAttributes,n.content);((t,e)=>{Z(t.list,e),t.item=e})(e,r),((t,e)=>{$(t.list)!==e.listType&&(t.list=lt(t.list,e.listType)),st(t.list,e.listAttributes)})(e,n)})),r})(t,e,n)),[]);return D(n).map((t=>t.list))})(t.contentDocument,n).toArray()},me=(t,e,n)=>{const r=((t,e)=>{const n=(()=>{let t=!1;return{get:()=>t,set:e=>{t=e}}})();return b(t,(t=>({sourceList:t,entries:ce(0,e,n,t)})))})(e,(t=>{const e=b(jt(t),R);return I(k(e,m(oe)),k(A(e),m(oe)),((t,e)=>({start:t,end:e})))})(t));S(r,(e=>{((t,e)=>{S(N(t,ie),(t=>((t,e)=>{switch(t){case"Indent":e.depth++;break;case"Outdent":e.depth--;break;case"Flatten":e.depth=0}e.dirty=!0})(e,t)))})(e.entries,n);const r=((t,e)=>T(((t,e)=>{if(0===t.length)return[];{let n=e(t[0]);const r=[];let o=[];for(let s=0,i=t.length;s<i;s++){const i=t[s],a=e(i);a!==n&&(r.push(o),o=[]),n=a,o.push(i)}return 0!==o.length&&r.push(o),r}})(e,se),(e=>D(e).exists(se)?ue(t,e):((t,e)=>{const n=le(e);return b(n,(e=>{const n=(t=>{const e=document.createDocumentFragment();return S(t,(t=>{e.appendChild(t.dom)})),R(e)})(e.content);return R(Et(t,n.dom))}))})(t,e))))(t,e.entries);var o;S(r,(e=>{Jt(t,"Indent"===n?"IndentList":"OutdentList",e.dom)})),o=e.sourceList,S(r,(t=>{W(o,t)})),X(e.sourceList)}))},pe=(t,e)=>{const n=nt((t=>{const e=(t=>{const e=Vt(t,t.selection.getStart()),n=N(t.selection.getSelectedBlocks(),ft);return e.toArray().concat(n)})(t);return zt(t,e)})(t)),r=nt((t=>N(jt(t),Ct))(t));let o=!1;if(n.length||r.length){const s=t.selection.getBookmark();me(t,n,e),((t,e,n)=>{S(n,"Indent"===e?Mt:e=>Pt(t,e))})(t,e,r),t.selection.moveToBookmark(s),t.selection.setRng(Ut(t.selection.getRng())),t.nodeChanged(),o=!0}return o},ge=(t,e)=>!(t=>{const e=Ht(t);return Wt(t,e)})(t)&&pe(t,e),he=t=>ge(t,"Indent"),fe=t=>ge(t,"Outdent"),ye=t=>ge(t,"Flatten");var ve=tinymce.util.Tools.resolve("tinymce.dom.BookmarkManager");const Ce=dt.DOM,be=t=>{const e={},n=n=>{let r=t[n?"startContainer":"endContainer"],o=t[n?"startOffset":"endOffset"];if(gt(r)){const t=Ce.create("span",{"data-mce-type":"bookmark"});r.hasChildNodes()?(o=Math.min(o,r.childNodes.length-1),n?r.insertBefore(t,r.childNodes[o]):Ce.insertAfter(t,r.childNodes[o])):r.appendChild(t),r=t,o=0}e[n?"startContainer":"endContainer"]=r,e[n?"startOffset":"endOffset"]=o};return n(!0),t.collapsed||n(),e},Se=t=>{const e=e=>{let n=t[e?"startContainer":"endContainer"],r=t[e?"startOffset":"endOffset"];if(n){if(gt(n)&&n.parentNode){const t=n;r=(t=>{var e;let n=null===(e=t.parentNode)||void 0===e?void 0:e.firstChild,r=0;for(;n;){if(n===t)return r;gt(n)&&"bookmark"===n.getAttribute("data-mce-type")||r++,n=n.nextSibling}return-1})(n),n=n.parentNode,Ce.remove(t),!n.hasChildNodes()&&Ce.isBlock(n)&&n.appendChild(Ce.create("br"))}t[e?"startContainer":"endContainer"]=n,t[e?"startOffset":"endOffset"]=r}};e(!0),e();const n=Ce.createRng();return n.setStart(t.startContainer,t.startOffset),t.endContainer&&n.setEnd(t.endContainer,t.endOffset),Ut(n)},Ne=t=>{switch(t){case"UL":return"ToggleUlList";case"OL":return"ToggleOlList";case"DL":return"ToggleDLList"}},Le=(t,e)=>{ct.each(e,((e,n)=>{t.setAttribute(n,e)}))},Oe=(t,e,n)=>{((t,e,n)=>{const r=n["list-style-type"]?n["list-style-type"]:null;t.setStyle(e,"list-style-type",r)})(t,e,n),((t,e,n)=>{Le(e,n["list-attributes"]),ct.each(t.select("li",e),(t=>{Le(t,n["list-item-attributes"])}))})(t,e,n)},ke=(t,e,n,r)=>{let o=e[n?"startContainer":"endContainer"];const s=e[n?"startOffset":"endOffset"];for(gt(o)&&(o=o.childNodes[Math.min(s,o.childNodes.length-1)]||o),!n&&St(o.nextSibling)&&(o=o.nextSibling);o.parentNode!==r;){const e=o.parentNode;if(Nt(t,o))return o;if(/^(TD|TH)$/.test(e.nodeName))return o;o=e}return o},Te=(t,e,n)=>{const r=t.selection.getRng();let o="LI";const s=Kt(t,t.selection.getStart(!0)),i=t.dom;if("false"===i.getContentEditable(t.selection.getNode()))return;"DL"===(e=e.toUpperCase())&&(o="DT");const a=be(r),l=((t,e,n)=>{const r=[],o=t.dom,s=ke(t,e,!0,n),i=ke(t,e,!1,n);let a;const l=[];for(let t=s;t&&(l.push(t),t!==i);t=t.nextSibling);return ct.each(l,(e=>{var s;if(Nt(t,e))return r.push(e),void(a=null);if(o.isBlock(e)||St(e))return St(e)&&o.remove(e),void(a=null);const i=e.nextSibling;ve.isBookmarkNode(e)&&(ht(i)||Nt(t,i)||!i&&e.parentNode===n)?a=null:(a||(a=o.create("p"),null===(s=e.parentNode)||void 0===s||s.insertBefore(a,e),r.push(a)),a.appendChild(e))})),r})(t,r,s);ct.each(l,(r=>{let s;const a=r.previousSibling,l=r.parentNode;vt(l)||(a&&ht(a)&&a.nodeName===e&&((t,e,n)=>{const r=t.getStyle(e,"list-style-type");let o=n?n["list-style-type"]:"";return o=null===o?"":o,r===o})(i,a,n)?(s=a,r=i.rename(r,o),a.appendChild(r)):(s=i.create(e),l.insertBefore(s,r),s.appendChild(r),r=i.rename(r,o)),((t,e)=>{ct.each(["margin","margin-right","margin-bottom","margin-left","margin-top","padding","padding-right","padding-bottom","padding-left","padding-top"],(n=>t.setStyle(e,n,"")))})(i,r),Oe(i,s,n),we(t.dom,s))})),t.selection.setRng(Se(a))},Ae=(t,e,n)=>{return((t,e)=>ht(t)&&t.nodeName===(null==e?void 0:e.nodeName))(e,n)&&((t,e,n)=>t.getStyle(e,"list-style-type",!0)===t.getStyle(n,"list-style-type",!0))(t,e,n)&&(r=n,e.className===r.className);var r},we=(t,e)=>{let n,r=e.nextSibling;if(Ae(t,e,r)){const o=r;for(;n=o.firstChild;)e.appendChild(n);t.remove(o)}if(r=e.previousSibling,Ae(t,e,r)){const o=r;for(;n=o.lastChild;)e.insertBefore(n,e.firstChild);t.remove(o)}},De=t=>"list-style-type"in t,Ee=(t,e,n)=>{const r=Ht(t);if(Zt(t,r))return;const s=(t=>{const e=Ht(t),n=t.selection.getSelectedBlocks();return((t,e)=>a(t)&&1===e.length&&e[0]===t)(e,n)?(t=>N(t.querySelectorAll(_t),ht))(e):N(n,(t=>ht(t)&&e!==t))})(t),i=o(n)?n:{};s.length>0?((t,e,n,r,o)=>{const s=ht(e);if(s&&e.nodeName===r&&!De(o))ye(t);else{Te(t,r,o);const i=be(t.selection.getRng()),a=s?[e,...n]:n;ct.each(a,(e=>{((t,e,n,r)=>{if(e.nodeName!==n){const o=t.dom.rename(e,n);Oe(t.dom,o,r),Jt(t,Ne(n),o)}else Oe(t.dom,e,r),Jt(t,Ne(n),e)})(t,e,r,o)})),t.selection.setRng(Se(i))}})(t,r,s,e,i):((t,e,n,r)=>{if(e!==t.getBody())if(e)if(e.nodeName!==n||De(r)||Qt(e)){const o=be(t.selection.getRng());Oe(t.dom,e,r);const s=t.dom.rename(e,n);we(t.dom,s),t.selection.setRng(Se(o)),Te(t,n,r),Jt(t,Ne(n),s)}else ye(t);else Te(t,n,r),Jt(t,Ne(n),e)})(t,r,e,i)},Be=dt.DOM,xe=(t,e)=>{const n=ct.grep(t.select("ol,ul",e));ct.each(n,(e=>{((t,e)=>{const n=e.parentElement;if(n&&"LI"===n.nodeName&&n.firstChild===e){const r=n.previousSibling;r&&"LI"===r.nodeName?(r.appendChild(e),Ot(t,n)&&Be.remove(n)):Be.setStyle(n,"listStyleType","none")}if(ht(n)){const t=n.previousSibling;t&&"LI"===t.nodeName&&t.appendChild(e)}})(t,e)}))},Ie=(t,e,n,r)=>{let o=e.startContainer;const s=e.startOffset;if(pt(o)&&(n?s<o.data.length:s>0))return o;const i=t.schema.getNonEmptyElements();gt(o)&&(o=Y.getNode(o,s));const a=new tt(o,r);n&&((t,e)=>!!St(e)&&t.isBlock(e.nextSibling)&&!St(e.previousSibling))(t.dom,o)&&a.next();const l=n?a.next.bind(a):a.prev2.bind(a);for(;o=l();){if("LI"===o.nodeName&&!o.hasChildNodes())return o;if(i[o.nodeName])return o;if(pt(o)&&o.data.length>0)return o}return null},Pe=(t,e)=>{const n=e.childNodes;return 1===n.length&&!ht(n[0])&&t.isBlock(n[0])},Me=(t,e,n)=>{let r;const o=e.parentNode;if(!kt(t,e)||!kt(t,n))return;ht(n.lastChild)&&(r=n.lastChild),o===n.lastChild&&St(o.previousSibling)&&t.remove(o.previousSibling);const s=n.lastChild;s&&St(s)&&e.hasChildNodes()&&t.remove(s),Ot(t,n,!0)&&J(R(n)),((t,e,n)=>{let r;const o=Pe(t,n)?n.firstChild:n;if(((t,e)=>{Pe(t,e)&&t.remove(e.firstChild,!0)})(t,e),!Ot(t,e,!0))for(;r=e.firstChild;)o.appendChild(r)})(t,e,n),r&&n.appendChild(r);const i=((t,e)=>{const n=t.dom,r=e.dom;return n!==r&&n.contains(r)})(R(n),R(e))?t.getParents(e,ht,n):[];t.remove(e),S(i,(e=>{Ot(t,e)&&e!==t.getRoot()&&t.remove(e)}))},Re=(t,e)=>{const n=t.dom,r=t.selection,o=r.getStart(),s=Ft(t,o),i=n.getParent(r.getStart(),"LI",s);if(i){const o=i.parentElement;if(o===t.getBody()&&Ot(n,o))return!0;const a=Ut(r.getRng()),l=n.getParent(Ie(t,a,e,s),"LI",s);if(l&&l!==i)return t.undoManager.transact((()=>{var n,r;e?((t,e,n,r)=>{const o=t.dom;if(o.isEmpty(r))((t,e,n)=>{J(R(n)),Me(t.dom,e,n),t.selection.setCursorLocation(n,0)})(t,n,r);else{const s=be(e);Me(o,n,r),t.selection.setRng(Se(s))}})(t,a,l,i):(null===(r=(n=i).parentNode)||void 0===r?void 0:r.firstChild)===n?fe(t):((t,e,n,r)=>{const o=be(e);Me(t.dom,n,r);const s=Se(o);t.selection.setRng(s)})(t,a,i,l)})),!0;if(!l&&!e&&0===a.startOffset&&0===a.endOffset)return t.undoManager.transact((()=>{ye(t)})),!0}return!1},Ue=t=>{const e=t.selection.getStart(),n=Ft(t,e);return t.dom.getParent(e,"LI,DT,DD",n)||jt(t).length>0},$e=(t,e)=>{const n=t.selection;return!Zt(t,n.getNode())&&(n.isCollapsed()?((t,e)=>Re(t,e)||((t,e)=>{const n=t.dom,r=t.selection.getStart(),o=Ft(t,r),s=n.getParent(r,n.isBlock,o);if(s&&n.isEmpty(s)){const r=Ut(t.selection.getRng()),i=n.getParent(Ie(t,r,e,o),"LI",o);if(i){const a=t=>v(["td","th","caption"],$(t)),l=t=>t.dom===o;return!!((t,e,n=u)=>I(t,e,n).getOr(t.isNone()&&e.isNone()))(q(R(i),a,l),q(R(r.startContainer),a,l),U)&&(t.undoManager.transact((()=>{((t,e,n)=>{const r=t.getParent(e.parentNode,t.isBlock,n);t.remove(e),r&&t.isEmpty(r)&&t.remove(r)})(n,s,o),we(n,i.parentNode),t.selection.select(i,!0),t.selection.collapse(e)})),!0)}}return!1})(t,e))(t,e):(t=>!!Ue(t)&&(t.undoManager.transact((()=>{t.execCommand("Delete"),xe(t.dom,t.getBody())})),!0))(t))},_e=t=>{const e=A(Xt(t).split("")),n=b(e,((t,e)=>{const n=t.toUpperCase().charCodeAt(0)-"A".charCodeAt(0)+1;return Math.pow(26,e)*n}));return L(n,((t,e)=>t+e),0)},He=t=>{if(--t<0)return"";{const e=t%26,n=Math.floor(t/26);return He(n)+String.fromCharCode("A".charCodeAt(0)+e)}},je=t=>{const e=parseInt(t.start,10);return x(t.listStyleType,"upper-alpha")?He(e):x(t.listStyleType,"lower-alpha")?He(e).toLowerCase():t.start},Fe=(t,e)=>()=>{const n=Ht(t);return a(n)&&n.nodeName===e},Ke=t=>{t.addCommand("mceListProps",(()=>{(t=>{const e=Ht(t);yt(e)&&!Zt(t,e)&&t.windowManager.open({title:"List Properties",body:{type:"panel",items:[{type:"input",name:"start",label:"Start list at number",inputMode:"numeric"}]},initialData:{start:je({start:t.dom.getAttrib(e,"start","1"),listStyleType:g.from(t.dom.getStyle(e,"list-style-type"))})},buttons:[{type:"cancel",name:"cancel",text:"Cancel"},{type:"submit",name:"save",text:"Save",primary:!0}],onSubmit:e=>{(t=>{switch((t=>/^[0-9]+$/.test(t)?2:/^[A-Z]+$/.test(t)?0:/^[a-z]+$/.test(t)?1:t.length>0?4:3)(t)){case 2:return g.some({listStyleType:g.none(),start:t});case 0:return g.some({listStyleType:g.some("upper-alpha"),start:_e(t).toString()});case 1:return g.some({listStyleType:g.some("lower-alpha"),start:_e(t).toString()});case 3:return g.some({listStyleType:g.none(),start:""});case 4:return g.none()}})(e.getData().start).each((e=>{t.execCommand("mceListUpdate",!1,{attrs:{start:"1"===e.start?"":e.start},styles:{"list-style-type":e.listStyleType.getOr("")}})})),e.close()}})})(t)}))},Ve=(t,e)=>n=>Gt(t,(r=>{n.setActive(qt(r.parents,e)),n.setEnabled(!Zt(t,r.element))})),ze=(t,e)=>n=>Gt(t,(r=>n.setEnabled(qt(r.parents,e)&&!Zt(t,r.element))));t.add("lists",(t=>((t=>{(0,t.options.register)("lists_indent_on_tab",{processor:"boolean",default:!0})})(t),t.hasPlugin("rtc",!0)?Ke(t):((t=>{At(t)&&(t=>{t.on("keydown",(e=>{e.keyCode!==et.TAB||et.metaKeyPressed(e)||t.undoManager.transact((()=>{(e.shiftKey?fe(t):he(t))&&e.preventDefault()}))}))})(t),(t=>{t.on("ExecCommand",(e=>{const n=e.command.toLowerCase();"delete"!==n&&"forwarddelete"!==n||!Ue(t)||xe(t.dom,t.getBody())})),t.on("keydown",(e=>{e.keyCode===et.BACKSPACE?$e(t,!1)&&e.preventDefault():e.keyCode===et.DELETE&&$e(t,!0)&&e.preventDefault()}))})(t)})(t),(t=>{t.on("BeforeExecCommand",(e=>{const n=e.command.toLowerCase();"indent"===n?he(t):"outdent"===n&&fe(t)})),t.addCommand("InsertUnorderedList",((e,n)=>{Ee(t,"UL",n)})),t.addCommand("InsertOrderedList",((e,n)=>{Ee(t,"OL",n)})),t.addCommand("InsertDefinitionList",((e,n)=>{Ee(t,"DL",n)})),t.addCommand("RemoveList",(()=>{ye(t)})),Ke(t),t.addCommand("mceListUpdate",((e,n)=>{o(n)&&((t,e)=>{const n=Ht(t);null===n||Zt(t,n)||t.undoManager.transact((()=>{o(e.styles)&&t.dom.setStyles(n,e.styles),o(e.attrs)&&ot(e.attrs,((e,r)=>t.dom.setAttrib(n,r,e)))}))})(t,n)})),t.addQueryStateHandler("InsertUnorderedList",Fe(t,"UL")),t.addQueryStateHandler("InsertOrderedList",Fe(t,"OL")),t.addQueryStateHandler("InsertDefinitionList",Fe(t,"DL"))})(t)),(t=>{const e=e=>()=>t.execCommand(e);t.hasPlugin("advlist")||(t.ui.registry.addToggleButton("numlist",{icon:"ordered-list",active:!1,tooltip:"Numbered list",onAction:e("InsertOrderedList"),onSetup:Ve(t,"OL")}),t.ui.registry.addToggleButton("bullist",{icon:"unordered-list",active:!1,tooltip:"Bullet list",onAction:e("InsertUnorderedList"),onSetup:Ve(t,"UL")}))})(t),(t=>{const e={text:"List properties...",icon:"ordered-list",onAction:()=>t.execCommand("mceListProps"),onSetup:ze(t,"OL")};t.ui.registry.addMenuItem("listprops",e),t.ui.registry.addContextMenu("lists",{update:e=>{const n=Ht(t,e);return yt(n)?["listprops"]:[]}})})(t),(t=>({backspaceDelete:e=>{$e(t,e)}}))(t))))}();