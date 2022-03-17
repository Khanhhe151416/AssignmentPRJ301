/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
 function generatePaggerOrderFood(div,pageIndex,totalPage,tid,type,gap){
     var container = document.getElementById(div);
     var text = "";
     if(pageIndex - gap > 1){
         text += "<a href='food?page=1&tid="+tid+"&typeId="+type+"'>First</a>"
     }
     for (var i = pageIndex - gap; i < pageIndex; i++) {
        if(i>0){
            text+= "<a href='food?page="+i+"&tid="+tid+"&typeId="+type+"'>"+i+"</a>"
        }
    }
     text += "<span>"+pageIndex+"</span>";
     for (var i = pageIndex + 1; i <= pageIndex + gap; i++) {
        if(i<=totalPage){
            text += "<a href='food?page="+i+"&tid="+tid+"&typeId="+type+"'>"+i+"</a>"
        }
    }
     if(pageIndex + gap < totalPage){
         text += "<a href='food?page="+totalPage+"&tid="+tid+"&typeId="+type+"'>Last</a>"
     }
     container.innerHTML = text;
 }
 
 function addToBill(fid,tblid,quantity,price){
     window.location.href = "bill?fid="+fid+"&tid="+tblid+"&quantity="+quantity+"&price="+price;
 }

