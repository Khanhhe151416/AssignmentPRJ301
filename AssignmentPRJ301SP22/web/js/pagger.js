/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function generatePagger(div, pageIndex, totalPage, gap){
    var container = document.getElementById(div);
    
    var text = "";
    if(pageIndex-gap >1){
        text+= "<a href='food?page=1'>First</a>";
    }
    
    for(var i = pageIndex-gap; i < pageIndex; i++){
        if(i>0){
            text += "<a href='food?page="+i+"'>"+i+"</a>";
        }
    }
       text += "<span>"+pageIndex+"</span>"
    for(var i = pageIndex+1; i <= pageIndex+gap; i++){
        if(i<=totalPage){
            text += "<a href='food?page="+i+"'>"+i+"</a>";
        }
    }
    
    if(pageIndex+gap < totalPage){
        text+= "<a href='food?page="+totalPage+"'>Last</a>"
    }
    container.innerHTML = text;
}


