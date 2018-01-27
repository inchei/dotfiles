(function($, mw) {
    var str = window.location.href;
    if (str.indexOf("Mainpage") < 0)
        $("body").prepend('<a href="https://zh.moegirl.org"><img class="topButton1" src="https://i.loli.net/2017/08/07/59886347bd66f.png"></a>');
    $("body").prepend('<a href="/Special:MyPage"><img class="topButton2" src="https://i.loli.net/2017/08/07/598863f4c1bf8.png"></a>');

    if (str.indexOf("?title=") > -1)
        str = str.substring(str.indexOf("?title=") + 7);
    else
        str = str.substring(str.indexOf(".org/") + 5);
    $("#footer-info-lastmod").wrap('<a href="/index.php?title=' + str + '&action=history"></a>');
    $("#firstHeading").append('<span class="mw-editsection" style="display: none;">[<a href="/index.php?title=' + str + '&action=edit">编辑</a>]</span>');

    var topTitle = document.getElementById("firstHeading");
    topTitle = topTitle.innerText;
    $("div#p-personal").prepend('<span class="topTitle" title="' + topTitle + '">' + topTitle + '</span>');
    $(".topTitle").before('<a href="https://zh.moegirl.org" style="position: absolute; left: 15%;"><img width="30px" src="https://img.moegirl.org/enmoegirl/6/6f/Logo.svg" alt=""/></a>');

    $("#mw-content-text img").each(function() {
        if (this.src == "https://static.mengniang.org/common/thumb/d/d1/%E5%A4%A7%E8%90%8C%E5%AD%97.png/50px-%E5%A4%A7%E8%90%8C%E5%AD%97.png") {
            this.src = "https://i.loli.net/2017/08/02/5981bf14372d1.png";
            this.srcset = "";
        }
    });

    if (document.body.scrollHeight >= $(window).height() + 300) {
        $("#p-personal").hide();
        window.onscroll = function() {
            var len = window.scrollY;
            if (len < 300)
                $("#p-personal").slideUp(300);
            else
                $("#p-personal").slideDown(300);
        };
    } else {
        $("#p-personal").show();
        $("#p-personal").css("box-shadow", "none");
        $("#p-personal").css("border", "none");
    }
})(jQuery, mediaWiki);