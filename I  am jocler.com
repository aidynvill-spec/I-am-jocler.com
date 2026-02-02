<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>I am jocler</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <style>
    body {
      font-family: sans-serif;
      text-align: center;
      margin-top: 50px;
    }
    button {
      font-size: 24px;
      padding: 20px 40px;
      cursor: pointer;
      border-radius: 10px;
      background-color: #4CAF50;
      color: white;
      border: none;
    }
    button:hover {
      background-color: #45a049;
    }
    #videoContainer iframe {
      width: 90%;
      max-width: 480px;
      height: 270px;
      margin-top: 20px;
    }
  </style>
</head>
<body>

<h1>Click the Button!</h1>
<button onclick="playVideo()">Play Video & Speak</button>

<p id="status"></p>
<div id="videoContainer"></div>

<script>
function playVideo() {
  // Speak the phrase
  const msg = new SpeechSynthesisUtterance("I am jocler");
  speechSynthesis.speak(msg);

  // Embed YouTube video inside the page (only once)
  const container = document.getElementById("videoContainer");
  if (!container.innerHTML) {
    container.innerHTML = `
      <iframe 
        src="https://www.youtube.com/embed/twQNJepkPbg?autoplay=1" 
        title="YouTube video" 
        frameborder="0" 
        allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" 
        allowfullscreen>
      </iframe>
    `;
  }

  // Update status text
  document.getElementById("status").innerText = "Playing video...";
}
</script>

</body>
</html>
