class EventListener{constructor(e,t,r){this.eventTarget=e,this.eventName=t,this.eventOptions=r,this.unorderedBindings=new Set}connect(){this.eventTarget.addEventListener(this.eventName,this,this.eventOptions)}disconnect(){this.eventTarget.removeEventListener(this.eventName,this,this.eventOptions)}bindingConnected(e){this.unorderedBindings.add(e)}bindingDisconnected(e){this.unorderedBindings.delete(e)}handleEvent(e){const t=extendEvent(e);for(const e of this.bindings){if(t.immediatePropagationStopped)break;e.handleEvent(t)}}get bindings(){return Array.from(this.unorderedBindings).sort(((e,t)=>{const r=e.index,s=t.index;return r<s?-1:r>s?1:0}))}}function extendEvent(e){if("immediatePropagationStopped"in e)return e;{const{stopImmediatePropagation:t}=e;return Object.assign(e,{immediatePropagationStopped:!1,stopImmediatePropagation(){this.immediatePropagationStopped=!0,t.call(this)}})}}class Dispatcher{constructor(e){this.application=e,this.eventListenerMaps=new Map,this.started=!1}start(){this.started||(this.started=!0,this.eventListeners.forEach((e=>e.connect())))}stop(){this.started&&(this.started=!1,this.eventListeners.forEach((e=>e.disconnect())))}get eventListeners(){return Array.from(this.eventListenerMaps.values()).reduce(((e,t)=>e.concat(Array.from(t.values()))),[])}bindingConnected(e){this.fetchEventListenerForBinding(e).bindingConnected(e)}bindingDisconnected(e){this.fetchEventListenerForBinding(e).bindingDisconnected(e)}handleError(e,t,r={}){this.application.handleError(e,`Error ${t}`,r)}fetchEventListenerForBinding(e){const{eventTarget:t,eventName:r,eventOptions:s}=e;return this.fetchEventListener(t,r,s)}fetchEventListener(e,t,r){const s=this.fetchEventListenerMapForEventTarget(e),n=this.cacheKey(t,r);let i=s.get(n);return i||(i=this.createEventListener(e,t,r),s.set(n,i)),i}createEventListener(e,t,r){const s=new EventListener(e,t,r);return this.started&&s.connect(),s}fetchEventListenerMapForEventTarget(e){let t=this.eventListenerMaps.get(e);return t||(t=new Map,this.eventListenerMaps.set(e,t)),t}cacheKey(e,t){const r=[e];return Object.keys(t).sort().forEach((e=>{r.push(`${t[e]?"":"!"}${e}`)})),r.join(":")}}const descriptorPattern=/^((.+?)(@(window|document))?->)?(.+?)(#([^:]+?))(:(.+))?$/;function parseActionDescriptorString(e){const t=e.trim().match(descriptorPattern)||[];return{eventTarget:parseEventTarget(t[4]),eventName:t[2],eventOptions:t[9]?parseEventOptions(t[9]):{},identifier:t[5],methodName:t[7]}}function parseEventTarget(e){return"window"==e?window:"document"==e?document:void 0}function parseEventOptions(e){return e.split(":").reduce(((e,t)=>Object.assign(e,{[t.replace(/^!/,"")]:!/^!/.test(t)})),{})}function stringifyEventTarget(e){return e==window?"window":e==document?"document":void 0}function camelize(e){return e.replace(/(?:[_-])([a-z0-9])/g,((e,t)=>t.toUpperCase()))}function capitalize(e){return e.charAt(0).toUpperCase()+e.slice(1)}function dasherize(e){return e.replace(/([A-Z])/g,((e,t)=>`-${t.toLowerCase()}`))}function tokenize(e){return e.match(/[^\s]+/g)||[]}class Action{constructor(e,t,r){this.element=e,this.index=t,this.eventTarget=r.eventTarget||e,this.eventName=r.eventName||getDefaultEventNameForElement(e)||error("missing event name"),this.eventOptions=r.eventOptions||{},this.identifier=r.identifier||error("missing identifier"),this.methodName=r.methodName||error("missing method name")}static forToken(e){return new this(e.element,e.index,parseActionDescriptorString(e.content))}toString(){const e=this.eventTargetName?`@${this.eventTargetName}`:"";return`${this.eventName}${e}->${this.identifier}#${this.methodName}`}get params(){const e={},t=new RegExp(`^data-${this.identifier}-(.+)-param$`);for(const{name:r,value:s}of Array.from(this.element.attributes)){const n=r.match(t),i=n&&n[1];i&&(e[camelize(i)]=typecast(s))}return e}get eventTargetName(){return stringifyEventTarget(this.eventTarget)}}const defaultEventNames={a:e=>"click",button:e=>"click",form:e=>"submit",details:e=>"toggle",input:e=>"submit"==e.getAttribute("type")?"click":"input",select:e=>"change",textarea:e=>"input"};function getDefaultEventNameForElement(e){const t=e.tagName.toLowerCase();if(t in defaultEventNames)return defaultEventNames[t](e)}function error(e){throw new Error(e)}function typecast(e){try{return JSON.parse(e)}catch(t){return e}}class Binding{constructor(e,t){this.context=e,this.action=t}get index(){return this.action.index}get eventTarget(){return this.action.eventTarget}get eventOptions(){return this.action.eventOptions}get identifier(){return this.context.identifier}handleEvent(e){this.willBeInvokedByEvent(e)&&this.shouldBeInvokedPerSelf(e)&&(this.processStopPropagation(e),this.processPreventDefault(e),this.invokeWithEvent(e))}get eventName(){return this.action.eventName}get method(){const e=this.controller[this.methodName];if("function"==typeof e)return e;throw new Error(`Action "${this.action}" references undefined method "${this.methodName}"`)}processStopPropagation(e){this.eventOptions.stop&&e.stopPropagation()}processPreventDefault(e){this.eventOptions.prevent&&e.preventDefault()}invokeWithEvent(e){const{target:t,currentTarget:r}=e;try{const{params:s}=this.action,n=Object.assign(e,{params:s});this.method.call(this.controller,n),this.context.logDebugActivity(this.methodName,{event:e,target:t,currentTarget:r,action:this.methodName})}catch(t){const{identifier:r,controller:s,element:n,index:i}=this,o={identifier:r,controller:s,element:n,index:i,event:e};this.context.handleError(t,`invoking action "${this.action}"`,o)}}shouldBeInvokedPerSelf(e){return!0!==this.action.eventOptions.self||this.action.element===e.target}willBeInvokedByEvent(e){const t=e.target;return this.element===t||(t instanceof Element&&this.element.contains(t)?this.scope.containsElement(t):this.scope.containsElement(this.action.element))}get controller(){return this.context.controller}get methodName(){return this.action.methodName}get element(){return this.scope.element}get scope(){return this.context.scope}}class ElementObserver{constructor(e,t){this.mutationObserverInit={attributes:!0,childList:!0,subtree:!0},this.element=e,this.started=!1,this.delegate=t,this.elements=new Set,this.mutationObserver=new MutationObserver((e=>this.processMutations(e)))}start(){this.started||(this.started=!0,this.mutationObserver.observe(this.element,this.mutationObserverInit),this.refresh())}pause(e){this.started&&(this.mutationObserver.disconnect(),this.started=!1),e(),this.started||(this.mutationObserver.observe(this.element,this.mutationObserverInit),this.started=!0)}stop(){this.started&&(this.mutationObserver.takeRecords(),this.mutationObserver.disconnect(),this.started=!1)}refresh(){if(this.started){const e=new Set(this.matchElementsInTree());for(const t of Array.from(this.elements))e.has(t)||this.removeElement(t);for(const t of Array.from(e))this.addElement(t)}}processMutations(e){if(this.started)for(const t of e)this.processMutation(t)}processMutation(e){"attributes"==e.type?this.processAttributeChange(e.target,e.attributeName):"childList"==e.type&&(this.processRemovedNodes(e.removedNodes),this.processAddedNodes(e.addedNodes))}processAttributeChange(e,t){const r=e;this.elements.has(r)?this.delegate.elementAttributeChanged&&this.matchElement(r)?this.delegate.elementAttributeChanged(r,t):this.removeElement(r):this.matchElement(r)&&this.addElement(r)}processRemovedNodes(e){for(const t of Array.from(e)){const e=this.elementFromNode(t);e&&this.processTree(e,this.removeElement)}}processAddedNodes(e){for(const t of Array.from(e)){const e=this.elementFromNode(t);e&&this.elementIsActive(e)&&this.processTree(e,this.addElement)}}matchElement(e){return this.delegate.matchElement(e)}matchElementsInTree(e=this.element){return this.delegate.matchElementsInTree(e)}processTree(e,t){for(const r of this.matchElementsInTree(e))t.call(this,r)}elementFromNode(e){if(e.nodeType==Node.ELEMENT_NODE)return e}elementIsActive(e){return e.isConnected==this.element.isConnected&&this.element.contains(e)}addElement(e){this.elements.has(e)||this.elementIsActive(e)&&(this.elements.add(e),this.delegate.elementMatched&&this.delegate.elementMatched(e))}removeElement(e){this.elements.has(e)&&(this.elements.delete(e),this.delegate.elementUnmatched&&this.delegate.elementUnmatched(e))}}class AttributeObserver{constructor(e,t,r){this.attributeName=t,this.delegate=r,this.elementObserver=new ElementObserver(e,this)}get element(){return this.elementObserver.element}get selector(){return`[${this.attributeName}]`}start(){this.elementObserver.start()}pause(e){this.elementObserver.pause(e)}stop(){this.elementObserver.stop()}refresh(){this.elementObserver.refresh()}get started(){return this.elementObserver.started}matchElement(e){return e.hasAttribute(this.attributeName)}matchElementsInTree(e){const t=this.matchElement(e)?[e]:[],r=Array.from(e.querySelectorAll(this.selector));return t.concat(r)}elementMatched(e){this.delegate.elementMatchedAttribute&&this.delegate.elementMatchedAttribute(e,this.attributeName)}elementUnmatched(e){this.delegate.elementUnmatchedAttribute&&this.delegate.elementUnmatchedAttribute(e,this.attributeName)}elementAttributeChanged(e,t){this.delegate.elementAttributeValueChanged&&this.attributeName==t&&this.delegate.elementAttributeValueChanged(e,t)}}class StringMapObserver{constructor(e,t){this.element=e,this.delegate=t,this.started=!1,this.stringMap=new Map,this.mutationObserver=new MutationObserver((e=>this.processMutations(e)))}start(){this.started||(this.started=!0,this.mutationObserver.observe(this.element,{attributes:!0,attributeOldValue:!0}),this.refresh())}stop(){this.started&&(this.mutationObserver.takeRecords(),this.mutationObserver.disconnect(),this.started=!1)}refresh(){if(this.started)for(const e of this.knownAttributeNames)this.refreshAttribute(e,null)}processMutations(e){if(this.started)for(const t of e)this.processMutation(t)}processMutation(e){const t=e.attributeName;t&&this.refreshAttribute(t,e.oldValue)}refreshAttribute(e,t){const r=this.delegate.getStringMapKeyForAttribute(e);if(null!=r){this.stringMap.has(e)||this.stringMapKeyAdded(r,e);const s=this.element.getAttribute(e);if(this.stringMap.get(e)!=s&&this.stringMapValueChanged(s,r,t),null==s){const t=this.stringMap.get(e);this.stringMap.delete(e),t&&this.stringMapKeyRemoved(r,e,t)}else this.stringMap.set(e,s)}}stringMapKeyAdded(e,t){this.delegate.stringMapKeyAdded&&this.delegate.stringMapKeyAdded(e,t)}stringMapValueChanged(e,t,r){this.delegate.stringMapValueChanged&&this.delegate.stringMapValueChanged(e,t,r)}stringMapKeyRemoved(e,t,r){this.delegate.stringMapKeyRemoved&&this.delegate.stringMapKeyRemoved(e,t,r)}get knownAttributeNames(){return Array.from(new Set(this.currentAttributeNames.concat(this.recordedAttributeNames)))}get currentAttributeNames(){return Array.from(this.element.attributes).map((e=>e.name))}get recordedAttributeNames(){return Array.from(this.stringMap.keys())}}function add(e,t,r){fetch(e,t).add(r)}function del(e,t,r){fetch(e,t).delete(r),prune(e,t)}function fetch(e,t){let r=e.get(t);return r||(r=new Set,e.set(t,r)),r}function prune(e,t){const r=e.get(t);null!=r&&0==r.size&&e.delete(t)}class Multimap{constructor(){this.valuesByKey=new Map}get keys(){return Array.from(this.valuesByKey.keys())}get values(){return Array.from(this.valuesByKey.values()).reduce(((e,t)=>e.concat(Array.from(t))),[])}get size(){return Array.from(this.valuesByKey.values()).reduce(((e,t)=>e+t.size),0)}add(e,t){add(this.valuesByKey,e,t)}delete(e,t){del(this.valuesByKey,e,t)}has(e,t){const r=this.valuesByKey.get(e);return null!=r&&r.has(t)}hasKey(e){return this.valuesByKey.has(e)}hasValue(e){return Array.from(this.valuesByKey.values()).some((t=>t.has(e)))}getValuesForKey(e){const t=this.valuesByKey.get(e);return t?Array.from(t):[]}getKeysForValue(e){return Array.from(this.valuesByKey).filter((([t,r])=>r.has(e))).map((([e,t])=>e))}}class IndexedMultimap extends Multimap{constructor(){super(),this.keysByValue=new Map}get values(){return Array.from(this.keysByValue.keys())}add(e,t){super.add(e,t),add(this.keysByValue,t,e)}delete(e,t){super.delete(e,t),del(this.keysByValue,t,e)}hasValue(e){return this.keysByValue.has(e)}getKeysForValue(e){const t=this.keysByValue.get(e);return t?Array.from(t):[]}}class TokenListObserver{constructor(e,t,r){this.attributeObserver=new AttributeObserver(e,t,this),this.delegate=r,this.tokensByElement=new Multimap}get started(){return this.attributeObserver.started}start(){this.attributeObserver.start()}pause(e){this.attributeObserver.pause(e)}stop(){this.attributeObserver.stop()}refresh(){this.attributeObserver.refresh()}get element(){return this.attributeObserver.element}get attributeName(){return this.attributeObserver.attributeName}elementMatchedAttribute(e){this.tokensMatched(this.readTokensForElement(e))}elementAttributeValueChanged(e){const[t,r]=this.refreshTokensForElement(e);this.tokensUnmatched(t),this.tokensMatched(r)}elementUnmatchedAttribute(e){this.tokensUnmatched(this.tokensByElement.getValuesForKey(e))}tokensMatched(e){e.forEach((e=>this.tokenMatched(e)))}tokensUnmatched(e){e.forEach((e=>this.tokenUnmatched(e)))}tokenMatched(e){this.delegate.tokenMatched(e),this.tokensByElement.add(e.element,e)}tokenUnmatched(e){this.delegate.tokenUnmatched(e),this.tokensByElement.delete(e.element,e)}refreshTokensForElement(e){const t=this.tokensByElement.getValuesForKey(e),r=this.readTokensForElement(e),s=zip(t,r).findIndex((([e,t])=>!tokensAreEqual(e,t)));return-1==s?[[],[]]:[t.slice(s),r.slice(s)]}readTokensForElement(e){const t=this.attributeName;return parseTokenString(e.getAttribute(t)||"",e,t)}}function parseTokenString(e,t,r){return e.trim().split(/\s+/).filter((e=>e.length)).map(((e,s)=>({element:t,attributeName:r,content:e,index:s})))}function zip(e,t){const r=Math.max(e.length,t.length);return Array.from({length:r},((r,s)=>[e[s],t[s]]))}function tokensAreEqual(e,t){return e&&t&&e.index==t.index&&e.content==t.content}class ValueListObserver{constructor(e,t,r){this.tokenListObserver=new TokenListObserver(e,t,this),this.delegate=r,this.parseResultsByToken=new WeakMap,this.valuesByTokenByElement=new WeakMap}get started(){return this.tokenListObserver.started}start(){this.tokenListObserver.start()}stop(){this.tokenListObserver.stop()}refresh(){this.tokenListObserver.refresh()}get element(){return this.tokenListObserver.element}get attributeName(){return this.tokenListObserver.attributeName}tokenMatched(e){const{element:t}=e,{value:r}=this.fetchParseResultForToken(e);r&&(this.fetchValuesByTokenForElement(t).set(e,r),this.delegate.elementMatchedValue(t,r))}tokenUnmatched(e){const{element:t}=e,{value:r}=this.fetchParseResultForToken(e);r&&(this.fetchValuesByTokenForElement(t).delete(e),this.delegate.elementUnmatchedValue(t,r))}fetchParseResultForToken(e){let t=this.parseResultsByToken.get(e);return t||(t=this.parseToken(e),this.parseResultsByToken.set(e,t)),t}fetchValuesByTokenForElement(e){let t=this.valuesByTokenByElement.get(e);return t||(t=new Map,this.valuesByTokenByElement.set(e,t)),t}parseToken(e){try{return{value:this.delegate.parseValueForToken(e)}}catch(e){return{error:e}}}}class BindingObserver{constructor(e,t){this.context=e,this.delegate=t,this.bindingsByAction=new Map}start(){this.valueListObserver||(this.valueListObserver=new ValueListObserver(this.element,this.actionAttribute,this),this.valueListObserver.start())}stop(){this.valueListObserver&&(this.valueListObserver.stop(),delete this.valueListObserver,this.disconnectAllActions())}get element(){return this.context.element}get identifier(){return this.context.identifier}get actionAttribute(){return this.schema.actionAttribute}get schema(){return this.context.schema}get bindings(){return Array.from(this.bindingsByAction.values())}connectAction(e){const t=new Binding(this.context,e);this.bindingsByAction.set(e,t),this.delegate.bindingConnected(t)}disconnectAction(e){const t=this.bindingsByAction.get(e);t&&(this.bindingsByAction.delete(e),this.delegate.bindingDisconnected(t))}disconnectAllActions(){this.bindings.forEach((e=>this.delegate.bindingDisconnected(e))),this.bindingsByAction.clear()}parseValueForToken(e){const t=Action.forToken(e);if(t.identifier==this.identifier)return t}elementMatchedValue(e,t){this.connectAction(t)}elementUnmatchedValue(e,t){this.disconnectAction(t)}}class ValueObserver{constructor(e,t){this.context=e,this.receiver=t,this.stringMapObserver=new StringMapObserver(this.element,this),this.valueDescriptorMap=this.controller.valueDescriptorMap}start(){this.stringMapObserver.start(),this.invokeChangedCallbacksForDefaultValues()}stop(){this.stringMapObserver.stop()}get element(){return this.context.element}get controller(){return this.context.controller}getStringMapKeyForAttribute(e){if(e in this.valueDescriptorMap)return this.valueDescriptorMap[e].name}stringMapKeyAdded(e,t){const r=this.valueDescriptorMap[t];this.hasValue(e)||this.invokeChangedCallback(e,r.writer(this.receiver[e]),r.writer(r.defaultValue))}stringMapValueChanged(e,t,r){const s=this.valueDescriptorNameMap[t];null!==e&&(null===r&&(r=s.writer(s.defaultValue)),this.invokeChangedCallback(t,e,r))}stringMapKeyRemoved(e,t,r){const s=this.valueDescriptorNameMap[e];this.hasValue(e)?this.invokeChangedCallback(e,s.writer(this.receiver[e]),r):this.invokeChangedCallback(e,s.writer(s.defaultValue),r)}invokeChangedCallbacksForDefaultValues(){for(const{key:e,name:t,defaultValue:r,writer:s}of this.valueDescriptors)null==r||this.controller.data.has(e)||this.invokeChangedCallback(t,s(r),void 0)}invokeChangedCallback(e,t,r){const s=`${e}Changed`,n=this.receiver[s];if("function"==typeof n){const s=this.valueDescriptorNameMap[e];try{const e=s.reader(t);let i=r;r&&(i=s.reader(r)),n.call(this.receiver,e,i)}catch(e){if(!(e instanceof TypeError))throw e;throw new TypeError(`Stimulus Value "${this.context.identifier}.${s.name}" - ${e.message}`)}}}get valueDescriptors(){const{valueDescriptorMap:e}=this;return Object.keys(e).map((t=>e[t]))}get valueDescriptorNameMap(){const e={};return Object.keys(this.valueDescriptorMap).forEach((t=>{const r=this.valueDescriptorMap[t];e[r.name]=r})),e}hasValue(e){const t=`has${capitalize(this.valueDescriptorNameMap[e].name)}`;return this.receiver[t]}}class TargetObserver{constructor(e,t){this.context=e,this.delegate=t,this.targetsByName=new Multimap}start(){this.tokenListObserver||(this.tokenListObserver=new TokenListObserver(this.element,this.attributeName,this),this.tokenListObserver.start())}stop(){this.tokenListObserver&&(this.disconnectAllTargets(),this.tokenListObserver.stop(),delete this.tokenListObserver)}tokenMatched({element:e,content:t}){this.scope.containsElement(e)&&this.connectTarget(e,t)}tokenUnmatched({element:e,content:t}){this.disconnectTarget(e,t)}connectTarget(e,t){var r;this.targetsByName.has(t,e)||(this.targetsByName.add(t,e),null===(r=this.tokenListObserver)||void 0===r||r.pause((()=>this.delegate.targetConnected(e,t))))}disconnectTarget(e,t){var r;this.targetsByName.has(t,e)&&(this.targetsByName.delete(t,e),null===(r=this.tokenListObserver)||void 0===r||r.pause((()=>this.delegate.targetDisconnected(e,t))))}disconnectAllTargets(){for(const e of this.targetsByName.keys)for(const t of this.targetsByName.getValuesForKey(e))this.disconnectTarget(t,e)}get attributeName(){return`data-${this.context.identifier}-target`}get element(){return this.context.element}get scope(){return this.context.scope}}class Context{constructor(e,t){this.logDebugActivity=(e,t={})=>{const{identifier:r,controller:s,element:n}=this;t=Object.assign({identifier:r,controller:s,element:n},t),this.application.logDebugActivity(this.identifier,e,t)},this.module=e,this.scope=t,this.controller=new e.controllerConstructor(this),this.bindingObserver=new BindingObserver(this,this.dispatcher),this.valueObserver=new ValueObserver(this,this.controller),this.targetObserver=new TargetObserver(this,this);try{this.controller.initialize(),this.logDebugActivity("initialize")}catch(e){this.handleError(e,"initializing controller")}}connect(){this.bindingObserver.start(),this.valueObserver.start(),this.targetObserver.start();try{this.controller.connect(),this.logDebugActivity("connect")}catch(e){this.handleError(e,"connecting controller")}}disconnect(){try{this.controller.disconnect(),this.logDebugActivity("disconnect")}catch(e){this.handleError(e,"disconnecting controller")}this.targetObserver.stop(),this.valueObserver.stop(),this.bindingObserver.stop()}get application(){return this.module.application}get identifier(){return this.module.identifier}get schema(){return this.application.schema}get dispatcher(){return this.application.dispatcher}get element(){return this.scope.element}get parentElement(){return this.element.parentElement}handleError(e,t,r={}){const{identifier:s,controller:n,element:i}=this;r=Object.assign({identifier:s,controller:n,element:i},r),this.application.handleError(e,`Error ${t}`,r)}targetConnected(e,t){this.invokeControllerMethod(`${t}TargetConnected`,e)}targetDisconnected(e,t){this.invokeControllerMethod(`${t}TargetDisconnected`,e)}invokeControllerMethod(e,...t){const r=this.controller;"function"==typeof r[e]&&r[e](...t)}}function readInheritableStaticArrayValues(e,t){const r=getAncestorsForConstructor(e);return Array.from(r.reduce(((e,r)=>(getOwnStaticArrayValues(r,t).forEach((t=>e.add(t))),e)),new Set))}function readInheritableStaticObjectPairs(e,t){return getAncestorsForConstructor(e).reduce(((e,r)=>(e.push(...getOwnStaticObjectPairs(r,t)),e)),[])}function getAncestorsForConstructor(e){const t=[];for(;e;)t.push(e),e=Object.getPrototypeOf(e);return t.reverse()}function getOwnStaticArrayValues(e,t){const r=e[t];return Array.isArray(r)?r:[]}function getOwnStaticObjectPairs(e,t){const r=e[t];return r?Object.keys(r).map((e=>[e,r[e]])):[]}function bless(e){return shadow(e,getBlessedProperties(e))}function shadow(e,t){const r=extend(e),s=getShadowProperties(e.prototype,t);return Object.defineProperties(r.prototype,s),r}function getBlessedProperties(e){return readInheritableStaticArrayValues(e,"blessings").reduce(((t,r)=>{const s=r(e);for(const e in s){const r=t[e]||{};t[e]=Object.assign(r,s[e])}return t}),{})}function getShadowProperties(e,t){return getOwnKeys(t).reduce(((r,s)=>{const n=getShadowedDescriptor(e,t,s);return n&&Object.assign(r,{[s]:n}),r}),{})}function getShadowedDescriptor(e,t,r){const s=Object.getOwnPropertyDescriptor(e,r);if(!(s&&"value"in s)){const e=Object.getOwnPropertyDescriptor(t,r).value;return s&&(e.get=s.get||e.get,e.set=s.set||e.set),e}}const getOwnKeys="function"==typeof Object.getOwnPropertySymbols?e=>[...Object.getOwnPropertyNames(e),...Object.getOwnPropertySymbols(e)]:Object.getOwnPropertyNames,extend=(()=>{function e(e){function t(){return Reflect.construct(e,arguments,new.target)}return t.prototype=Object.create(e.prototype,{constructor:{value:t}}),Reflect.setPrototypeOf(t,e),t}try{return function(){const t=e((function(){this.a.call(this)}));t.prototype.a=function(){},new t}(),e}catch(e){return e=>class extends e{}}})();function blessDefinition(e){return{identifier:e.identifier,controllerConstructor:bless(e.controllerConstructor)}}class Module{constructor(e,t){this.application=e,this.definition=blessDefinition(t),this.contextsByScope=new WeakMap,this.connectedContexts=new Set}get identifier(){return this.definition.identifier}get controllerConstructor(){return this.definition.controllerConstructor}get contexts(){return Array.from(this.connectedContexts)}connectContextForScope(e){const t=this.fetchContextForScope(e);this.connectedContexts.add(t),t.connect()}disconnectContextForScope(e){const t=this.contextsByScope.get(e);t&&(this.connectedContexts.delete(t),t.disconnect())}fetchContextForScope(e){let t=this.contextsByScope.get(e);return t||(t=new Context(this,e),this.contextsByScope.set(e,t)),t}}class ClassMap{constructor(e){this.scope=e}has(e){return this.data.has(this.getDataKey(e))}get(e){return this.getAll(e)[0]}getAll(e){return tokenize(this.data.get(this.getDataKey(e))||"")}getAttributeName(e){return this.data.getAttributeNameForKey(this.getDataKey(e))}getDataKey(e){return`${e}-class`}get data(){return this.scope.data}}class DataMap{constructor(e){this.scope=e}get element(){return this.scope.element}get identifier(){return this.scope.identifier}get(e){const t=this.getAttributeNameForKey(e);return this.element.getAttribute(t)}set(e,t){const r=this.getAttributeNameForKey(e);return this.element.setAttribute(r,t),this.get(e)}has(e){const t=this.getAttributeNameForKey(e);return this.element.hasAttribute(t)}delete(e){if(this.has(e)){const t=this.getAttributeNameForKey(e);return this.element.removeAttribute(t),!0}return!1}getAttributeNameForKey(e){return`data-${this.identifier}-${dasherize(e)}`}}class Guide{constructor(e){this.warnedKeysByObject=new WeakMap,this.logger=e}warn(e,t,r){let s=this.warnedKeysByObject.get(e);s||(s=new Set,this.warnedKeysByObject.set(e,s)),s.has(t)||(s.add(t),this.logger.warn(r,e))}}function attributeValueContainsToken(e,t){return`[${e}~="${t}"]`}class TargetSet{constructor(e){this.scope=e}get element(){return this.scope.element}get identifier(){return this.scope.identifier}get schema(){return this.scope.schema}has(e){return null!=this.find(e)}find(...e){return e.reduce(((e,t)=>e||this.findTarget(t)||this.findLegacyTarget(t)),void 0)}findAll(...e){return e.reduce(((e,t)=>[...e,...this.findAllTargets(t),...this.findAllLegacyTargets(t)]),[])}findTarget(e){const t=this.getSelectorForTargetName(e);return this.scope.findElement(t)}findAllTargets(e){const t=this.getSelectorForTargetName(e);return this.scope.findAllElements(t)}getSelectorForTargetName(e){return attributeValueContainsToken(this.schema.targetAttributeForScope(this.identifier),e)}findLegacyTarget(e){const t=this.getLegacySelectorForTargetName(e);return this.deprecate(this.scope.findElement(t),e)}findAllLegacyTargets(e){const t=this.getLegacySelectorForTargetName(e);return this.scope.findAllElements(t).map((t=>this.deprecate(t,e)))}getLegacySelectorForTargetName(e){const t=`${this.identifier}.${e}`;return attributeValueContainsToken(this.schema.targetAttribute,t)}deprecate(e,t){if(e){const{identifier:r}=this,s=this.schema.targetAttribute,n=this.schema.targetAttributeForScope(r);this.guide.warn(e,`target:${t}`,`Please replace ${s}="${r}.${t}" with ${n}="${t}". The ${s} attribute is deprecated and will be removed in a future version of Stimulus.`)}return e}get guide(){return this.scope.guide}}class Scope{constructor(e,t,r,s){this.targets=new TargetSet(this),this.classes=new ClassMap(this),this.data=new DataMap(this),this.containsElement=e=>e.closest(this.controllerSelector)===this.element,this.schema=e,this.element=t,this.identifier=r,this.guide=new Guide(s)}findElement(e){return this.element.matches(e)?this.element:this.queryElements(e).find(this.containsElement)}findAllElements(e){return[...this.element.matches(e)?[this.element]:[],...this.queryElements(e).filter(this.containsElement)]}queryElements(e){return Array.from(this.element.querySelectorAll(e))}get controllerSelector(){return attributeValueContainsToken(this.schema.controllerAttribute,this.identifier)}}class ScopeObserver{constructor(e,t,r){this.element=e,this.schema=t,this.delegate=r,this.valueListObserver=new ValueListObserver(this.element,this.controllerAttribute,this),this.scopesByIdentifierByElement=new WeakMap,this.scopeReferenceCounts=new WeakMap}start(){this.valueListObserver.start()}stop(){this.valueListObserver.stop()}get controllerAttribute(){return this.schema.controllerAttribute}parseValueForToken(e){const{element:t,content:r}=e,s=this.fetchScopesByIdentifierForElement(t);let n=s.get(r);return n||(n=this.delegate.createScopeForElementAndIdentifier(t,r),s.set(r,n)),n}elementMatchedValue(e,t){const r=(this.scopeReferenceCounts.get(t)||0)+1;this.scopeReferenceCounts.set(t,r),1==r&&this.delegate.scopeConnected(t)}elementUnmatchedValue(e,t){const r=this.scopeReferenceCounts.get(t);r&&(this.scopeReferenceCounts.set(t,r-1),1==r&&this.delegate.scopeDisconnected(t))}fetchScopesByIdentifierForElement(e){let t=this.scopesByIdentifierByElement.get(e);return t||(t=new Map,this.scopesByIdentifierByElement.set(e,t)),t}}class Router{constructor(e){this.application=e,this.scopeObserver=new ScopeObserver(this.element,this.schema,this),this.scopesByIdentifier=new Multimap,this.modulesByIdentifier=new Map}get element(){return this.application.element}get schema(){return this.application.schema}get logger(){return this.application.logger}get controllerAttribute(){return this.schema.controllerAttribute}get modules(){return Array.from(this.modulesByIdentifier.values())}get contexts(){return this.modules.reduce(((e,t)=>e.concat(t.contexts)),[])}start(){this.scopeObserver.start()}stop(){this.scopeObserver.stop()}loadDefinition(e){this.unloadIdentifier(e.identifier);const t=new Module(this.application,e);this.connectModule(t)}unloadIdentifier(e){const t=this.modulesByIdentifier.get(e);t&&this.disconnectModule(t)}getContextForElementAndIdentifier(e,t){const r=this.modulesByIdentifier.get(t);if(r)return r.contexts.find((t=>t.element==e))}handleError(e,t,r){this.application.handleError(e,t,r)}createScopeForElementAndIdentifier(e,t){return new Scope(this.schema,e,t,this.logger)}scopeConnected(e){this.scopesByIdentifier.add(e.identifier,e);const t=this.modulesByIdentifier.get(e.identifier);t&&t.connectContextForScope(e)}scopeDisconnected(e){this.scopesByIdentifier.delete(e.identifier,e);const t=this.modulesByIdentifier.get(e.identifier);t&&t.disconnectContextForScope(e)}connectModule(e){this.modulesByIdentifier.set(e.identifier,e);this.scopesByIdentifier.getValuesForKey(e.identifier).forEach((t=>e.connectContextForScope(t)))}disconnectModule(e){this.modulesByIdentifier.delete(e.identifier);this.scopesByIdentifier.getValuesForKey(e.identifier).forEach((t=>e.disconnectContextForScope(t)))}}const defaultSchema={controllerAttribute:"data-controller",actionAttribute:"data-action",targetAttribute:"data-target",targetAttributeForScope:e=>`data-${e}-target`};class Application{constructor(e=document.documentElement,t=defaultSchema){this.logger=console,this.debug=!1,this.logDebugActivity=(e,t,r={})=>{this.debug&&this.logFormattedMessage(e,t,r)},this.element=e,this.schema=t,this.dispatcher=new Dispatcher(this),this.router=new Router(this)}static start(e,t){const r=new Application(e,t);return r.start(),r}async start(){await domReady(),this.logDebugActivity("application","starting"),this.dispatcher.start(),this.router.start(),this.logDebugActivity("application","start")}stop(){this.logDebugActivity("application","stopping"),this.dispatcher.stop(),this.router.stop(),this.logDebugActivity("application","stop")}register(e,t){this.load({identifier:e,controllerConstructor:t})}load(e,...t){(Array.isArray(e)?e:[e,...t]).forEach((e=>{e.controllerConstructor.shouldLoad&&this.router.loadDefinition(e)}))}unload(e,...t){(Array.isArray(e)?e:[e,...t]).forEach((e=>this.router.unloadIdentifier(e)))}get controllers(){return this.router.contexts.map((e=>e.controller))}getControllerForElementAndIdentifier(e,t){const r=this.router.getContextForElementAndIdentifier(e,t);return r?r.controller:null}handleError(e,t,r){var s;this.logger.error("%s\n\n%o\n\n%o",t,e,r),null===(s=window.onerror)||void 0===s||s.call(window,t,"",0,0,e)}logFormattedMessage(e,t,r={}){r=Object.assign({application:this},r),this.logger.groupCollapsed(`${e} #${t}`),this.logger.log("details:",Object.assign({},r)),this.logger.groupEnd()}}function domReady(){return new Promise((e=>{"loading"==document.readyState?document.addEventListener("DOMContentLoaded",(()=>e())):e()}))}function ClassPropertiesBlessing(e){return readInheritableStaticArrayValues(e,"classes").reduce(((e,t)=>Object.assign(e,propertiesForClassDefinition(t))),{})}function propertiesForClassDefinition(e){return{[`${e}Class`]:{get(){const{classes:t}=this;if(t.has(e))return t.get(e);{const r=t.getAttributeName(e);throw new Error(`Missing attribute "${r}"`)}}},[`${e}Classes`]:{get(){return this.classes.getAll(e)}},[`has${capitalize(e)}Class`]:{get(){return this.classes.has(e)}}}}function TargetPropertiesBlessing(e){return readInheritableStaticArrayValues(e,"targets").reduce(((e,t)=>Object.assign(e,propertiesForTargetDefinition(t))),{})}function propertiesForTargetDefinition(e){return{[`${e}Target`]:{get(){const t=this.targets.find(e);if(t)return t;throw new Error(`Missing target element "${e}" for "${this.identifier}" controller`)}},[`${e}Targets`]:{get(){return this.targets.findAll(e)}},[`has${capitalize(e)}Target`]:{get(){return this.targets.has(e)}}}}function ValuePropertiesBlessing(e){const t=readInheritableStaticObjectPairs(e,"values"),r={valueDescriptorMap:{get(){return t.reduce(((e,t)=>{const r=parseValueDefinitionPair(t,this.identifier),s=this.data.getAttributeNameForKey(r.key);return Object.assign(e,{[s]:r})}),{})}}};return t.reduce(((e,t)=>Object.assign(e,propertiesForValueDefinitionPair(t))),r)}function propertiesForValueDefinitionPair(e,t){const r=parseValueDefinitionPair(e,t),{key:s,name:n,reader:i,writer:o}=r;return{[n]:{get(){const e=this.data.get(s);return null!==e?i(e):r.defaultValue},set(e){void 0===e?this.data.delete(s):this.data.set(s,o(e))}},[`has${capitalize(n)}`]:{get(){return this.data.has(s)||r.hasCustomDefaultValue}}}}function parseValueDefinitionPair([e,t],r){return valueDescriptorForTokenAndTypeDefinition({controller:r,token:e,typeDefinition:t})}function parseValueTypeConstant(e){switch(e){case Array:return"array";case Boolean:return"boolean";case Number:return"number";case Object:return"object";case String:return"string"}}function parseValueTypeDefault(e){switch(typeof e){case"boolean":return"boolean";case"number":return"number";case"string":return"string"}return Array.isArray(e)?"array":"[object Object]"===Object.prototype.toString.call(e)?"object":void 0}function parseValueTypeObject(e){const t=parseValueTypeConstant(e.typeObject.type);if(!t)return;const r=parseValueTypeDefault(e.typeObject.default);if(t!==r){const s=e.controller?`${e.controller}.${e.token}`:e.token;throw new Error(`The specified default value for the Stimulus Value "${s}" must match the defined type "${t}". The provided default value of "${e.typeObject.default}" is of type "${r}".`)}return t}function parseValueTypeDefinition(e){const t=parseValueTypeObject({controller:e.controller,token:e.token,typeObject:e.typeDefinition}),r=parseValueTypeDefault(e.typeDefinition),s=parseValueTypeConstant(e.typeDefinition),n=t||r||s;if(n)return n;const i=e.controller?`${e.controller}.${e.typeDefinition}`:e.token;throw new Error(`Unknown value type "${i}" for "${e.token}" value`)}function defaultValueForDefinition(e){const t=parseValueTypeConstant(e);if(t)return defaultValuesByType[t];const r=e.default;return void 0!==r?r:e}function valueDescriptorForTokenAndTypeDefinition(e){const t=`${dasherize(e.token)}-value`,r=parseValueTypeDefinition(e);return{type:r,key:t,name:camelize(t),get defaultValue(){return defaultValueForDefinition(e.typeDefinition)},get hasCustomDefaultValue(){return void 0!==parseValueTypeDefault(e.typeDefinition)},reader:readers[r],writer:writers[r]||writers.default}}const defaultValuesByType={get array(){return[]},boolean:!1,number:0,get object(){return{}},string:""},readers={array(e){const t=JSON.parse(e);if(!Array.isArray(t))throw new TypeError(`expected value of type "array" but instead got value "${e}" of type "${parseValueTypeDefault(t)}"`);return t},boolean:e=>!("0"==e||"false"==String(e).toLowerCase()),number:e=>Number(e),object(e){const t=JSON.parse(e);if(null===t||"object"!=typeof t||Array.isArray(t))throw new TypeError(`expected value of type "object" but instead got value "${e}" of type "${parseValueTypeDefault(t)}"`);return t},string:e=>e},writers={default:writeString,array:writeJSON,object:writeJSON};function writeJSON(e){return JSON.stringify(e)}function writeString(e){return`${e}`}class Controller{constructor(e){this.context=e}static get shouldLoad(){return!0}get application(){return this.context.application}get scope(){return this.context.scope}get element(){return this.scope.element}get identifier(){return this.scope.identifier}get targets(){return this.scope.targets}get classes(){return this.scope.classes}get data(){return this.scope.data}initialize(){}connect(){}disconnect(){}dispatch(e,{target:t=this.element,detail:r={},prefix:s=this.identifier,bubbles:n=!0,cancelable:i=!0}={}){const o=new CustomEvent(s?`${s}:${e}`:e,{detail:r,bubbles:n,cancelable:i});return t.dispatchEvent(o),o}}Controller.blessings=[ClassPropertiesBlessing,TargetPropertiesBlessing,ValuePropertiesBlessing],Controller.targets=[],Controller.values={};export{Application,AttributeObserver,Context,Controller,ElementObserver,IndexedMultimap,Multimap,StringMapObserver,TokenListObserver,ValueListObserver,add,defaultSchema,del,fetch,prune};
