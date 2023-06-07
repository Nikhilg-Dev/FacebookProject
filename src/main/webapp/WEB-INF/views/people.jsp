<style>
    /* Other styles */

    body {
        background-image: linear-gradient(135deg, #405DE6, #5851DB, #833AB4, #C13584, #E1306C, #FD1D1D);
        background-repeat: no-repeat;
        background-size: cover;
    }

    .person-container {
        margin-top: 20px;
        text-align: center;
        color: #FFFFFF;
        animation: colorAnimation 3s infinite;
        font-family: 'Arial', sans-serif;
        font-size: 32px;
        letter-spacing: 1px;
    }

    @keyframes colorAnimation {
        0% { color: #FFFFFF; }
        50% { color: #FFD700; }
        100% { color: #FFFFFF; }
    }
</style>

<body>
<!-- Other HTML content -->

<div class="person-container">
    <p>${person.name}</p>
    <p>${person.email}</p>
</div>

<!-- Other HTML content -->
</body>
