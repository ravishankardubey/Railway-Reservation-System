

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<script language="javascript" type="text/javascript" src="actb.js"> </script>
<script language="javascript" type="text/javascript" src="common.js"> </script>
<script language="javascript" type="text/javascript" src="jquery-1.7.2.min.js"> </script>
<script>
    $(document).ready(function(){

        var arr=new Array();
        $.ajax({
            type:"post",
            url:"fetch_all_cities.jsp",
            data:"aa",
            success:function(msg)
            {
                $.each(msg.split("#"),function(index,value){
                    arr[index]=value;
                });
            }
           
        });
        
        actb(document.getElementById("auto_complete"), arr);
    });
</script>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <input type="text" name="auto_complete" id="auto_complete"/>
    </body>
</html>
