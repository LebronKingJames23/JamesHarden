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
    <div id="selectdemo">
        <ul>
            <select  >
                <option  v-for="student in students">{{student.name}}</option>
            </select>
        </ul>
   </div>
   <form action="${pageContext.request.contextPath}/abc.action">
   <div id="jsonvue">
       <ul>
           <select  >
               <option  v-for="student in students"  v-bind:value="student.password">{{student.name}}</option>
           </select>
       </ul>
   </div>
       <input type="submit"/>
   </form>
    <script>
        $(function(){
            new Vue({
                el:'#selectdemo',
                data:{students:[]},
                created:function(){
                    var url="${pageContext.request.contextPath}/selectvue";
                    this.$http.get(url).then(function(data){
                        this.students=data.body;
                    })
                }
            })
            new Vue({
                el:'#jsonvue',
                data:{students:[]},
                created:function(){
                    var url="${pageContext.request.contextPath}/jsonvue";
                    this.$http.get(url).then(function(data){
                        alert(data.body);
                        this.students=data.body.aa;

                    })
                }
            })

        })
  function si(){
    	new Vue({
    	      el:'#demo',
    	      data:{student:{}},
    	      created:function(){
    	        var url="${pageContext.request.contextPath}/vuedemo";
    	     this.$http.get(url).then(function(data){
    	        	//alert(JSON.stringify(data.body.student))
    	        	 var student=data.body.student;
    	             this.student=student;
    	  
    	        })
    	      }
    	     })
    }
</script>
  
    </body>  
</html>  