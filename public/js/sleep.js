var c=5;
var t;
var colors=["#000000","#333333","#666666","#999999","#CCCCCC","#FFFFFF"];
function timedCount() {
	if (c>=0) {
		$('#data').text(c)
		$("body").css("background-color",colors[c]);
		c=c-1
		t=setTimeout("timedCount()",1200)
	}
    else
        toggleFullScreen();
}
$(document).ready(function() {
	timedCount();
});
