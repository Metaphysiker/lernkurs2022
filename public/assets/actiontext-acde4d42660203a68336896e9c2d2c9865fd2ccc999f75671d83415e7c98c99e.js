var commonjsGlobal="undefined"!=typeof globalThis?globalThis:"undefined"!=typeof window?window:"undefined"!=typeof global?global:"undefined"!=typeof self?self:{},activestorage={exports:{}};!function(t,e){var r;r=function(t){function e(t){const e=i(document.head,`meta[name="${t}"]`);if(e)return e.getAttribute("content")}function r(t,e){return"string"==typeof t&&(e=t,t=document),n(t.querySelectorAll(e))}function i(t,e){return"string"==typeof t&&(e=t,t=document),t.querySelector(e)}function s(t,e,r={}){const{disabled:i}=t,{bubbles:s,cancelable:n,detail:a}=r,o=document.createEvent("Event");o.initEvent(e,s||!0,n||!0),o.detail=a||{};try{t.disabled=!1,t.dispatchEvent(o)}finally{t.disabled=i}return o}function n(t){return Array.isArray(t)?t:Array.from?Array.from(t):[].slice.call(t)}function a(t,e,...r){if(t&&"function"==typeof t[e])return t[e](...r)}function o(){C||(C=!0,document.addEventListener("click",h,!0),document.addEventListener("submit",u,!0),document.addEventListener("ajax:before",l))}function h(t){const{target:e}=t;"INPUT"!=e.tagName&&"BUTTON"!=e.tagName||"submit"!=e.type||!e.form||B.set(e.form,e)}function u(t){c(t)}function l(t){"FORM"==t.target.tagName&&c(t)}function c(t){const e=t.target;if(e.hasAttribute(k))return void t.preventDefault();const r=new S(e),{inputs:i}=r;i.length&&(t.preventDefault(),e.setAttribute(k,""),i.forEach(f),r.start((t=>{e.removeAttribute(k),t?i.forEach(p):d(e)})))}function d(t){let e=B.get(t)||i(t,"input[type=submit], button[type=submit]");if(e){const{disabled:t}=e;e.disabled=!1,e.focus(),e.click(),e.disabled=t}else e=document.createElement("input"),e.type="submit",e.style.display="none",t.appendChild(e),e.click(),t.removeChild(e);B.delete(t)}function f(t){t.disabled=!0}function p(t){t.disabled=!1}function b(){window.ActiveStorage&&o()}var y={exports:{}};!function(t){var e;e=function(t){function e(t,e){var r=t[0],i=t[1],s=t[2],n=t[3];i=((i+=((s=((s+=((n=((n+=((r=((r+=(i&s|~i&n)+e[0]-680876936|0)<<7|r>>>25)+i|0)&i|~r&s)+e[1]-389564586|0)<<12|n>>>20)+r|0)&r|~n&i)+e[2]+606105819|0)<<17|s>>>15)+n|0)&n|~s&r)+e[3]-1044525330|0)<<22|i>>>10)+s|0,i=((i+=((s=((s+=((n=((n+=((r=((r+=(i&s|~i&n)+e[4]-176418897|0)<<7|r>>>25)+i|0)&i|~r&s)+e[5]+1200080426|0)<<12|n>>>20)+r|0)&r|~n&i)+e[6]-1473231341|0)<<17|s>>>15)+n|0)&n|~s&r)+e[7]-45705983|0)<<22|i>>>10)+s|0,i=((i+=((s=((s+=((n=((n+=((r=((r+=(i&s|~i&n)+e[8]+1770035416|0)<<7|r>>>25)+i|0)&i|~r&s)+e[9]-1958414417|0)<<12|n>>>20)+r|0)&r|~n&i)+e[10]-42063|0)<<17|s>>>15)+n|0)&n|~s&r)+e[11]-1990404162|0)<<22|i>>>10)+s|0,i=((i+=((s=((s+=((n=((n+=((r=((r+=(i&s|~i&n)+e[12]+1804603682|0)<<7|r>>>25)+i|0)&i|~r&s)+e[13]-40341101|0)<<12|n>>>20)+r|0)&r|~n&i)+e[14]-1502002290|0)<<17|s>>>15)+n|0)&n|~s&r)+e[15]+1236535329|0)<<22|i>>>10)+s|0,i=((i+=((s=((s+=((n=((n+=((r=((r+=(i&n|s&~n)+e[1]-165796510|0)<<5|r>>>27)+i|0)&s|i&~s)+e[6]-1069501632|0)<<9|n>>>23)+r|0)&i|r&~i)+e[11]+643717713|0)<<14|s>>>18)+n|0)&r|n&~r)+e[0]-373897302|0)<<20|i>>>12)+s|0,i=((i+=((s=((s+=((n=((n+=((r=((r+=(i&n|s&~n)+e[5]-701558691|0)<<5|r>>>27)+i|0)&s|i&~s)+e[10]+38016083|0)<<9|n>>>23)+r|0)&i|r&~i)+e[15]-660478335|0)<<14|s>>>18)+n|0)&r|n&~r)+e[4]-405537848|0)<<20|i>>>12)+s|0,i=((i+=((s=((s+=((n=((n+=((r=((r+=(i&n|s&~n)+e[9]+568446438|0)<<5|r>>>27)+i|0)&s|i&~s)+e[14]-1019803690|0)<<9|n>>>23)+r|0)&i|r&~i)+e[3]-187363961|0)<<14|s>>>18)+n|0)&r|n&~r)+e[8]+1163531501|0)<<20|i>>>12)+s|0,i=((i+=((s=((s+=((n=((n+=((r=((r+=(i&n|s&~n)+e[13]-1444681467|0)<<5|r>>>27)+i|0)&s|i&~s)+e[2]-51403784|0)<<9|n>>>23)+r|0)&i|r&~i)+e[7]+1735328473|0)<<14|s>>>18)+n|0)&r|n&~r)+e[12]-1926607734|0)<<20|i>>>12)+s|0,i=((i+=((s=((s+=((n=((n+=((r=((r+=(i^s^n)+e[5]-378558|0)<<4|r>>>28)+i|0)^i^s)+e[8]-2022574463|0)<<11|n>>>21)+r|0)^r^i)+e[11]+1839030562|0)<<16|s>>>16)+n|0)^n^r)+e[14]-35309556|0)<<23|i>>>9)+s|0,i=((i+=((s=((s+=((n=((n+=((r=((r+=(i^s^n)+e[1]-1530992060|0)<<4|r>>>28)+i|0)^i^s)+e[4]+1272893353|0)<<11|n>>>21)+r|0)^r^i)+e[7]-155497632|0)<<16|s>>>16)+n|0)^n^r)+e[10]-1094730640|0)<<23|i>>>9)+s|0,i=((i+=((s=((s+=((n=((n+=((r=((r+=(i^s^n)+e[13]+681279174|0)<<4|r>>>28)+i|0)^i^s)+e[0]-358537222|0)<<11|n>>>21)+r|0)^r^i)+e[3]-722521979|0)<<16|s>>>16)+n|0)^n^r)+e[6]+76029189|0)<<23|i>>>9)+s|0,i=((i+=((s=((s+=((n=((n+=((r=((r+=(i^s^n)+e[9]-640364487|0)<<4|r>>>28)+i|0)^i^s)+e[12]-421815835|0)<<11|n>>>21)+r|0)^r^i)+e[15]+530742520|0)<<16|s>>>16)+n|0)^n^r)+e[2]-995338651|0)<<23|i>>>9)+s|0,i=((i+=((n=((n+=(i^((r=((r+=(s^(i|~n))+e[0]-198630844|0)<<6|r>>>26)+i|0)|~s))+e[7]+1126891415|0)<<10|n>>>22)+r|0)^((s=((s+=(r^(n|~i))+e[14]-1416354905|0)<<15|s>>>17)+n|0)|~r))+e[5]-57434055|0)<<21|i>>>11)+s|0,i=((i+=((n=((n+=(i^((r=((r+=(s^(i|~n))+e[12]+1700485571|0)<<6|r>>>26)+i|0)|~s))+e[3]-1894986606|0)<<10|n>>>22)+r|0)^((s=((s+=(r^(n|~i))+e[10]-1051523|0)<<15|s>>>17)+n|0)|~r))+e[1]-2054922799|0)<<21|i>>>11)+s|0,i=((i+=((n=((n+=(i^((r=((r+=(s^(i|~n))+e[8]+1873313359|0)<<6|r>>>26)+i|0)|~s))+e[15]-30611744|0)<<10|n>>>22)+r|0)^((s=((s+=(r^(n|~i))+e[6]-1560198380|0)<<15|s>>>17)+n|0)|~r))+e[13]+1309151649|0)<<21|i>>>11)+s|0,i=((i+=((n=((n+=(i^((r=((r+=(s^(i|~n))+e[4]-145523070|0)<<6|r>>>26)+i|0)|~s))+e[11]-1120210379|0)<<10|n>>>22)+r|0)^((s=((s+=(r^(n|~i))+e[2]+718787259|0)<<15|s>>>17)+n|0)|~r))+e[9]-343485551|0)<<21|i>>>11)+s|0,t[0]=r+t[0]|0,t[1]=i+t[1]|0,t[2]=s+t[2]|0,t[3]=n+t[3]|0}function r(t){var e,r=[];for(e=0;e<64;e+=4)r[e>>2]=t.charCodeAt(e)+(t.charCodeAt(e+1)<<8)+(t.charCodeAt(e+2)<<16)+(t.charCodeAt(e+3)<<24);return r}function i(t){var e,r=[];for(e=0;e<64;e+=4)r[e>>2]=t[e]+(t[e+1]<<8)+(t[e+2]<<16)+(t[e+3]<<24);return r}function s(t){var i,s,n,a,o,h,u=t.length,l=[1732584193,-271733879,-1732584194,271733878];for(i=64;i<=u;i+=64)e(l,r(t.substring(i-64,i)));for(s=(t=t.substring(i-64)).length,n=[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],i=0;i<s;i+=1)n[i>>2]|=t.charCodeAt(i)<<(i%4<<3);if(n[i>>2]|=128<<(i%4<<3),i>55)for(e(l,n),i=0;i<16;i+=1)n[i]=0;return a=(a=8*u).toString(16).match(/(.*?)(.{0,8})$/),o=parseInt(a[2],16),h=parseInt(a[1],16)||0,n[14]=o,n[15]=h,e(l,n),l}function n(t){var r,s,n,a,o,h,u=t.length,l=[1732584193,-271733879,-1732584194,271733878];for(r=64;r<=u;r+=64)e(l,i(t.subarray(r-64,r)));for(s=(t=r-64<u?t.subarray(r-64):new Uint8Array(0)).length,n=[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],r=0;r<s;r+=1)n[r>>2]|=t[r]<<(r%4<<3);if(n[r>>2]|=128<<(r%4<<3),r>55)for(e(l,n),r=0;r<16;r+=1)n[r]=0;return a=(a=8*u).toString(16).match(/(.*?)(.{0,8})$/),o=parseInt(a[2],16),h=parseInt(a[1],16)||0,n[14]=o,n[15]=h,e(l,n),l}function a(t){var e,r="";for(e=0;e<4;e+=1)r+=p[t>>8*e+4&15]+p[t>>8*e&15];return r}function o(t){var e;for(e=0;e<t.length;e+=1)t[e]=a(t[e]);return t.join("")}function h(t){return/[\u0080-\uFFFF]/.test(t)&&(t=unescape(encodeURIComponent(t))),t}function u(t,e){var r,i=t.length,s=new ArrayBuffer(i),n=new Uint8Array(s);for(r=0;r<i;r+=1)n[r]=t.charCodeAt(r);return e?n:s}function l(t){return String.fromCharCode.apply(null,new Uint8Array(t))}function c(t,e,r){var i=new Uint8Array(t.byteLength+e.byteLength);return i.set(new Uint8Array(t)),i.set(new Uint8Array(e),t.byteLength),r?i:i.buffer}function d(t){var e,r=[],i=t.length;for(e=0;e<i-1;e+=2)r.push(parseInt(t.substr(e,2),16));return String.fromCharCode.apply(String,r)}function f(){this.reset()}var p=["0","1","2","3","4","5","6","7","8","9","a","b","c","d","e","f"];return o(s("hello")),"undefined"==typeof ArrayBuffer||ArrayBuffer.prototype.slice||function(){function e(t,e){return(t=0|t||0)<0?Math.max(t+e,0):Math.min(t,e)}ArrayBuffer.prototype.slice=function(r,i){var s,n,a,o,h=this.byteLength,u=e(r,h),l=h;return i!==t&&(l=e(i,h)),u>l?new ArrayBuffer(0):(s=l-u,n=new ArrayBuffer(s),a=new Uint8Array(n),o=new Uint8Array(this,u,s),a.set(o),n)}}(),f.prototype.append=function(t){return this.appendBinary(h(t)),this},f.prototype.appendBinary=function(t){this._buff+=t,this._length+=t.length;var i,s=this._buff.length;for(i=64;i<=s;i+=64)e(this._hash,r(this._buff.substring(i-64,i)));return this._buff=this._buff.substring(i-64),this},f.prototype.end=function(t){var e,r,i=this._buff,s=i.length,n=[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];for(e=0;e<s;e+=1)n[e>>2]|=i.charCodeAt(e)<<(e%4<<3);return this._finish(n,s),r=o(this._hash),t&&(r=d(r)),this.reset(),r},f.prototype.reset=function(){return this._buff="",this._length=0,this._hash=[1732584193,-271733879,-1732584194,271733878],this},f.prototype.getState=function(){return{buff:this._buff,length:this._length,hash:this._hash.slice()}},f.prototype.setState=function(t){return this._buff=t.buff,this._length=t.length,this._hash=t.hash,this},f.prototype.destroy=function(){delete this._hash,delete this._buff,delete this._length},f.prototype._finish=function(t,r){var i,s,n,a=r;if(t[a>>2]|=128<<(a%4<<3),a>55)for(e(this._hash,t),a=0;a<16;a+=1)t[a]=0;i=(i=8*this._length).toString(16).match(/(.*?)(.{0,8})$/),s=parseInt(i[2],16),n=parseInt(i[1],16)||0,t[14]=s,t[15]=n,e(this._hash,t)},f.hash=function(t,e){return f.hashBinary(h(t),e)},f.hashBinary=function(t,e){var r=o(s(t));return e?d(r):r},f.ArrayBuffer=function(){this.reset()},f.ArrayBuffer.prototype.append=function(t){var r,s=c(this._buff.buffer,t,!0),n=s.length;for(this._length+=t.byteLength,r=64;r<=n;r+=64)e(this._hash,i(s.subarray(r-64,r)));return this._buff=r-64<n?new Uint8Array(s.buffer.slice(r-64)):new Uint8Array(0),this},f.ArrayBuffer.prototype.end=function(t){var e,r,i=this._buff,s=i.length,n=[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];for(e=0;e<s;e+=1)n[e>>2]|=i[e]<<(e%4<<3);return this._finish(n,s),r=o(this._hash),t&&(r=d(r)),this.reset(),r},f.ArrayBuffer.prototype.reset=function(){return this._buff=new Uint8Array(0),this._length=0,this._hash=[1732584193,-271733879,-1732584194,271733878],this},f.ArrayBuffer.prototype.getState=function(){var t=f.prototype.getState.call(this);return t.buff=l(t.buff),t},f.ArrayBuffer.prototype.setState=function(t){return t.buff=u(t.buff,!0),f.prototype.setState.call(this,t)},f.ArrayBuffer.prototype.destroy=f.prototype.destroy,f.ArrayBuffer.prototype._finish=f.prototype._finish,f.ArrayBuffer.hash=function(t,e){var r=o(n(new Uint8Array(t)));return e?d(r):r},f},t.exports=e()}(y);var g=y.exports;const m=File.prototype.slice||File.prototype.mozSlice||File.prototype.webkitSlice;class v{static create(t,e){new v(t).create(e)}constructor(t){this.file=t,this.chunkSize=2097152,this.chunkCount=Math.ceil(this.file.size/this.chunkSize),this.chunkIndex=0}create(t){this.callback=t,this.md5Buffer=new g.ArrayBuffer,this.fileReader=new FileReader,this.fileReader.addEventListener("load",(t=>this.fileReaderDidLoad(t))),this.fileReader.addEventListener("error",(t=>this.fileReaderDidError(t))),this.readNextChunk()}fileReaderDidLoad(t){if(this.md5Buffer.append(t.target.result),!this.readNextChunk()){const t=this.md5Buffer.end(!0),e=btoa(t);this.callback(null,e)}}fileReaderDidError(t){this.callback(`Error reading ${this.file.name}`)}readNextChunk(){if(this.chunkIndex<this.chunkCount||0==this.chunkIndex&&0==this.chunkCount){const t=this.chunkIndex*this.chunkSize,e=Math.min(t+this.chunkSize,this.file.size),r=m.call(this.file,t,e);return this.fileReader.readAsArrayBuffer(r),this.chunkIndex++,!0}return!1}}class A{constructor(t,r,i){this.file=t,this.attributes={filename:t.name,content_type:t.type||"application/octet-stream",byte_size:t.size,checksum:r},this.xhr=new XMLHttpRequest,this.xhr.open("POST",i,!0),this.xhr.responseType="json",this.xhr.setRequestHeader("Content-Type","application/json"),this.xhr.setRequestHeader("Accept","application/json"),this.xhr.setRequestHeader("X-Requested-With","XMLHttpRequest");const s=e("csrf-token");null!=s&&this.xhr.setRequestHeader("X-CSRF-Token",s),this.xhr.addEventListener("load",(t=>this.requestDidLoad(t))),this.xhr.addEventListener("error",(t=>this.requestDidError(t)))}get status(){return this.xhr.status}get response(){const{responseType:t,response:e}=this.xhr;return"json"==t?e:JSON.parse(e)}create(t){this.callback=t,this.xhr.send(JSON.stringify({blob:this.attributes}))}requestDidLoad(t){if(this.status>=200&&this.status<300){const{response:t}=this,{direct_upload:e}=t;delete t.direct_upload,this.attributes=t,this.directUploadData=e,this.callback(null,this.toJSON())}else this.requestDidError(t)}requestDidError(t){this.callback(`Error creating Blob for "${this.file.name}". Status: ${this.status}`)}toJSON(){const t={};for(const e in this.attributes)t[e]=this.attributes[e];return t}}class U{constructor(t){this.blob=t,this.file=t.file;const{url:e,headers:r}=t.directUploadData;this.xhr=new XMLHttpRequest,this.xhr.open("PUT",e,!0),this.xhr.responseType="text";for(const t in r)this.xhr.setRequestHeader(t,r[t]);this.xhr.addEventListener("load",(t=>this.requestDidLoad(t))),this.xhr.addEventListener("error",(t=>this.requestDidError(t)))}create(t){this.callback=t,this.xhr.send(this.file.slice())}requestDidLoad(t){const{status:e,response:r}=this.xhr;e>=200&&e<300?this.callback(null,r):this.requestDidError(t)}requestDidError(t){this.callback(`Error storing "${this.file.name}". Status: ${this.xhr.status}`)}}let _=0;class x{constructor(t,e,r){this.id=++_,this.file=t,this.url=e,this.delegate=r}create(t){v.create(this.file,((e,r)=>{if(e)return void t(e);const i=new A(this.file,r,this.url);a(this.delegate,"directUploadWillCreateBlobWithXHR",i.xhr),i.create((e=>{if(e)t(e);else{const e=new U(i);a(this.delegate,"directUploadWillStoreFileWithXHR",e.xhr),e.create((e=>{e?t(e):t(null,i.toJSON())}))}}))}))}}class w{constructor(t,e){this.input=t,this.file=e,this.directUpload=new x(this.file,this.url,this),this.dispatch("initialize")}start(t){const e=document.createElement("input");e.type="hidden",e.name=this.input.name,this.input.insertAdjacentElement("beforebegin",e),this.dispatch("start"),this.directUpload.create(((r,i)=>{r?(e.parentNode.removeChild(e),this.dispatchError(r)):e.value=i.signed_id,this.dispatch("end"),t(r)}))}uploadRequestDidProgress(t){const e=t.loaded/t.total*100;e&&this.dispatch("progress",{progress:e})}get url(){return this.input.getAttribute("data-direct-upload-url")}dispatch(t,e={}){return e.file=this.file,e.id=this.directUpload.id,s(this.input,`direct-upload:${t}`,{detail:e})}dispatchError(t){this.dispatch("error",{error:t}).defaultPrevented||alert(t)}directUploadWillCreateBlobWithXHR(t){this.dispatch("before-blob-request",{xhr:t})}directUploadWillStoreFileWithXHR(t){this.dispatch("before-storage-request",{xhr:t}),t.upload.addEventListener("progress",(t=>this.uploadRequestDidProgress(t)))}}const E="input[type=file][data-direct-upload-url]:not([disabled])";class S{constructor(t){this.form=t,this.inputs=r(t,E).filter((t=>t.files.length))}start(t){const e=this.createDirectUploadControllers(),r=()=>{const i=e.shift();i?i.start((e=>{e?(t(e),this.dispatch("end")):r()})):(t(),this.dispatch("end"))};this.dispatch("start"),r()}createDirectUploadControllers(){const t=[];return this.inputs.forEach((e=>{n(e.files).forEach((r=>{const i=new w(e,r);t.push(i)}))})),t}dispatch(t,e={}){return s(this.form,`direct-uploads:${t}`,{detail:e})}}const k="data-direct-uploads-processing",B=new WeakMap;let C=!1;setTimeout(b,1),t.DirectUpload=x,t.start=o,Object.defineProperty(t,"__esModule",{value:!0})},r(e)}(0,activestorage.exports);class AttachmentUpload{constructor(t,e){this.attachment=t,this.element=e,this.directUpload=new activestorage.exports.DirectUpload(t.file,this.directUploadUrl,this)}start(){this.directUpload.create(this.directUploadDidComplete.bind(this))}directUploadWillStoreFileWithXHR(t){t.upload.addEventListener("progress",(t=>{const e=t.loaded/t.total*100;this.attachment.setUploadProgress(e)}))}directUploadDidComplete(t,e){if(t)throw new Error(`Direct upload failed: ${t}`);this.attachment.setAttributes({sgid:e.attachable_sgid,url:this.createBlobUrl(e.signed_id,e.filename)})}createBlobUrl(t,e){return this.blobUrlTemplate.replace(":signed_id",t).replace(":filename",encodeURIComponent(e))}get directUploadUrl(){return this.element.dataset.directUploadUrl}get blobUrlTemplate(){return this.element.dataset.blobUrlTemplate}}addEventListener("trix-attachment-add",(t=>{const{attachment:e,target:r}=t;if(e.file){new AttachmentUpload(e,r).start()}}));