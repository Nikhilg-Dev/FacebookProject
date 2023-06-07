<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
    body {
        background-image: linear-gradient(135deg, #405DE6, #5851DB, #833AB4, #C13584, #E1306C, #FD1D1D);
        font-family: Arial, sans-serif;
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        height: 100vh;
    }

    h1 {
        color: #FFFFFF;
        font-size: 36px;
        margin-top: 40px;
        text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.4);
    }

    .button-container {
        margin-top: 40px;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .button-container a {
        display: inline-block;
        margin: 10px;
        padding: 10px 20px;
        text-decoration: none;
        background-color: #007bff;
        color: #ffffff;
        border-radius: 4px;
        font-size: 18px;
        transition: background-color 0.3s;
        animation: dance 2s infinite;
    }

    .button-container a:hover {
        background-color: #0056b3;
    }

    @keyframes dance {
        0% {
            transform: rotate(0deg);
        }
        25% {
            transform: rotate(-5deg);
        }
        50% {
            transform: rotate(5deg);
        }
        75% {
            transform: rotate(-5deg);
        }
        100% {
            transform: rotate(0deg);
        }
    }

    /* List Styles */
    .list-container {
        margin-top: 20px;
    }

    .list-link {
        display: block;
        color: #333333;
        text-decoration: none;
        font-size: 20px;
        padding: 10px;
        border-radius: 4px;
        transition: background-color 0.3s;
        margin-bottom: 10px;
        background-color: rgba(255, 255, 255, 0.9);
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
    }

    .list-link:hover {
        background-color: rgba(255, 255, 255, 1);
    }
</style>

<body>
<h1>Hi ${personObj.name}</h1>
<div class="button-container">
    <a href="/Edit/${personObj.id}">Edit info</a>
    <a href="/logout">Logout</a>
    <a href="/showAllPerson">Explore people</a>
</div>

<div class="list-container">
    <c:forEach items="${mylist}" var="list">
        <a href="/people/${list.id}" class="list-link">${list.name}</a>
    </c:forEach>
</div>
</body>
