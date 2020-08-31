document.addEventListener("DOMContentLoaded", function(){
    const canvasEl = document.getElementById("mycanvas");
    
    canvasEl.width = 500;
    canvasEl.height = 500;

    const ctx = canvasEl.getContext("2d");
    
    ctx.fillStyle = "green";
    ctx.fillRect(0, 0, 500, 500);

    ctx.beginPath();
    ctx.arc(200, 2000, 50, 0, 2 * Math.PI, true);
    ctx.strokeStyle = "black";
    ctx.lineWidth = 5;
    ctx.stroke();
    ctx.fillStyle = "blue";
    ctx.fill();
});
