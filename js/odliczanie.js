d=new Date().getTime()-(czas*1000)
k=new Date(2013,6,5).getTime();//odliczanie miesięcy od zera

function odl(){
sec=(k-new Date().getTime()+d)/1000;
dni=~~(sec/(3600*24))
godzin=~~(sec/3600)%24
minut=~~(sec/60)%60
sekund=~~sec%60
document.getElementById('odliczanie').innerHTML=dni+' dni '+godzin+' godzin '+minut+' minut '+sekund+' sekund';
}
odl();setInterval('odl()',1000)