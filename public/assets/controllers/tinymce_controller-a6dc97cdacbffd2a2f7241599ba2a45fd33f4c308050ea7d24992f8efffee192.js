import{Controller}from"@hotwired/stimulus";export default class extends Controller{static targets=["textarea","css","output"];connect(){import("tinymce").then((t=>{tinymce.init({selector:".tinymce-textarea",plugins:"advlist autolink lists link image charmap preview anchor pagebreak code table",menubar:!0,toolbar:"styles | h1 h2 h3 | undo redo | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist | code table"})}))}disconnect(){tinymce.remove()}}
