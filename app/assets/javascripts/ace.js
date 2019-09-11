$(document).ready(function() {
    if ($("#js").length){
        var editor = ace.edit('js');
        editor.setTheme('ace/theme/textmate');
        editor.session.setMode('ace/mode/ruby');
        editor.setOptions({
            readOnly: true,
            highlightActiveLine: false,
            highlightGutterLine: false
        });
    }
});


