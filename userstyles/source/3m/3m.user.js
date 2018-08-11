// ==UserScript==
// @name         Maybe a Material Mediawiki
// @namespace    https://github.com/inchei/Omochabako
// @description  With 3m.css
// @author       inchei
// @include      *://*.moegirl.org/*
// @include      *://*.wikipedia.org/*
// @include      *://*.wikimedia.org/*
// @include      *://*.wikivoyage.org/*
// @include      *://*.wiktionary.org/*
// @include      *://*.wikibooks.org/*
// @include      *://*.wikidata.org/*
// @include      *://*.wikinews.org/*
// @include      *://*.wikiquote.org/*
// @include      *://*.wikisource.org/*
// @include      *://*.wikispecies.org/*
// @include      *://*.wikiversity.org/*
// @include      *://wiki.archlinux.org/*
// @include      *://wiki.komica.org/*
// @include      *://*.mediawiki.org/*
// @require      https://cdn.bootcss.com/jquery/3.3.1/jquery.min.js
// ==/UserScript==
$(function (){
    // 配合 3m.css 顯示
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
    $(".topTitle").before('<a href="/" style="position: absolute; left: 15%;"><img width="30px" src="https://i.loli.net/2018/07/06/5b3f4f51de07f.png" alt=""/></a>');

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

    // 以下僅適用於萌娘基金會旗下維基
    // 僅在有背景圖時主體卡片透明
    if ($('.sidebar-character').length > 0) {
        $('.ns-0 div#content, .ns-0 div#p-cactions li a:hover, .ns-0 div#p-cactions li.selected a, .ns-0 div#content div.thumb, div#content, div#p-cactions li a:hover, div#p-cactions li.selected a, div#content div.thumb').css('background', 'rgba(255, 255, 255, .8)');
        $('#mw-head-base').css('box-shadow', '0 140px 0 300px rgba(93, 130, 138, .5)');
        $('#mw-head-base').css('background', 'rgba(93, 130, 138, .5)');
    }

    // 提升大萌字分辨率，去背景
    $("#mw-content-text img").each(function() {
        if (this.src == "https://img.moegirl.org/common/thumb/d/d1/%E5%A4%A7%E8%90%8C%E5%AD%97.png/50px-%E5%A4%A7%E8%90%8C%E5%AD%97.png") {
            this.src = "https://i.loli.net/2017/08/02/5981bf14372d1.png";
            this.srcset = "";
        }
    });

    // 移動用戶專屬：顯示不出評論者頭像時，取消以下代碼的注釋
    /*function commentAvatar() {
        $(".comment-avatar img").src='data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADIAAAAyCAYAAAAeP4ixAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAM+SURBVGhD7do3qBRBHMfxJyiKWYyFpQHRXltrEYwoiBaKggkLsdTCbCnYiVnMolhqYSjMqFiZEQsVGwN2xu8PbuFYfrs7s+HeFfeDDxz7dv5z+25uZnfe6+ull146mglYij24iNt43HKrdUw/WwKd21UZjU14hL/4F0jn3ofaqka/RZ3vxw+4NxrjO/RJdfyCVuEL3Juq4jNWoPGMwGm4N1En9TEcjWQinsB1nEfDRtzP8miCUJ+1ZjxewnXovMZajEMS1ViHN3BtHPWpdrVEw+kZXEfOcQxGVobgJFxbR7NhLcPsDFwHzhUMQFF0zjW4Gs4pVIpmJ1fY0TQcs8hNwk+4Wk7p2WwMYqbYw4jNUbhajqbmUuuMFjtXMEuZ35jauFpZ9iIquvLYFXsuYqM2rlaWb4j6VHT/4wrlWYjYqI2rlWcDgvMArkienYjNbrhaee4hKJp5Yu5iE1oEByI0g/AWrlaeP2hfaDOj5wlXIMRWhGYbXI0Qi1EYzQyucYhfWICi6MHqN1yNEBqShbkA1ziUPvqDcIujjh1CmaHb7hwKcweucSx9Onq8PdKi1zrmzo2lWoV5Cte4m+hxojBlnjk6LehC6hpaTQoaWlW/7J0Q9GXXboZr3E12oTBVFsT30CbcdqzGfMxp0Wsd24FL+ABXI0TQgqhn5Jh5Xvc+WzAFsVEbtY25t9M6NRZB0Q6gK5JQMT0Cz0RdmYWzUG3XZ+IugrMRroi8wmw0FQ3DvJ2W9QiOHl7cXpR2U0ah6aiP50j3/xXRj7v7kC60Bp2K+kr3H3SzmI6uXA/87YX0qDkVTWca0iPiE0aiVNzmgMbvZDQV1X6HdL/LUCnaHEsX1Rd+OurODLinxhOoHG1XPkS6uIZZ0MIUGC3EboLRUjAUtSRvE/sqqnxv9H3I2j59gdo2sZNoi19b/a5DLWK6NZmHvA3sJDpH515G1gKoUVD7RSTRMCv6Q4+Gx3UcwGasbNFrHbuBos2/YxiGxqPZTNOhexNVfMRydDRaZ3TLX+avUWmaOHRr3om7hszognRvppu5ohu+djpXbbQF2q8X4KIdwEXQb/c8biL5hwG91jH9TOcE34r30ksvVdPX9x8hVswXyJ0JpQAAAABJRU5ErkJggg==';
    }
    setTimeout(commentAvatar,1000);*/
});