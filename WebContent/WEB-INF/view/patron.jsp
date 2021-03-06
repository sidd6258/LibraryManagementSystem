<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


<title>Patron Profile</title>

<script type="text/javascript">
var line;
var id;
var co;
var books=[];
$(document).ready(function(){
	console.log("ready");
	if(books.length<=0)
	 line=document.getElementById("line");
	 co=document.getElementById("checkout");
	 line.parentNode.removeChild(line);
	 co.parentNode.removeChild(co);
	 //var events = $._data(document.getElementById('textDiv'), "events");
});
var i=0;
var a=[];
function changeAction() {
	document.searchForm.action = "${pageContext.request.contextPath}/book/patron/doSearch";
	document.forms["searchForm"].submit();	
}
function getBook(bookId) {
	location.pathname = "${pageContext.request.contextPath}/book/getBook/"+bookId;
}
function add(image,title,bookid,id)
{
	var book1=books;
	var l=book1.length;
	id=id;
	console.log(bookid);
	console.log(books);
	var flag="false";
	var menu=document.getElementById("books");
	console.log(menu);
	console.log("Books length: "+books.length);
	if(books.length>0 && books.length<=5)
		{
			line.parentNode.removeChild(line);
			 co.parentNode.removeChild(co);
/* 			for(i=0;i<books.length;i++)
				{ */
	for(i=0;i<books.length;i++)
				{
		if(books[i].id==bookid)
		{
		
		console.log(books[i].id);
		alert("Book Already in cart");
		menu.appendChild(line);
		menu.appendChild(co);
		flag="true";
		}
		
				}
					if(flag == "false")	
						{

						var book={};
						book.title=title;
						book.id=bookid;
						books.push(book);
						
						var a="data:image/jpeg;base64,"+image;
						var imgv="'"+a+"'";
							
							var num=document.getElementById("cart");
							var li=document.createElement("li");
							var span=document.createElement("span");
							span.className="item";
							var span1=document.createElement("span");
							span1.className="item-left";
							var img=document.createElement("img");
							img.setAttribute('src',a);
							img.style.height="10px";
							img.style.width="10px";
							
							var span2=document.createElement("span");
							span2.className="item-info";
							var span3=document.createElement("span");
							span3.innerHTML=title;
							span2.appendChild(span3);
							span1.appendChild(img);
							span1.appendChild(span2);
							span.appendChild(span1);
							li.appendChild(span);
							var span4=document.createElement("span");
							span4.className="item-right";
							var b=document.createElement("button");
							b.className="btn btn-xs btn-danger pull-right";
							b.innerHTML="x";
							b.onclick = function() { menu.removeChild(li);books.pop(book); };
							span4.appendChild(b);
							span.appendChild(span4);							
							menu.appendChild(li);
							num.text="Cart";
							$("#cart").prepend("<span class=\"glyphicon glyphicon-shopping-cart\"></span>");
							$("#cart").append("<span class=\"caret\"></span>");
							line.className="divider";
							line.id="line";
							co.className="text-center";
							co.id="checkout"
							menu.appendChild(line);
							menu.appendChild(co);
						
					
/* } */	}			
		}
	else if(book1.length>=5)
		{
		alert("Can Only add 5 books at a time");
		}
	else
		{
		
	var book={};
	book.title=title;
	book.id=bookid;
	books.push(book);
	
	
	console.log("in");
	var a="data:image/jpeg;base64,"+image;
	var imgv="'"+a+"'";
		
		var num=document.getElementById("cart");
		var li=document.createElement("li");
		var span=document.createElement("span");
		span.className="item";
		var span1=document.createElement("span");
		span1.className="item-left";
		var img=document.createElement("img");
		img.setAttribute('src',a);
		img.style.height="10px";
		img.style.width="10px";
		
		var span2=document.createElement("span");
		span2.className="item-info";
		var span3=document.createElement("span");
		span3.innerHTML=title;
		span2.appendChild(span3);
		span1.appendChild(img);
		span1.appendChild(span2);
		span.appendChild(span1);
		li.appendChild(span);
		var span4=document.createElement("span");
		span4.className="item-right";
		var b=document.createElement("button");
		b.className="btn btn-xs btn-danger pull-right";
		b.innerHTML="x";
		b.onclick = function() { menu.removeChild(li);books.pop(book); };
		span4.appendChild(b);
		span.appendChild(span4);
		
		menu.appendChild(li);
		num.text="  cart";
		$("#cart").prepend("<span class=\"glyphicon glyphicon-shopping-cart\"></span>");
		$("#cart").append("<span class=\"caret\"></span>");
		line.className="divider";
		co.className="text-center";
		menu.appendChild(line);
		menu.appendChild(co);
		
		}	
}

function checkout()
{
	
	console.log("in");
	$.ajax({
		 type : "POST",
		    url : "${pageContext.request.contextPath}/patron/checkout/${user.sjsuId}",
		    datatype: 'json',
		    data : {
		        myArray: JSON.stringify(books)
		        },
		    success : function(data) {
		    	console.log("in"+data);
		    	if(data=="limit")
		    		{
		    			alert("cant checkout more than 10 books");
		    		}
		    	else if(data=="day limit")
		    		{
		    			alert("cant checkout more than 5 books in a day");
		    		}
		    	else{
		    	 	location.pathname = "${pageContext.request.contextPath}/patron/"+data+"/${user.sjsuId}"; 
		   		    }
		    }
		    
	});
}
function changeMethod(action_name) {		
	if (action_name == "") {
		location.pathname = "${pageContext.request.contextPath}/patron/login/${user.email}/";			
	}		
}
</script>

</head>
<body>
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">Sjsu Library</a>
    </div>
    <ul class="nav navbar-nav">


      <li class="active"><a onclick="changeMethod('')">Home</a></li>  
      <li ><a href="${pageContext.request.contextPath}/patron/return/${user.sjsuId}">Return Book</a></li> 

    </ul>
    <form class="navbar-form navbar-left" name="searchForm" method="post">
      <div class="form-group">
        <input type="text" class="form-control" placeholder="Search" id="search" name="search">
      </div>
          <ul class="nav navbar-nav navbar-right">
      <li class="active"><a href="${pageContext.request.contextPath}/">Log Out</a></li> 
    </ul>
      <button type="button" onclick="changeAction()" class="btn btn-default">Search</button>
    </form>
    <ul class="nav navbar-nav navbar-right">
      <li><a onclick="changeMethod('')"><span class="glyphicon glyphicon-user"></span> ${user.firstName }</a></li>
      <li class="dropdown">
          <a href="#" id="cart" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"> <span class="glyphicon glyphicon-shopping-cart"></span> Cart<span class="caret"></span></a>
          <ul class="dropdown-menu dropdown-cart" role="menu" id="books">
          		<li class="divider" id="line"></li>
              	<li><a class="text-center" id="checkout" onclick="checkout()" >CheckOut</a></li>
          </ul>
        </li>
    </ul>
  </div>
</nav>
<h1> Available Books</h1><br>

	<c:forEach items="${books}" var="current">	
			<div class="col-sm-4">
				<img src="data:image/jpeg;base64,${current.image}" alt="" width="200" height="200" />
				<br>${current.author}
				<br><button type="button" id="add${current.bookId}" onclick="event.preventDefault();add('${current.image}','${current.title}','${current.bookId}','${user.sjsuId}')" class="btn btn-default">Add to Cart</button>
				</div>
		</c:forEach>


</body>
</html>