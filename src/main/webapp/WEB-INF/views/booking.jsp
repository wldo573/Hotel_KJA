<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link href="https://cdn.pixabay.com/photo/2017/08/22/22/11/monogram-2670684_960_720.ico" rel="shortcut icon" type="image/x-icon">
    <title>Hotel-예약관리</title>
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
/*
footer {
bottom: 0; left: 0;
height: 100px;
width: 100%;
background-color:#ffffff;
}*/
p{
	text-align:right;
}
body{
	margin-top:80px;
	background-image:url('https://cdn.pixabay.com/photo/2014/10/16/08/39/bedroom-490779_960_720.jpg');
	width: 100%;
	height: 100vh;
	background-size: cover;
	background-position: center;
}
h3{
margin-top:35px;

}

li{
    list-style:none;
    margin: 20px 20px;
    text-align:left;
 }
 
 .list1,.list2{
     width: 410px;
     height: 430px;
     border: 5px solid #4f556e;
     box-sizing: border-box;
     padding: 10px;
 }
 
 .list3{
    width: 350px;
    height: 600px;
    border: 5px solid #4f556e;
    box-sizing: border-box;
    padding: 10px;
 }
 
.main2_list{
     width: 410px;
     height: 170px;
     border: 5px solid #4f556e;
     box-sizing: border-box ;
     padding: 10px;
     text-align:left;
 }
.day1{
	border:1px solid ;
	border-radius:0px;
	border: none;
	background: transparent;
	border-bottom: #4f556e 1px solid;
	font-position:left;
}
 
