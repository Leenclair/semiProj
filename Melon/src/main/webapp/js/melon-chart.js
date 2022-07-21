// 멜론 차트

let chart1_btn = document.querySelector('.chart1_btn');
let chart2_btn = document.querySelector('.chart2_btn');
let chart3_btn = document.querySelector('.chart3_btn');

let chart1_box = document.querySelector('.chart1_box');
let chart2_box = document.querySelector('.chart2_box');
let chart3_box = document.querySelector('.chart3_box');

let rank_list_li = document.querySelectorAll('.rank_list li');

function chart_btn_click(e) {
    chart1_btn.style.color = '#666';
    chart2_btn.style.color = '#666';
    chart3_btn.style.color = '#666';

    chart1_btn.style.borderTop = '1px solid #dfe6e8';
    chart2_btn.style.borderTop = '1px solid #dfe6e8';
    chart3_btn.style.borderTop = '1px solid #dfe6e8';

    chart1_box.style.display = 'none';
    chart2_box.style.display = 'none';
    chart3_box.style.display = 'none';

    e.target.style.color = 'green';
    e.target.style.borderTop = '2px solid #8ac121';
    e.target.nextElementSibling.style.display = 'inline';
}

chart1_btn.onclick = chart_btn_click;
chart2_btn.onclick = chart_btn_click;
chart3_btn.onclick = chart_btn_click;

function chart_over(e) {
    let rank_list_li = e.target.parentElement.querySelectorAll('li');
    let rank_all = e.target.parentElement.querySelectorAll('.rank');
    let rank = e.target.querySelector('.rank');
    let chart_img_all = e.target.parentElement.querySelectorAll('.chart_img');
    let chart_img = e.target.querySelector('.chart_img');
    let artist_all = e.target.parentElement.querySelectorAll('.artist');
    let artist = e.target.querySelector('.artist');

    
    for(let i = 0; i < rank_list_li.length; i++) {
        rank_list_li[i].style.height = '33px';
        rank_all[i].style.fontSize = '18px';
        rank_all[i].style.marginTop = '3px';
        chart_img_all[i].style.display = 'none';
    }

    e.target.style.height = '69px'
    rank.style.fontSize = '30px';
    rank.style.marginTop = '13px';
    chart_img.style.display = 'block';

    if(e.target.parentElement.parentElement.className != 'chart3_box') {
        let song_all = e.target.parentElement.querySelectorAll('.song');
        let song = e.target.querySelector('.song');

        for(let i = 0; i < song_all.length; i++) {
            song_all[i].style.marginTop = '8px';
            song_all[i].style.fontWeight = '400';
            artist_all[i].style.width = '60px';
            artist_all[i].style.marginTop = '8px';
        }

        song.style.marginTop = '16px';
        song.style.fontWeight = '900';
        artist.style.width = '130px';
        artist.style.marginTop = '3px';
    }

    if(e.target.parentElement.parentElement.className == 'chart3_box') {
        let fan_btn_all = e.target.parentElement.querySelectorAll('.fan_btn');
        let fan_btn = e.target.querySelector('.fan_btn');

        for(let i = 0; i < artist_all.length; i++) {
            artist_all[i].style.width = '170px';
            artist_all[i].style.marginTop = '8px';
            artist_all[i].style.fontWeight = '400';
            fan_btn_all[i].style.marginTop = '6px';
        }

        artist.style.width = '100px';
        artist.style.marginTop = '24px';
        artist.style.fontWeight = '900';
        fan_btn.style.marginTop = '24px';
    }
}

for(let i = 0; i < rank_list_li.length; i++) {
    rank_list_li[i].onmouseenter = chart_over;
} 
