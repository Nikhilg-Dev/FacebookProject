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
        margin-bottom: 20px;
    }

    a {
        display: inline-block;
        margin-bottom: 10px;
        padding: 10px 20px;
        text-decoration: none;
        background-color: #1877f2;
        color: #ffffff;
        border-radius: 4px;
        font-size: 18px;
        transition: background-color 0.3s;
        animation: pulse 1.5s infinite;
    }

    a:hover {
        background-color: #1559c1;
    }

    @keyframes pulse {
        0% {
            transform: scale(1);
        }
        50% {
            transform: scale(1.05);
        }
        100% {
            transform: scale(1);
        }
    }
</style>

<body>
<h1>
    hi this is home page
</h1>
<a href="/login">Login</a>
<br>
<a href="/signUp">SignUp</a>
<br>
<h3>${error}</h3>
</body>
