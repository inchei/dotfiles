// ==UserScript==
// @name         Anti moe wiki
// @namespace    http://tampermonkey.net/
// @version      0.1
// @description  none
// @author       inchei
// @include      *://*.moegirl.org/*
// @include      *://*.wikipedia.org/*
// @grant        none
// @require https://cdn.bootcss.com/jquery/3.3.1/jquery.min.js
// ==/UserScript==


$(function (){
    //配合vector.css显示
    var str = window.location.href;

    if (str.indexOf("?title=") > -1)
        str = str.substring(str.indexOf("?title=") + 7);
    else
        str = str.substring(str.indexOf(".org/") + 5);
    $("#footer-info-lastmod").wrap('<a href="/index.php?title='+str+'&action=history"></a>');
    $("#firstHeading").append('<span class="mw-editsection" style="display: none;">[<a href="/index.php?title='+str+'&action=edit">编辑</a>]</span>');

    var topTitle = document.getElementById("firstHeading");
    topTitle = topTitle.innerText;
    $("div#p-personal").prepend('<span class="topTitle" title="' + topTitle + '">' + topTitle + '</span>');
    $(".topTitle").before('<a href="/" style="position: absolute; left: 15%;"><img width="30px" src="https://img.moegirl.org/enmoegirl/6/6f/Logo.svg" alt=""/></a>');

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

    function comment() {$('.comment-body textarea').attr('placeholder', '');}
    setTimeout(comment,1000);


    //仅在有背景图时使主体背景半透明
    if ($('.sidebar-character').length > 0) {
        $('.ns-0 div#content, .ns-0 div#p-cactions li a:hover, .ns-0 div#p-cactions li.selected a, .ns-0 div#content div.thumb, div#content, div#p-cactions li a:hover, div#p-cactions li.selected a, div#content div.thumb').css('background', 'rgba(255, 255, 255, .8)');
        $('#mw-head-base').css('box-shadow', '0 140px 0 300px rgba(93, 130, 138, .5)');
        $('#mw-head-base').css('background', 'rgba(93, 130, 138, .5)');
    }

    //更改大萌字图源
    $("#mw-content-text img").each(function() {
        if (this.src == "https://img.moegirl.org/common/thumb/d/d1/%E5%A4%A7%E8%90%8C%E5%AD%97.png/50px-%E5%A4%A7%E8%90%8C%E5%AD%97.png") {
            this.src = "https://i.loli.net/2017/08/02/5981bf14372d1.png";
            this.srcset = "";
        }
    });

    //暴力解决无法显示图片的问题（已修复）
    /*$(function (){
    $("img").each(function() {
            this.src = this.src.replace('static', 'img');
            this.srcset = this.srcset.replace('static', 'img');
        });
    });*/
});