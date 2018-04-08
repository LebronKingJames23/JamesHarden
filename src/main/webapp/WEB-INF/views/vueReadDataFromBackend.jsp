<!DOCTYPE html>  
<html lang="en">  
    <head>  
        <meta charset="UTF-8">  
        <title>helloform_Vue</title>  
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />  
        <script src="${pageContext.request.contextPath}/resource/js/vue.js"></script>
        <script type="text/javascript"
	src="${pageContext.request.contextPath}/resource/js/jquery.js"></script>  
	<script src="${pageContext.request.contextPath}/resource/js/vue-resource.js"></script>
    </head>  
    <body>  
    <div id="demo">  
        <ul>  
          
                <input type="text" v-model="student.name">  
                <input type="text"  v-model="student.password">  
                <button  value="test" onClick="si()">refresh</button>  
          
        </ul>  
    </div>  
        
    <script>
   function si(){
    	new Vue({
    	      el:'#demo',
    	      data:{student:{}},
    	      created:function(){
    	        var url="${pageContext.request.contextPath}/vuedemo";
    	        this.$http.get(url).then(function(data){
    	        	alert(JSON.stringify(data.body.student))
    	        	 var student=data.body.student;
    	             this.student=student;
    	  
    	        })
    	      }
    	     })
    } 
</script>
  
    </body>  
</html>  