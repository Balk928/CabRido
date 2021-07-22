<%@page import="com.unisoft.*"%>
<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    int template=1;
    HashMap<String,String> errors = new HashMap<String,String>();
    String userId = "";
    String password = "";
    String cpassword = "";
    String email = "";
    String name = "";
    String secretQuestion = "";
    String answer = ""; 
    if(request.getMethod().equals("POST")){
        userId = request.getParameter("userId");
        password = request.getParameter("password");
        cpassword = request.getParameter("cpassword");
        email = request.getParameter("email");
        name = request.getParameter("name");
        secretQuestion = request.getParameter("secretQuestion");
        answer = request.getParameter("answer");
        UserInfo info = new UserInfo(userId, password, cpassword, "Member", email, name, secretQuestion, answer);
        //errors = ValidationManager.validateUserInfo(info);
        if(errors.size()==0){
            if(DBManager.registerUser(info)){
                //MailManager.sendRegistrationMail(email);
                template=2;
            }
        }
    }
%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title></title>
        <meta name="keywords" content="" />
        <meta name="description" content="" />
        <link href="styles/default.css" rel="stylesheet" type="text/css" media="all" />
        <style>
            #content{
                width: 80%; 
                margin: auto;
                padding: 40px;
                min-height: 350px;
            }
            img{
                border-radius: 40px;
            }
        </style>
    </head>
    <body>
        <div id="header-wrapper">
            <div id="header" class="container">
                <div id="logo">
                    <h1><a href="index.jsp">Ecab System</a></h1>
                </div>
                <div id="menu">
                    <ul>
                        <li class="first active"><a href="index.jsp" accesskey="1" title="">Homepage</a></li>
                        <li><a href="login.jsp" accesskey="2" title="">Login</a></li>
                        <li><a href="register.jsp" accesskey="3" title="">Register</a></li>
                        <li><a href="viewcars.jsp" accesskey="4" title="">View Cars</a></li>

                    </ul>
                </div>
            </div>
        </div>
        <div id="content">
                <% if(template==1) { %>
                <form style="width: 600px" action="register.jsp" method="POST">
                    <fieldset>
                        <legend>Registration Form</legend>
                    <table border="0" cellpadding="10">
                        <tbody>
                            <tr>
                                <td>User Name : </td>
                                <td>
                                    <input type="text" name="userId" value="<%= userId%>" />
                                    <% if(errors.get("userId")!=null){%><span class="error"><%= errors.get("userId")%></span><% } %>
                                </td>
                            </tr>
                            <tr>
                                <td>Password : </td>
                                <td>
                                    <input type="password" name="password" value="<%= password%>" />
                                    <% if(errors.get("password")!=null){%><span class="error"><%= errors.get("password")%></span><% } %>
                                </td>
                            </tr>
                           <tr>
                                <td>Confirm Password : </td>
                                <td>
                                    <input type="password" name="cpassword" value="<%= cpassword%>" >
                                    <% if(errors.get("cpassword")!=null){%><span class="error"><%= errors.get("cpassword")%></span><% } %>
                                </td>
                            </tr> 
                            <tr>
                                <td>E-Mail ID : </td>
                                <td>
                                    <input type="text" name="email" value="<%= email%>" />
                                    <% if(errors.get("email")!=null){%><span class="error"><%= errors.get("email")%></span><% } %>
                                </td>
                            </tr>
                            <tr>
                                <td>Name : </td>
                                <td>
                                    <input type="text" name="name" value="<%= name%>" />
                                    <% if(errors.get("name")!=null){%><span class="error"><%= errors.get("name")%></span><% } %>
                                </td>
                            </tr>
                            <tr>
                                <td>Secret Question : </td>
                                <td>
                                    <textarea name="secretQuestion" rows="4" cols="30"><%= secretQuestion%></textarea>
                                    <% if(errors.get("secretQuestion")!=null){%><span class="error"><br><%= errors.get("secretQuestion")%></span><% } %>
                                </td>
                            </tr>
                            <tr>
                                <td>Answer : </td>
                                <td>
                                    <input type="text" name="answer" value="<%= answer%>" />
                                    <% if(errors.get("answer")!=null){%><span class="error"><%= errors.get("answer")%></span><% } %>
                                </td>
                            </tr>                            
                            <tr>
                                <td colspan="2" align="right">
                                    <input type="submit" value="Register" />
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    </fieldset>
                </form>
                <% } %>
                <% if(template==2) { %>
                <h2>
                    Congratulations
                    <br>
                    You are successfully registered with OnlineContacts.com. 
                </h2>
                <p>
                    A Mail has been sent to your mail ID. Please click the activation link for unlocking your account.
                    <br><br><br>
                    <a class="link-style" href="login.jsp">Login</a>
                </p>
                <% } %>
        </div>

        <div id="footer">
            <p>&copy; Untitled. All rights reserved. Design by <a href="http://templated.co" rel="nofollow">TEMPLATED</a>. Photos by <a href="http://fotogrph.com/">Fotogrph</a>.</p>
        </div>
    </body>
</html>

