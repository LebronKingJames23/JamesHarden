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
            <form @submit.prevent="submit">  
                <input type="text" v-model="student.name">  
                <p>{{student.name}}</p>
                <input type="text"  v-model="student.password">  
                <input type="submit" value="submit">  
            </form>  
        </ul>  
    </div>  
        
    <script>
    var vm = new Vue({  
    	el: '#demo',  
    data:{
            student:{
        }
    },
    methods: {
        submit:function(){
            var formData = JSON.stringify(this.student);
            alert(formData)
            this.$http.post("aa.action",formData).then(function(data){
                
            });
            

        }

    }
    })
</script>
  
    </body>  
</html>  