$(document).ready(function(){
	$('#btnStart').on('click', function(){		
		$.ajax({
			url: '/api/catch',
			type: 'POST',
			data: {red:6789,grace:'CATCH'}
		}).done(function(data){
			console.log(data.id);
		});
	});


    $('#signup').on('click', function(){
    	 $('.form').css("visibility", "visible").slideToggle();
    });

    $('#login').on('click', function(){
        $('.logform').css("visibility", "visible").slideToggle();
    });


    $('#cancel').on('click', function(){
        $('.form').css("visibility","hidden");
    });
    
    $('#exit').on('click', function(){
        $('.logform').css("visibility","hidden");
    });

    $('#submit').on('click', function(){
        $('.form').css("visibility","hidden");
        var valid = signup_validateForm();
        if (valid == false)
        {
            return;
        }
        var dataToSend = { fname: $('[name=fname]').val(), lname: $('[name=lname]').val(), email: $('[name=email]').val(), pword: $('[name=pword]').val(), action:"signup"};
        $.ajax({
            url: '/api/catch',
            type: 'POST',
            data: dataToSend
        }).done(function(data){
            console.log(data);
        });
    });
    
    
    $('#enter').on('click', function(){
        $('.logform').css("visibility","hidden");
        // var valid = login_validateForm();
         // if (valid == false)
        // {
              // return;
        // }
        var dataToSend = {emailin: $('[name=emailin]').val(), pwordin: $('[name=pwordin]').val()};
        $.ajax({
            url: '/users/login',
            type: 'POST',
            data: dataToSend
        }).done(function(data){
            if ((data.emailin == dataToSend.emailin) && (data.pword == dataToSend.pword))
                window.location = "http://localhost:3000/clucks";
            //    alert ("Hello");
            //else
            if (data.error)
                alert ("Record not found. Please sign up");
        });
    });
    





    function signup_validateForm()
    { 
        var fname= $('[name=fname]').val();
        var lname= $('[name=lname]').val();
        var email= $('[name=email]').val();
        var pword= $('[name=pword]').val();
        var atpos=email.indexOf("@");
        var dotpos=email.lastIndexOf(".");
        var valid = true

        if (fname==null || fname=="")
        {
            alert("First name must be filled");
            valid = false;
        }

        if (lname==null || lname=="")
        {
            alert("Last name must be filled");
            valid = false;
        }

        if (pword==null || pword=="")
        {
            alert("Password must be filled")
            valid = false;
        }

        if (atpos<1 || dotpos<atpos+2 || dotpos+2>=email.length)
        {
            alert("Not a valid email address");
            valid = false;

        }

        return valid;
    }


 
    

    function login_validateForm()
    { 
        var emailin= $('[name=emailin]').val();
        var pwordin= $('[name=pwordin]').val();
        var atpos=email.indexOf("@");
        var dotpos=email.lastIndexOf(".");
        var valid = true

        if (pwordin==null || pwordin=="")
        {
            alert("Password must be filled")
            valid = false;
        }

        if (atpos<1 || dotpos<atpos+2 || dotpos+2>=email.length)
        {
            alert("Not a valid email address");
            valid = false;

        }

        return valid;
     }
});
