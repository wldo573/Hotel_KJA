<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link href="https://cdn.pixabay.com/photo/2017/08/22/22/11/monogram-2670684_960_720.ico" rel="shortcut icon" type="image/x-icon">
    <title>Hotel-객실관리</title>
</head>
<style>
header {
text-align:left;
position: fixed;
top: 0; 
left: 0;
height: 100px;
width: 100%;
background-color:rgba(79, 85, 110, 0.9);
}
head.logout{
	background-position: top;
	background-position: right;
}
h2{
	margin: 0px 0px 0px 30px;
	text-align:center;
}
h3{
	text-align:left;
}
a{
	text-align:center;
}
p{
	margin-top:100px;
	text-align:right;
	color:white;
	font-weight:bold;
}
body{
	margin-top:80px;
   	background-image:url('https://cdn.pixabay.com/photo/2014/07/21/19/20/lobby-398845_960_720.jpg');
   	background-repeat: repeat-x;
    background-repeat: repeat-y;
    background-position: right;
    background-attachment: fixed;
}
.loginlist{
	border:1px solid ;
	border-radius:0px;
	height:50px;
	width:250px;
	border: none;
	background: transparent;
	border-bottom: #4f556e 1px solid;
	font-position:left;
}
.loginlist1{
	position:left;
	border:1px solid ;
	border-radius:0px;
	height:80px;
	width:250px;
	border: none;
	background: transparent;
	font-position:left;
	
}
.loginlist2{
	border:1px solid ;
	border-radius:0px;
	height:50px;
	width:250px;
	border: none;
	background: transparent;
}
.container {
  width: 100%;
  height: 100%;
  text-align: center;
  position: relative;
  z-index: 1;
}
.container::after {
  width: 100%;
  height: 100%;
  content: "";
  background: url("./images/sunrise.jpg");
  position: absolute;
  top: 0;
  left: 0;
  z-index: -1;
  opacity: 0.5;
}

li{
    list-style:none;
    margin: 20px 20px;
    text-align:left;
 }
 .list1,.list2{
     width: 300px;
     height: 400px;
     border: 5px solid rgb(79, 85, 110);
     box-sizing: border-box;
     padding: 10px;
 }
 .list3{
    width: 300px;
    height: 300px;
    border: 5px solid rgb(255, 255, 255);
    box-sizing: border-box;
    padding: 10px;
 }
 .main2_list{
     width: 410px;
     height: 170px;
     border: 5px solid rgb(255, 255, 255);
     box-sizing: border-box ;
     padding: 10px;
 }
     
 .table1{
     float:left;
     margin: 0px 20px 0px 0px;
 }
 .btn{
    padding: 1em 2em;
  	color: #000000;
    margin-top:2rem;
    font-weight: bold;
    font-size: 0.678rem;
    letter-spacing: 2px;
    text-transform: uppercase;
  	background: white;
  	background-position: 1% 50%;
  	background-size: 400% 300%;
  	border: 3px solid #4f556e;
  	cursor:pointer;
  }
td.td1{
	margin-top:150px;
	border:none;
	background-color:rgba(255,255,255, 0.5);
	width:100%;
	height:50%;
}
</style>
<header>
<h1 style="color:white;margin-left:30px;">Hotel</h1>
</header>
<body>
<a href="logout"><p>로그아웃</p></a>
<table>
<tr>
	<td class="td1">
    <table>
        <tr>
        	<th><a href="booking"><h2>객실관리</h2></a></th>
        	<th><h2>예약관리</h2></th>
            
        </tr>
    </table>
    <div class="table1">
        <table name=1>
            <tr>
                <td>
                    <h3>객실목록</h3>
                    <div class="list1">
                        <select size=10 style='width:250px;height: 300px;' id=selRoom class="loginlist2">
    					<%-- <c:forEach items="${list}" var="room">
   								<option value='${room.roomcode}'>${room.roomname},${room.typename},${room.howmany},${room.howmuch}</option>
    						</c:forEach>--%>
    					</select>
                    </div>
                </td>
            </tr>
        </table>
    </div>
    <div class="table1">
        <table>
            <tr>
                <td>
                    <h3 style='letter-spacing:10px'>객실이름<input type=textbox id=txtName class="loginlist"><input type=hidden id=roomcode></h3>
                    <h3 style='letter-spacing:10px'>객실분류&nbsp&nbsp&nbsp
                        <select size="5" style='width:180px;' id=selType class="loginlist1">
    						<c:forEach items="${type}" var="roomtype">
   								<option value='${roomtype.typecode}'>${roomtype.name}</option>
    						</c:forEach>
    					</select><br>
                    </h3>
                    <h3>숙박가능인원<input type=number id=txtNum class="loginlist">명<br></h3>
                    <h3 style='letter-spacing:10px'>1박요금<input type=textbox id=txtPrice class="loginlist">원<br></h3>
                    <input type=button value="등록" id=btnAdd class=btn>&nbsp;
                    <input type=button value="삭제" id=btnDelete class=btn>&nbsp;
                    <input type=button value="Clear" id=btnEmpty class=btn>
                </td>
            </tr>
        </table>
    </div>
	</td>
</tr>
</body>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script>
	$(document)
	.ready(function(){
		console.log('ready');
		$.post("http://localhost:8080/a/getRoomList",{},function(result){
			console.log(result);
			$.each(result,function(ndx,value){
				str='<option value="'+value['roomcode']+'">'+value['roomname']+','+value['typename']+','
				+value['howmany']+','+value['howmuch']+'</option>';
			$('#selRoom').append(str);
				//<option value="2">백두산,Suite Room,8,500000</option>
			});
		},'json');
	})
    .on('click','#selRoom option',function(){
    	let str=$(this).text();
    	let ar = str.split(',');
    	$('#txtName').val(ar[0]);
    	$('#selType option:contains("'+ar[1]+'")').prop('selected','true');
    	$('#txtNum').val(ar[2]);
    	$('#txtPrice').val(ar[3]);
    	let code=$(this).val();
    	$('#roomcode').val(code);
    	return false;
   })
   
   .on('click','#btnEmpty',function(){
		$('#txtName,#txtNum,#txtPrice,#roomcode,#selType').val('');
		return false;	
	})
	
	.on('click','#btnDelete',function(){
		console.log("roomcode [ "+$('#roomcode').val()+"]");
		$.post('http://localhost:8080/a/deleteRoom',{roomcode:$('#roomcode').val()},
				function(result){
			console.log(result);
			if(result=="ok"){
				$('#btnEmpty').trigger('click');//입력란 비우기
				$('#selRoom option:selected').remove();//room리스트에서 제거
			}
		},'text');
		return false;
	})
	
	.on('click','#btnAdd',function(){
		let roomname=$('#txtName').val();
		let roomtype=$('#selType').val();
		let howmany=$('#txtNum').val();
		let howmuch=$('#txtPrice').val();
		
		if(roomname=='' || roomtype=='' || howmany=='' || howmuch==''){
			alert("누락된 값이 있습니다");
			return false;
		}

		let roomcode=$('#roomcode').val();
		if(roomcode==''){//insert
			$.post('http://localhost:8080/a/addRoom',
				{roomname:roomname,roomtype:roomtype,howmany:howmany,howmuch:howmuch},
				function(result){
					if(result=='ok'){
						location.reload();
					}
				},'text');
		}else{//update
			$.post('http://localhost:8080/a/updateRoom',
					{roomcode:roomcode,roomname:roomname,
					roomtype:roomtype,howmany:howmany,
					howmuch:howmuch},
					function(result){
						if(result=='ok'){
							location.reload();
						}
					},'text');
		}
			});
</script>
</html>