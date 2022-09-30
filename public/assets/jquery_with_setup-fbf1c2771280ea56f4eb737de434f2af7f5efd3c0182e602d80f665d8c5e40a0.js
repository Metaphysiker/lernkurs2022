import $ from"jquery";window.$=$,$((function(){$.ajaxSetup({beforeSend:function(e){e.setRequestHeader("X-CSRF-Token",$('meta[name="csrf-token"]').attr("content"))}})}));