.table1{
     float:left;
     margin: 0px 20px 0px 0px;
     
 }
 p{
	margin-top:100px;
	text-align:right;
	color:white;
	font-weight:bold;
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
  .addlist{
	border:1px solid #ffffff;
	border-radius:0px;
	height:400px;
	width:400px;
  }
  
td.td1{
	margin-top:300px;
	border:none;
	background-color:rgba(255,255,255, 0.5);
	width:100%;
	height:50%;
}

</style>
<header>
<h1 style="color:white">Hotel</h1>
</header>
<body>
<a href="logout"><p>로그아웃</p></a>
<table>
<tr>
	<td class="td1">
    <table>
        <th><h2>객실관리</h2></a></th>
        <th><a href="room"><h2>예약관리</h2></th>

    </table>
    <div class="table1">
        <div class="main2_list">
            <h3>예약일자&nbsp<input type="date" id="Day1" class="day1">~<input type="date"id="Day2" class="day1"></h3>
            <h3>객실종류&nbsp
            <select>
            <option value='-'>전체</option>
            <c:forEach items="${roomtype}" var ="room">
            	<option value='${room.typecode}'>${room.name}</option>
            </c:forEach>
            </select><input type=button class=btn2 value="찾기" id="btnFind"><br></h3>
        </div>
        <h3>예약가능</h3>
        <div class="list2">
            <select size=10 style=width:350px; id=selRoom class="addlist">
    		</select><br>
        </div>
    </div>
    <div class="table1">
        <h3>객실명<input type="text" id="txtName"><input type=hidden id=roomcode><input type=hidden id=bookcode></h3>
        <h3>객실종류
        <select size="5" style='width:120px;' id=selType>
    			<c:forEach items="${type}" var="room">
   					<option value='${room.typecode}'>${room.name}</option>
    			</c:forEach>
    	</select><br></h3>
        <h3>*예약인원&nbsp<input type="number" id="txtNum1" min=1 >명</h3>
        <h3>최대인원<input type="number" id="txtNum2" min=1>명</h3>
        <h3>예약기간<input type="date" id="txtDay1">~<input type="date" id="txtDay2"></h3>
        <h3>숙박비총액<input type="text" id="txtPrice" min=1 >원</h3>
        <h3>*예약자명<input type="text" id="txtName1"></h3>
        <h3>*모바일<input type="text" id="txtMobile1"></h3>
        <input type=button value="예약완료" class=btn id="btnUpload">
        <input type=button value="비우기" class=btn id="btnClear">
        <input type=button value="예약취소" class=btn id="btnCancle">
    </div>
    <div class="table1">
        <h3>예약된 객실</h3>
        <div class="list3">
            <select size=15 style="width:300px; height:580;" id="addBook" class="addlist">
    		</select>
    		<br>
        </div>
    </div>
    <td>
<tr>
<body>
</body>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script>
	$(document)
	.on('click','#btnFind',function(){	
		/* $.post("http://localhost:8080/a/getRoomList",{},function(result){
			$('#selRoom').empty();
			$.each(result,function(ndx,value){
				str='<option value="'+value['roomcode']+'">'+value['roomname']+','+value['typename']+','
				+value['howmany']+','+value['howmuch']+'</option>';
			$('#selRoom').append(str);
	    	$('#txtDay1').val($('#Day1').val());
	    	$('#txtDay2').val($('#Day2').val());
				//<option value="2">백두산,Suite Room,8,500000</option>
			});
		},'json')
		 */
		 $('#txtDay1').val($('#Day1').val());
	     $('#txtDay2').val($('#Day2').val());
		$.post("http://localhost:8080/a/addBook",{day1:$('#Day1').val(),day2:$('#Day2').val()},function(result){
			$('#addBook').empty();
			$.each(result,function(ndx,value){
				str='<option value="'+value['roomcode']+','+value['bookcode']+'">'+value['name']+','+value['typename']+','
				+value['howmany']+','+value['max_howmany']+','+value['day1']+','+value['day2']+
				','+value['total']+','+value['username']+','+value['mobile']+'</option>';
				$('#addBook').append(str);
			});
		},'json')
		
		$.post("http://localhost:8080/a/addBooking",{day1:$('#Day1').val(),day2:$('#Day2').val()},function(result){
			$('#selRoom').empty();
			$.each(result,function(ndx,value){
				str='<option value="'+value['roomcode']+'">'+value['name']+','+value['type']+','
				+value['howmany']+','+value['howmuch']+'</option>';
				$('#selRoom').append(str);
			});
		},'json');
		return false;
	})
    .on('click','#selRoom option',function(){
    	let str=$(this).text();
    	let ar = str.split(',');
    	$('#txtName').val(ar[0]);
    	$('#selType option:contains("'+ar[1]+'")').prop('selected',true);
    	$('#txtNum2').val(ar[2]);
    	$('#txtPrice').val(ar[3]);
    	let code=$(this).val();
    	$('#roomcode').val(code);
    	$('#Day1,#Day2').trigger('change');
    	return false;
   })
   
   .on('click','#btnClear',function(){
		$('#txtName,#txtNum1,#txtNum2,#txtDay1,#txtDay2,#txtName1,#txtMobile1,#txtPrice,#roomcode,#selType').val('');
		return false;	
	})

	<%--객실명txtName 종류selType 예약인원txtNum1/최대인원txtNum2 예약기간txtdate1,2 모바일번호Moblie1 예약자명txtName1--%>
	.on('click','#btnUpload',function(){
		let roomcode=$('#roomcode').val();
		let roomname=$('#txtName').val();
		let roomtype=$('#selType option:selected').text();
		let howmany=$('#txtNum1').val();
		let howmany2=$('#txtNum2').val();
		let day1=$('#txtDay1').val();
		let day2=$('#txtDay2').val();
		let mobile=$('#txtMobile1').val();
		let name=$('#txtName1').val();
		let total=$('#txtPrice').val();
		
		if(howmany=='' ||day1=='' ||day2=='' ||mobile=='' ||name==''){
			alert("누락된 값이 있습니다");
			return false;
		}
		console.log("roomcode ["+$('#roomcode').val()+"]");

		let bookcode=$('#bookcode').val();
		if(bookcode!==''){	
			$.post('http://localhost:8080/a/updateBook',
				{bookcode:bookcode,howmany:howmany,name:name,mobile:mobile},
				function(result){	
					if(result=='ok'){
						location.reload();
						console.log();
					}
				},'text');
		}else{
			$.post('http://localhost:8080/a/getBook',
					{roomcode:$('#roomcode').val(),howmany:$('#txtNum1').val(),
					day1:$('#txtDay1').val(),day2:$('#txtDay2').val(),total:$('#txtPrice').val(),
					name:$('#txtName1').val(),mobile:$('#txtMobile1').val()},
				function(result){
					console.log(result);
					if(result == 'ok'){
						ap ='<option value="'+$('#roomcode').val()+'">'
						+$('#txtName').val()+','
						+$('#selType option:selected').text()+','
						+$('#txtNum1').val()+','
						+$('#txtDay1').val()+','					
						+$('#txtDay2').val()+','
						+$('#txtName1').val()+','
						+$('#txtMobile1').val()+'</option>';
						$('#addBook').append(ap);
						$('#btnClear').trigger('click');
						$("#selRoom option:selected").remove();
					}
				})
		}
	})
	
	.on('change','#Day1,#Day2',function(){
		let day11 = $('#Day1').val();
		let day22 = $('#Day2').val();
		if(day11 == '' || day22 == ''){return false;}
		day11 = new Date(day11);
		day22 = new Date(day22);
		if(day11 > day22){
			alert('체크인날짜가 체크아웃보다 나중일 수 없습니다.');
			return false;
		}
		let ms = Math.abs(day22-day11);
		let days=Math.ceil(ms/(1000*60*60*24));
		let total=days*parseInt($('#txtPrice').val());
		$('#txtPrice').val(total);
		return false;
	})
	
	.on('click','#addBook option',function(){
		let str=$(this).text();
		let ar=str.split(',');
		$('#txtName').val(ar[0]);
		$('#selType option:contains("'+ar[1]+'")').prop('selected','true');
		$('#txtNum1').val(ar[2]);
		$('#txtNum2').val(ar[3]);
    	$('#txtDay1').val(ar[4]);
    	$('#txtDay2').val(ar[5]);
    	$('#txtPrice').val(ar[6]);
    	$('#txtName1').val(ar[7]);
    	$('#txtMobile1').val(ar[8]);
    	let code=$(this).val();
    	ar=code.split(',');
    	$('#roomcode').val(ar[0]);
    	$('#bookcode').val(ar[1]);
    	return false;	
	})
	.on('click','#btnCancle',function(){
		console.log("roomcode [ "+$('#roomcode').val()+"]");
		$.post('http://localhost:8080/a/deleteBook',{roomcode:$('#roomcode').val()},
				function(result){
			
			console.log("aa");
			if(result=="ok"){
				$('#btnClear').trigger('click');//입력란 비우기
				console.log("bb");
				$('#addBook option:selected').remove();//room리스트에서 제거
			}
		},'text');
		return false;
	})
</script>

</html>