// script.js
document.addEventListener("DOMContentLoaded", function () {
    document.querySelector("#changeBtn").addEventListener("click", function () {
        let ps = document.querySelectorAll("p");
        for (let i = 0; i < ps.length; i++) {
            ps[i].style.color = "black";
        }
    });

    $("#changeBtn2").on("click", function () {
        $("p").css("color", "red");
    });
});
