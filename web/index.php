<?php
require_once($_SERVER['DOCUMENT_ROOT'] . "/bullet_hell/web/src/php/utils.php");
if (!is_logged_in()) {
    header("Location: ./login/login.php");
}
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bullet Hell - The Game</title>
    <?php require_once($_SERVER['DOCUMENT_ROOT'] . "/bullet_hell/web/src/php/links.php"); ?>
</head>

<body>
    <?php include($_SERVER['DOCUMENT_ROOT'] . "/bullet_hell/web/src/php/header.php"); ?>
    <div class="hero-content container fade-in pixel-font">
        <div class="row">
            <h1 class="text-center my-5 font-page-title">Welcome!</h1>
            <img src="src/images/logo/logoSquare10x.png" alt="" class="anti-alias mx-auto w-50 my-3">
            <h1 class="text-center my-5 bullet-hell-title">Bullet Hell</h1>

        </div>
        <div class="row">
            <p class="text-center about-game-section w-50 mx-auto font-normal"><i>With impeccable symmetry, you can
                    still get lucky. With enough time though, the stronger warrior will prevail.
                </i></p>
        </div>
        <div class="row justify-content-center"> <div class="col-lg-8 col-md-10 col-12"> <div class="ratio ratio-4x3 video-container mx-auto my-3">
                    <video autoplay loop muted class="ratio-item"> <source src="src/videos/gameplayFootage.mp4" type="video/mp4">
                        Your browser does not support the video tag.
                    </video>
                 </div>
                 <p class="text-center about-game-section font-normal"><i>Two players trying their luck</i></p>
            </div>
        </div>
        <div class="row">
            <div class="about-game-section mx-auto">
                <h2 class="text-left font-title">The game</h2>
                <hr>
                <p class="text-justify font-normal">Bullet Hell is a 2D, 1v1 platformer shooter. The aim of the game is
                    for players to test their skills in a local multiplayer environment, where one player uses a
                    keyboard and mouse and the other player uses a connected gamepad for control. The game is designed
                    in a pixelart style, with all visual elements created by a member of the development team, ensuring
                    a consistent and unique look.</p>
                <p class="font-normal">The gameplay focuses on quick reflexes and tactical thinking. Players have a wide
                    arsenal of weapons to choose from, including both melee (e.g. katana, scythe, knife) and ranged
                    (e.g. pistol, musket, shotgun, kunai). Apart from basic movement options (left and right, jumping,
                    ladder climbing), there are no special abilities, so players must rely solely on the effective use
                    of weapons and the opportunities provided by the maps.</p>
            </div>
        </div>
        <div class="row">
            <div class="about-game-section mx-auto">
                <h2 class="font-title">Inspiration</h2>
                <hr>
                <p class="text-right font-normal">LORN's discography and music video for Weigh Me Down - the
                    slaughterhouse, and the overall industrial, bleak aesthetics<br>
                    Hotline Miami - pixelart, violence, adrenaline, directness towards player<br>
                    Tekken - Split-screen, local co-op, fighting game<br>
                    Drifters - Nobunaga's character and castle<br>
                    Warframe - for the idea of over-the-top weapons and a bit of parkour implementation, and the
                    high-and-mighty tone
                </p>
            </div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>